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

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.suikasoft.jOptions.Datakey.DataKey;
import org.suikasoft.jOptions.Datakey.KeyFactory;
import org.suikasoft.jOptions.Interfaces.DataStore;

import pt.up.fe.specs.clava.ClavaNode;
import pt.up.fe.specs.clava.ast.expr.enums.StringKind;
import pt.up.fe.specs.util.SpecsStrings;

public class StringLiteral extends Literal {

    /// DATAKEY BEGIN

    public final static DataKey<StringKind> STRING_KIND = KeyFactory.enumeration("stringKind", StringKind.class);

    // public final static DataKey<String> STRING = KeyFactory.string("string");

    public final static DataKey<List<Integer>> STRING_BYTES = KeyFactory.generic("stringBytes",
            (List<Integer>) new ArrayList<Integer>());

    /// DATAKEY END

    // private final String string;

    public StringLiteral(DataStore data, Collection<? extends ClavaNode> children) {
        super(data, children);
    }

    // public StringLiteral(String string, ExprData exprData, ClavaNodeInfo info) {
    // // According to CPP reference, string literals are lvalues
    // // http://en.cppreference.com/w/cpp/language/value_category
    // super(exprData, info, Collections.emptyList());
    //
    // this.string = string;
    // }

    // @Override
    // protected ClavaNode copyPrivate() {
    // return new StringLiteral(string, getExprData(), getInfo());
    // }

    // public String getString() {
    // return getLiteral();
    // // return string;
    // }

    // public String getStringContents() {
    // // return get(STRING);
    // String literalString = getString();
    // return literalString.substring(1, literalString.length() - 1);
    // String stringContents = string;
    // if (stringContents.startsWith("\"")) {
    // stringContents = stringContents.substring(1);
    // }
    // if (stringContents.endsWith("\"")) {
    //
    // }
    //
    // return string;
    // }

    @Override
    public String getCode() {
        // Build the string from the bytes
        // System.out.println("STRING LITRAL:" + getString());
        // return getLiteral();
        StringBuilder code = new StringBuilder();

        code.append(get(STRING_KIND).getPrefix());
        code.append("\"");
        code.append(getString());
        code.append("\"");

        return code.toString();
        // return "\"" + getString() + "\"";
        // System.out.println("STRING CONTENTS:" + getStringContents());
        // System.out.println("LITERAL:" + getLiteral());
        // System.out.println("ESCAPED:" + SpecsStrings.escapeJson(getStringContents()));
        // // return getString();
        // return "\"" + SpecsStrings.escapeJson(getStringContents()) + "\"";
    }

    public String getString() {
        return SpecsStrings.escapeJson(getStringUnescaped());
    }

    private String getStringUnescaped() {
        switch (get(STRING_KIND)) {
        case ASCII:
            return new String(getBytesAsChars());
        case WIDE:
            return new String(getBytesAsWideChars());
        default:
            throw new RuntimeException("String literals of kind '" + get(STRING_KIND) + "' not implemented yet");
        }
    }

    private char[] getBytesAsChars() {
        List<Integer> bytes = get(STRING_BYTES);
        char[] chars = new char[bytes.size()];

        for (int i = 0; i < bytes.size(); i++) {
            chars[i] = (char) bytes.get(i).intValue();
        }

        return chars;
    }

    private char[] getBytesAsWideChars() {
        List<Integer> bytes = get(STRING_BYTES);
        char[] chars = new char[bytes.size() / 2];

        for (int i = 0; i < bytes.size(); i += 2) {

            int lowerByte = bytes.get(i).intValue();
            int higherByte = bytes.get(i + 1).intValue() << 8;

            chars[i / 2] = (char) (higherByte | lowerByte);
        }

        return chars;
    }

    // @Override
    // public String toContentString() {
    // return ClavaNode.toContentString(super.toContentString(), "string:" + string);
    // // return super.toContentString() + "string:" + string;
    // }

    // @Override
    // public String getLiteral() {
    // return string;
    // }

    // StringKind getKind()

}
