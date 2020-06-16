package com.my.board;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.my.DTO.MemberDTO;
import com.my.service.ControllerToModel;
@Controller
public class MyBoardController {
	@Autowired
	ControllerToModel tomodel;
	
	@RequestMapping("bbsConlist")
	public String list(Model model) {
		
		model.addAttribute("list", tomodel.selectAll());
		return "board/board_list";
	}
	@RequestMapping("bbsConinput")
	public String inputform() {
		return "board/board_write";
	}
	@RequestMapping("bbsConinputprocess")
	public String inputDB(HttpServletRequest request) {
		String id=request.getParameter("id");
		String name= request.getParameter("name");
		System.out.println(id+"/"+name);
		tomodel.insert(id,name);
		return "redirect:list";
	}
	@RequestMapping("bbsCondel")
	public String del(HttpServletRequest request) {
		String id=request.getParameter("id");
		tomodel.del(id);
		return "redirect:list";
	}
@RequestMapping("bbsConmodify")
public String mod(@RequestParam("id") String id, Model model) {
	model.addAttribute("userInfo", tomodel.selectOne(id) );
	return "modify";
	
	}
	@RequestMapping("bbsConmodifyprocess_bak")
    public String modp(@ModelAttribute MemberDTO user) {
		System.out.println(user.getId());
		System.out.println(user.getName());
		tomodel.modify(user);
		return "redirect:list";

	}
	@RequestMapping("bbsConmodifyprocess")
	public String modpHash(HttpServletRequest request) {
		HashMap<String,String> h=new HashMap();
		h.put("id",request.getParameter("id"));
		h.put("name",request.getParameter("name"));
		tomodel.modifyhash(h);
		return "redirect:list";
	}
	
}
