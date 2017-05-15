package com.hfl.tag;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 */
public class TmFuntion {

    /**
     * 日期格式haunted文件
     * @param date
     * @param pattern
     * @return
     */
    public static String dateFormat(Date date , String pattern){
        return  new SimpleDateFormat(pattern).format(date);
    }

    public static  String getChar(int index){
        char c = (char)(64+index);
        return String.valueOf(c);
    }

    public static void main(String[] args) {
        System.out.println(getChar(1));
        System.out.println(getChar(2));
        System.out.println(getChar(3));
        System.out.println(getChar(4));
    }
}
