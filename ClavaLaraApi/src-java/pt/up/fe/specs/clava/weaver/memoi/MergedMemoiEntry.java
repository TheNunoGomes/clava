package pt.up.fe.specs.clava.weaver.memoi;

import java.util.ArrayList;
import java.util.List;

/**
 * Copyright 2019 SPeCS.
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

public class MergedMemoiEntry implements java.io.Serializable {

    private static final long serialVersionUID = -3654548405691045308L;

    private String key;
    private String output;
    private List<Integer> counter;
    private int collisions;
    // private final MergedMemoiReport parentReport;

    public MergedMemoiEntry(MemoiEntry previousEntry) {

        this.key = previousEntry.getKey();
        this.output = previousEntry.getOutput();
        this.counter = new ArrayList<>(10);
        this.counter.add(previousEntry.getCounter());
        this.collisions = 0;
    }

    public MergedMemoiEntry() {

    }

    // public MergedMemoiEntry(MemoiEntry previousEntry, MergedMemoiReport parentReport) {
    //
    // this.key = previousEntry.getKey();
    // this.output = previousEntry.getOutput();
    // this.counter = new ArrayList<>();
    // this.counter.add(previousEntry.getCounter());
    // this.collisions = 0;
    // this.parentReport = parentReport;
    // }

    // public double getCountMean() {
    //
    // return MemoiUtils.mean(counter, parentReport.getReportCount());
    // }

    public String getKey() {
        return key;
    }

    public String getOutput() {
        return output;
    }

    public List<Integer> getCounter() {
        return counter;
    }

    public void addCounter(int newValue) {

        this.counter.add(newValue);
    }

    public void incCollisions() {
        this.collisions++;
    }

    public int getCollisions() {
        return this.collisions;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public void setOutput(String output) {
        this.output = output;
    }

    public void setCounter(List<Integer> counter) {
        this.counter = counter;
    }

    public void setCollisions(int collisions) {
        this.collisions = collisions;
    }

    @Override
    public String toString() {

        StringBuilder builder = new StringBuilder("{");
        builder.append(key);
        builder.append(", ");
        builder.append(output);
        builder.append(", ");
        builder.append(counter);
        builder.append("} (");
        builder.append(collisions);
        builder.append(")");

        return builder.toString();
    }
}
