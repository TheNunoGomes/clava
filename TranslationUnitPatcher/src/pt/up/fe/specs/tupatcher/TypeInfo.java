/**
 *  Copyright 2020 SPeCS.
 * 
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 * 
 *       http://www.apache.org/licenses/LICENSE-2.0
 * 
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *  under the License.
 */

package pt.up.fe.specs.tupatcher;

import java.util.HashMap;

public class TypeInfo {

    String kind;//int, char, struct, union, class, etc
    String name;
    HashMap<String, TypeInfo> fields;
    
    public TypeInfo() {
        kind = "int";
        fields = new HashMap<String, TypeInfo>();
        
    }
    
    public void addField(String name, TypeInfo type) {
        if (!(kind=="struct" || kind=="union" || kind=="class")) kind = "struct";
        fields.put(name, type);
    }
    
    public HashMap<String, TypeInfo> getFields() {
        return fields;
    }    
    
    public String getKind(){
        return kind;
    }
    
    public void setAsStruct() {
        kind = "struct";        
    }
    
    public void setAs(String kind) {
        this.kind = kind;        
    }
    
    public String getName(){
        return name;
    }
    

}
