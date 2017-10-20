package cn.gov.ahcourt.casecomment.utils;

import java.util.Comparator;

/**
 * Created by lvrenzhao on 2017/10/20.
 */
public class MapKeyComparator implements Comparator<Integer> {

    @Override
    public int compare(Integer i1, Integer i2) {
        if(i1 == i2){
            return 0;
        }else if(i1>i2){
            return -1;
        }else{
            return 1;
        }
    }
}