package com.gms.web.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

public class ParamsIterator {
	public static Map<?,?> execute(HttpServletRequest request){
		Map<String,String> result=new HashMap<>(); //스트링 스트링 타입 맵으로 리턴해야  디비에 담을수 있음
		Map<String, String[]> map = request.getParameterMap(); //리퀘스트들을 스트링 스트링 배열 타입으로 지정 (겟 파라미터 맵 사용)
        Set<Entry<String, String[]>> set = map.entrySet();  
        Iterator<Map.Entry<String, String[]>> it = set.iterator();
        String params[] = new String[set.size()];
        System.out.println("set size"+ set.size());
        int i=0;
        while(it.hasNext()){ //있을때만 돌린다  .next!=null와 같음
           Map.Entry<String, String[]> e = it.next();
           params[i]=e.getKey();
           i++;
        }
        for(i=0;i<params.length;i++){
           if(map.get(params[i]).length==1){
              result.put(params[i], map.get(params[i])[0]);
           }else{
        	  String temp="";
              for(int j=0;j<map.get(params[i]).length;j++){
                 temp+=map.get(params[i])[j]+",";                
              }
              result.put(params[i], temp);
           }
        }
		return result;
	}
}
