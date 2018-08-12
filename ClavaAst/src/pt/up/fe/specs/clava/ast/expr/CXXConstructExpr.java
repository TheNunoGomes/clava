/**
 * Copyright 2016 SPeCS.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on
 * an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations under the License. under the License.
 */

package pt.up.fe.specs.clava.ast.expr;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import org.suikasoft.jOptions.Datakey.DataKey;
import org.suikasoft.jOptions.Datakey.KeyFactory;
import org.suikasoft.jOptions.Interfaces.DataStore;

import com.google.common.base.Preconditions;

import pt.up.fe.specs.clava.ClavaNode;
import pt.up.fe.specs.clava.ast.expr.enums.ConstructionKind;
import pt.up.fe.specs.clava.ast.expr.enums.ValueKind;
import pt.up.fe.specs.clava.ast.type.NullType;

/**
 * Represents a call to a C++ constructor.
 * 
 * @author JoaoBispo
 *
 */
public class CXXConstructExpr extends Expr {

    /// DATAKEYS BEGIN

    public final static DataKey<Boolean> IS_ELIDABLE = KeyFactory.bool("isElidable");

    /**
     * Determine whether this expression is a default function argument. Default arguments are implicitly generated in
     * the abstract syntax tree by semantic analysis for function calls, object constructions, etc. in C++. Default
     * arguments are represented by CXXDefaultArgExpr nodes, however this field looks through any implicit casts to
     * determine whether the expression is a default argument.
     */
    public final static DataKey<Boolean> IS_DEFAULT_ARGUMENT = KeyFactory.bool("isDefaultArgument");

    public final static DataKey<Boolean> REQUIRES_ZERO_INITIALIZATION = KeyFactory.bool("requiresZeroInitialization");

    public final static DataKey<Boolean> IS_LIST_INITIALIZATION = KeyFactory.bool("isListInitialization");

    public final static DataKey<Boolean> IS_STD_LIST_INITIALIZATION = KeyFactory.bool("isStdInitListInitialization");

    public final static DataKey<ConstructionKind> CONSTRUCTION_KIND = KeyFactory.enumeration("constructionKind",
            ConstructionKind.class);

    /// DATAKEYS END

    public CXXConstructExpr(DataStore data, Collection<? extends ClavaNode> children) {
        super(data, children);
    }

    // private final CXXConstructExprData constructorData;

    // public CXXConstructExpr(CXXConstructExprData constructorData, ExprData exprData,
    // ClavaNodeInfo info, Collection<? extends Expr> args) {
    //
    //
    //
    //// super(exprData, info, args);
    //
    //// this.constructorData = constructorData;
    // }

    // @Override
    // protected ClavaNode copyPrivate() {
    // return new CXXConstructExpr(getConstructorData(), getExprData(), getInfo(), Collections.emptyList());
    // }

    // public CXXConstructExprData getConstructorData() {
    // return constructorData;
    // }

    public boolean isElidable() {
        return get(IS_ELIDABLE);
        // return constructorData.isElidable();
    }

    /**
     * 
     * @return the list of arguments, including default arguments added by the parser
     */
    public List<Expr> getCompleteArgs() {
        return getChildren(Expr.class);
    }

    /**
     * 
     * @return the list of arguments that should appear in the code
     */
    public List<Expr> getArgs() {
        return getCompleteArgs().stream()
                .filter(arg -> !(arg instanceof CXXDefaultArgExpr))
                .collect(Collectors.toList());
    }

    @Override
    public String getCode() {
        // If only one non-default arg, most of the time the constructor should be omitted
        if (ommitConstructor()) {
            return getArgs().get(0).getCode();
        }

        /*
        // If source location start and end are the same, assume constructor was inserted by Clang
        if (getLocation().getStart().equals(getLocation().getEnd())) {
            List<Expr> args = getArgs();
        
            if (args.isEmpty()) {
                return "";
            }
        
            if (args.size() == 1) {
                return args.get(0).getCode();
            }
        
            ClavaLog.warning(this, "Case of more than one argument not being handled yet");
        }
        */

        String typeCode = getExprType() instanceof NullType ? null : getExprType().getCode(this);

        String code = getCode(typeCode);
        //
        // System.out.println("CONST KIND:" + get(CONSTRUCTION_KIND));
        // System.out.println("IS LIST:" + get(IS_LIST_INITIALIZATION));
        // System.out.println("IS STD LIST:" + get(IS_STD_LIST_INITIALIZATION));
        // System.out.println("CODE:" + code);
        return code;
        // return getCode(getExprType().getCode());
    }

    private boolean ommitConstructor() {
        List<Expr> args = getArgs();

        if (args.size() != 1) {
            return false;
        }

        // One case where it should not is when the parent is a CxxNewExpr
        if (getParent() instanceof CXXNewExpr) {
            return false;
        }

        return true;
    }

    public boolean isListInit() {
        return get(IS_LIST_INITIALIZATION) || get(IS_STD_LIST_INITIALIZATION);
    }

    private String getCode(String cxxRecordName) {

        if (cxxRecordName == null) {
            return "";
        }

        // Special case: constructor that receives an initializer_list
        // if (cxxRecordName.startsWith("initializer_list<")) {
        if (isListInit()) {
            return getArgs().stream()
                    .map(arg -> arg.getCode())
                    .collect(Collectors.joining(", ", "{", "}"));
        }

        // If is elidable, check that has a single non-default argument and remove
        if (isElidable()) {
            // System.out.println("IS ELIDABLE");
            List<Expr> args = getArgs();
            Preconditions.checkArgument(args.size() == 1);
            // System.out.println("CODE: " + args.get(0).getCode());
            return args.get(0).getCode();
        }

        String argsCode = getArgsCode();

        // Special case: No arguments before VarDecl
        // if (argsCode.isEmpty() &&
        // ClavaNodes.getParentNormalized(this) instanceof VarDecl) {
        // // return cxxRecordName + "{}";
        // return "{}";
        // }
        // System.out.println("CXX CONST CODE:" + cxxRecordName + argsCode);
        // System.out.println("NODE:" + this);
        return cxxRecordName + argsCode;
    }

    public String getArgsCode() {

        String argsCode = getArgs().stream()
                .map(arg -> arg.getCode())
                .collect(Collectors.joining(", "));

        // if (argsCode.isEmpty()) {
        // // HACK: Probably this is not correct
        // if (isTemporary()) {
        // return "()";
        // }
        // return "";
        // }

        if (argsCode.isEmpty()) {
            if (isTemporary()) {
                return "()";
            }
            return "";
        }

        return "(" + argsCode + ")";
    }

    @Override
    public ValueKind getValueKind() {
        // As default, return r-value
        return ValueKind.R_VALUE;
    }

    protected boolean isTemporary() {
        return false;
    }

    // @Override
    // public String toContentString() {
    // return ClavaNode.toContentString(super.toContentString(), constructorData.toString());
    // }

}
