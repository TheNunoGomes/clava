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

package pt.up.fe.specs.clava.ast.attr;

import static pt.up.fe.specs.clava.ast.attr.data.DummyAttrI.*;

import java.util.Collection;

import org.suikasoft.jOptions.Interfaces.DataStore;

import pt.up.fe.specs.clava.ClavaNode;
import pt.up.fe.specs.clava.ClavaNodes;
import pt.up.fe.specs.clava.ast.DummyNode;
import pt.up.fe.specs.clava.ast.attr.data.DummyAttributeData;

/**
 * Dummy declaration, for testing purposes.
 * 
 * @author JoaoBispo
 *
 */
public class DummyAttr extends Attribute implements DummyNode {

    public DummyAttr(DataStore data, Collection<? extends ClavaNode> children) {
        super(data, children);
    }

    public DummyAttr(DummyAttributeData data, Collection<? extends ClavaNode> children) {
        super(data, children);
    }

    @Override
    public DummyAttributeData getData() {
        return (DummyAttributeData) super.getData();
    }

    @Override
    public String getNodeName() {
        return super.getNodeName() + " (" + getDataI().get(CLASSNAME) + ")";
    }

    public String getNodeCode() {
        return "/* Dummy attribute'" + getDataI().get(CLASSNAME) + "' */";
    }

    @Override
    public String getCode() {
        return ClavaNodes.toCode(getNodeCode(), this);
    }

    @Override
    public String getContent() {
        return getData().toString();
    }

}
