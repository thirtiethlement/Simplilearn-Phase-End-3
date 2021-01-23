package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.dao.UserDao;
import com.model.User;

@RestController
public class LoginController {

	@Autowired
	private UserDao userDao;
	
	@RequestMapping (path = "/")
	public ModelAndView landingPage()
	{
		ModelAndView mav = new ModelAndView("hello");
		return mav;
	}
	
	@RequestMapping (path = "/registration")
	public ModelAndView register(@RequestParam String username, @RequestParam String password)
	{
		ModelAndView mav = new ModelAndView("hello");
		User u = new User(username, password);
		userDao.save(u);
		mav.addObject("username", username);
		return mav;
	}
	
	@RequestMapping (path = "/login")
	public ModelAndView login(@RequestParam String username, @RequestParam String password, HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		User u = userDao.findByUsername(username);
		if (u.getUsername().equals(username) && u.getPassword().equals(password))
		{
			mav.setViewName("redirect:/dashboard");
			session.setAttribute("user", u);
			return mav;
		}
		else
		{
			mav.setViewName("hello");
			mav.addObject("loginFailedToken", "failed");
			return mav;
		}
	}
	
	@RequestMapping (path = "/logout")
	public ModelAndView logout(HttpSession session)
	{
		ModelAndView mav = new ModelAndView("hello");
		session.invalidate();
		mav.addObject("logoutToken", "logout");
		return mav;
	}
}
