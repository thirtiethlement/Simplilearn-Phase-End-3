package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.dao.TaskDao;
import com.model.Task;
import com.model.User;

@RestController
public class TaskController {

	@Autowired
	private TaskDao taskDao;
	
	@RequestMapping(path = "/dashboard")
	public ModelAndView dashboardView(HttpSession session)
	{
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("user") == null)
		{
			mav.setViewName("redirect:/");
			mav.addObject("logoutToken", "logout");
			return mav;
		}
		else
		{
			User activeUser = (User) session.getAttribute("user");
			List<Task> taskList = taskDao.findByUser_UserId(activeUser.getUserId());
			mav.setViewName("dashboard");
			mav.addObject("count", taskList.size());
			mav.addObject("tasks", taskList);
			mav.addObject("name", activeUser.getUsername());
			return mav;
		}
		
	}
	
	@RequestMapping(path = "/addTask")
	public ModelAndView addTask(HttpSession session)
	{
		ModelAndView mav = new ModelAndView("addTask");
		return mav;
	}
	
	@RequestMapping(path = "/commitAdd")
	public ModelAndView commitAdd(@RequestParam String taskName, @RequestParam String startDate, @RequestParam String endDate, @RequestParam String description, @RequestParam String emailAddress, @RequestParam String severity, HttpSession session)
	{
		ModelAndView mav = new ModelAndView("redirect:/dashboard");
		User activeUser = (User) session.getAttribute("user");
		Task t = new Task(taskName, startDate, endDate, description, emailAddress, severity, activeUser);
		taskDao.save(t);
		return mav;
	}
	
	@RequestMapping(path = "/updateTask")
	public ModelAndView updateTask(@RequestParam int taskId, @RequestParam String taskName, @RequestParam String startDate, @RequestParam String endDate, @RequestParam String description, @RequestParam String emailAddress, @RequestParam String severity, HttpSession session)
	{
		ModelAndView mav = new ModelAndView("updateTask");
		mav.addObject("taskId", taskId);
		mav.addObject("taskName", taskName);
		mav.addObject("startDate", startDate);
		mav.addObject("endDate", endDate);
		mav.addObject("description", description);
		mav.addObject("emailAddress", emailAddress);
		mav.addObject("severity", severity);
		return mav;
	}
	
	@RequestMapping(path = "/commitUpdate")
	public ModelAndView commitUpdate(@RequestParam int taskId, @RequestParam String taskName, @RequestParam String startDate, @RequestParam String endDate, @RequestParam String description, @RequestParam String emailAddress, @RequestParam String severity, HttpSession session)
	{
		ModelAndView mav = new ModelAndView("redirect:/dashboard");
		Task t = taskDao.findById(taskId).get();
		t.setTaskName(taskName);
		t.setStartDate(startDate);
		t.setEndDate(endDate);
		t.setDescription(description);
		t.setEmailAddress(emailAddress);
		t.setSeverity(severity);
		taskDao.save(t);
		return mav;
	}
	@RequestMapping(path = "/deleteTask")
	public ModelAndView deleteTask(@RequestParam int taskId, HttpSession session)
	{
		ModelAndView mav = new ModelAndView("redirect:/dashboard");
		taskDao.deleteById(taskId);
		return mav;
	}
}
