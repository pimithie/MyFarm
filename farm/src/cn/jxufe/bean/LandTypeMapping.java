package cn.jxufe.bean;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public abstract class LandTypeMapping {

	public static final Map<String,String> landTypeMapping;
	
	static {
		Map<String,String> temp = new HashMap<>();
		temp.put("normal", "普通土地");
		temp.put("red", "红土地");
		temp.put("black", "黑土地");
		temp.put("gold", "金土地");
		landTypeMapping = Collections.unmodifiableMap(temp);
	}
	
}
