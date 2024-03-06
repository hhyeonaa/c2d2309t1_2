package com.team.util;

import java.util.Iterator;
import java.util.Map;

import com.google.gson.Gson;

public class JsonUtils {
	
	public static Map<String, Object> jsonStrToMap(String jsonStr) {
		Gson gson = new Gson();
		Map<?,?> map = gson.fromJson(jsonStr, Map.class);
		
		return gson.fromJson(jsonStr, Map.class);
	}
	
	
	public static String getKeyType(Map map){
        String keyKind = Object.class.getName();
        Iterator<Map.Entry<Object,Object>> it = map.entrySet().iterator();
        while(it.hasNext()){
            Map.Entry<Object,Object> entry = it.next();
            Object entryKey = entry.getKey();
            keyKind = entryKey.getClass().getName();
        }
        return keyKind;
    }
    public static String getValueType(Map map){
        String valueKind = Object.class.getName();
        Iterator<Map.Entry<Object,Object>> it = map.entrySet().iterator();
        while(it.hasNext()){
            Map.Entry<Object,Object> entry = it.next();
            Object entryVal = entry.getValue();
            valueKind = entryVal.getClass().getName();
        }
        return valueKind;
    }
}
