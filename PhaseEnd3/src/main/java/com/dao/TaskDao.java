package com.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.model.Task;

public interface TaskDao extends CrudRepository<Task, Integer>{

	List<Task> findByUser_UserId(int userId);
}
