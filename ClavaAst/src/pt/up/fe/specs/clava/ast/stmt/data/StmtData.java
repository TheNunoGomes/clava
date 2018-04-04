/**
 * Copyright 2018 SPeCS.
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

package pt.up.fe.specs.clava.ast.stmt.data;

import pt.up.fe.specs.clava.ast.ClavaData;

public class StmtData extends ClavaData {

    public static StmtData empty() {
        return new StmtData(ClavaData.empty());
    }

    public StmtData(ClavaData clavaData) {
        super(clavaData);

    }

    // public StmtData(ExprDataV2 data) {
    // this(data);
    // }

    @Override
    public StmtData copy() {
        return new StmtData(this);
    }

    @Override
    public String toString() {

        return toString(super.toString(), "");
    }
}