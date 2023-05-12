package com.CapstoneProject.reggie.common;

import lombok.Data;
import java.util.HashMap;
import java.util.Map;

/**
 * Generic return result class.
 * The data returned by the server is eventually encapsulated into this object.
 * @param <T>
 */
@Data
public class R<T> {

    private Integer code; //cod: 1 success，0 and others failed

    private String msg; //error message

    private T data; //data object

    private Map map = new HashMap(); //Dynamic data

    public static <T> R<T> success(T object) {
        R<T> r = new R<T>();
        r.data = object;
        r.code = 1;
        return r;
    }

    public static <T> R<T> error(String msg) {
        R r = new R();
        r.msg = msg;
        r.code = 0;
        return r;
    }

    public R<T> add(String key, Object value) {
        this.map.put(key, value);
        return this;
    }

}
