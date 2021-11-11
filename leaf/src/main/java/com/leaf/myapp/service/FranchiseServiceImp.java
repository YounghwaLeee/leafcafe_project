package com.leaf.myapp.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.leaf.myapp.dao.FranchiseDAO;

@Service
public class FranchiseServiceImp implements FranchiseService {

	@Inject
	FranchiseDAO franchiseDAO;
}
