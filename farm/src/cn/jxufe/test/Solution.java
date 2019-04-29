package cn.jxufe.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;

public class Solution {
	
	private Map<Integer,char[]> map = new HashMap<>();
	
	public List<String> letterCombinations(String digits) {
		List<String> res = new ArrayList<>();
		if (null == digits || 0 == digits.length()) {
			return res;
		}
		initializeMapping();
		letterCombinations(digits.toCharArray(),0,res,new StringBuilder(1 << 8));
		return res;
	}
	
	private void initializeMapping() {
		map.put(2, new char[]{'a','b','c'});
		map.put(3, new char[]{'d','e','f'});
		map.put(4, new char[]{'g','h','i'});
		map.put(5, new char[]{'j','k','l'});
		map.put(6, new char[]{'m','n','o'});
		map.put(7, new char[]{'p','q','r','s'});
		map.put(8, new char[]{'t','u','v'});
		map.put(9, new char[]{'w','x','y','z'});
	}

	private void letterCombinations(char[] chs,int currentIndex,List<String> res,StringBuilder s) {
		// base case
		if (currentIndex == chs.length) {
			res.add(s.toString());
			s.delete(0, s.length());
			return;
		}
		char[] currentChars = map.get(chs[currentIndex]-'0');
		for (char c : currentChars) {
			s.append(c);
			letterCombinations(chs,currentIndex+1,res,s);
			s.deleteCharAt(s.length()-1);
		}
	}
	
	@Test
	public void test() {
		List<String> letterCombinations = letterCombinations("23");
		for (String string : letterCombinations) {
			System.out.println(string);
		}
	}
}
