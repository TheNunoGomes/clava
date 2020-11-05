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

package pt.up.fe.specs.clava.ast.type;

import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.suikasoft.jOptions.Interfaces.DataStore;

import pt.up.fe.specs.clava.ClavaLog;
import pt.up.fe.specs.clava.ClavaNode;

/**
 * K&R-style function with no information about its arguments (e.g., int foo())
 * 
 * @author JoaoBispo
 *
 */
public class FunctionNoProtoType extends FunctionType {

    public FunctionNoProtoType(DataStore data, Collection<? extends ClavaNode> children) {
        super(data, children);
    }

    @Override
    public int getNumParams() {
        return 0;
    }

    @Override
    public List<Type> getParamTypes() {
        return Collections.emptyList();
    }

    @Override
    public boolean isVariadic() {
        return false;
    }

    @Override
    public void setParamType(int paramIndex, Type paramType) {
        ClavaLog.debug("FunctionNoProtoType.setParamType(): ignoring, no parameters to set");
    }

    @Override
    public void setParamTypes(List<Type> paramType) {
        ClavaLog.debug("FunctionNoProtoType.setParamTypes(): ignoring, no parameters to set");
    }

}
