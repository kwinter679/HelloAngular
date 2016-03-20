package com.kevin.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloAngular {
	
	@ModelAttribute
	public User setUser(){
		return new User();
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String map(Model model, User user, BindingResult result){
		
		Map<String, String> map = new HashMap<String,String>();
		map.put("", "");
		map.put("Yes", "Yes");
		map.put("N", "No");
		
		model.addAttribute("myMap",map);
		
		return "helloangular";
	}
	
	@RequestMapping(value = "/hi", method = RequestMethod.POST)
	@ResponseBody
	public String post(User user, BindingResult result){
		System.out.println(user.getName());
		return "Success!";
	}
}
