package com.leaf.myapp.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.leaf.myapp.dao.AdminDAO;

@Service
public class AdminServiceImp implements AdminService{
	@Inject
	AdminDAO adminDAO;

	@Override
	public Integer TotalFran() {
		// TODO Auto-generated method stub
		return adminDAO.TotalFran();
	}

	@Override
	public Integer TotalManage() {
		// TODO Auto-generated method stub
		return adminDAO.TotalManage();
	}

	@Override
	public Integer TotalRegi() {
		// TODO Auto-generated method stub
		return adminDAO.TotalRegi();
	}

	@Override
	public Integer TotalSales() {
		// TODO Auto-generated method stub
		return adminDAO.TotalSales();
	}
}
