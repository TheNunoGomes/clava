/**
 * Copyright 2020 SPeCS.
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

package pt.up.fe.specs.clava.weaver.memoi.stats;

import java.util.List;

public class BoxWhisker implements java.io.Serializable {

    private static final long serialVersionUID = 1193463067709042297L;
    
    private static final double ONE_QUARTER = 0.25;
    private static final double HALF = 0.5;
    private static final double THREE_QUARTERS = 0.75;
    private final int min;
    private final int max;
    private final int q1;
    private final int q2;
    private final int q3;
    private final int iqr;

    public BoxWhisker(List<Integer> meanCounts) {

        int size = meanCounts.size();

        this.min = meanCounts.get(size - 1);
        this.q3 = getQuartVal(meanCounts, ONE_QUARTER * size); // q1 and q3 are inverted since this list is order from
                                                               // highest to lowest
        this.q2 = getQuartVal(meanCounts, HALF * size);
        this.q1 = getQuartVal(meanCounts, THREE_QUARTERS * size);
        this.max = meanCounts.get(0);
        this.iqr = q3 - q1;
    }

    private int getQuartVal(List<Integer> meanCounts, double i) {

        int floor = (int) Math.floor(i);

        Integer first = meanCounts.get(floor);
        if (i == floor) {

            Integer second = meanCounts.get(floor + 1);
            return (first + second) / 2;
        } else {

            return first;
        }
    }

    // 2|---[2 |2 2]---|74708
    @Override
    public String toString() {

        StringBuilder b = new StringBuilder("== box whisker ==\n");
        b.append(min);
        b.append("|---[");
        b.append(q1);
        b.append("   |");
        b.append(q2);
        b.append("   ");
        b.append(q3);
        b.append("]---|");
        b.append(max);
        b.append("   iqr: ");
        b.append(iqr);

        return b.toString();
    }
}
