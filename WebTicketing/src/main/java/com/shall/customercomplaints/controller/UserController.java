package com.shall.customercomplaints.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.shall.customercomplaints.model.User;
import com.shall.customercomplaints.network.request.Login;
import com.shall.customercomplaints.network.response.ResponseVO;
import com.shall.customercomplaints.service.GenericService;
import com.shall.customercomplaints.service.UserService;
import com.webticketing.util.Constants;

@CrossOrigin
@RestController
@RequestMapping("/v1/user")
public class UserController {

	@Autowired
	private GenericService<User, Integer> service;

	@RequestMapping(value = "/login", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public ResponseEntity<ResponseVO<User>> loginUser(@RequestBody Login login) {
		ResponseVO<User> response = null;
		User loggedinUser = ((UserService) service).findUser(login);
		if (loggedinUser == null) {
			response = new ResponseVO<User>(Constants.ERROR_CODE_NOT_FOUND, Constants.ERROR_MESSAGE_NO_USERS, loggedinUser);
		} else {
			response = new ResponseVO<User>(Constants.SUCCESS_CODE, Constants.SUCCESS_MESSAGE_USER_LOGIN, loggedinUser);
		}
		return ResponseEntity.ok(response);
	}
	
	@RequestMapping(value = "/all", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Iterable<User>>> getAllUsers() {
		return ResponseEntity.ok(new ResponseVO<>(100, "Ok", ((UserService) service).getAllUsers()));
	}

	@RequestMapping(value = "/all/{userType}", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Iterable<User>>> getAllUsersOfType(@PathVariable("userType") int userType) {
		return ResponseEntity.ok(new ResponseVO<>(100, "Ok", ((UserService) service).getAllUsersOfType(userType)));
	}
	
	@RequestMapping(value = "/all/admin/root", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Iterable<User>>> getAllRootAdmins() {
		return ResponseEntity.ok(new ResponseVO<>(100, "Ok", ((UserService) service).getAllUsersOfType(0)));
	}
	
	@RequestMapping(value = "/all/admin", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Iterable<User>>> getAllAdmins() {
		return ResponseEntity.ok(new ResponseVO<>(100, "Ok", ((UserService) service).getAllUsersOfType(1)));
	}
	
	@RequestMapping(value = "/all/technician", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Iterable<User>>> getAllTechnicians() {
		return ResponseEntity.ok(new ResponseVO<>(100, "Ok", ((UserService) service).getAllUsersOfType(2)));
	}

	@RequestMapping(value = "/{username}", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<User>> findUserByUsername(@PathVariable("username") String username) {
		ResponseVO<User> response = null;
		User user = ((UserService) service).findByUsername(username);
		if (user == null) {
			response = new ResponseVO<User>(Constants.ERROR_CODE_GENERAL, Constants.ERROR_MESSAGE_NO_USERS, user);
		} else {
			response = new ResponseVO<User>(Constants.SUCCESS_CODE, Constants.SUCCESS_MESSAGE_SELECT, user);
		}
		return ResponseEntity.ok(response);
	}
	
	@RequestMapping(value = "/id/{userId}", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<User>> findUserById(@PathVariable("userId") int userId) {
		ResponseVO<User> response = null;
		User user = ((UserService) service).find(userId);
		if (user == null) {
			response = new ResponseVO<User>(Constants.ERROR_CODE_GENERAL, Constants.ERROR_MESSAGE_NO_USERS, user);
		} else {
			response = new ResponseVO<User>(Constants.SUCCESS_CODE, Constants.SUCCESS_MESSAGE_SELECT, user);
		}
		return ResponseEntity.ok(response);
	}

	@RequestMapping(value = "/", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<User>> findUserByEmail(@RequestParam("email") String email) {
		ResponseVO<User> response = null;
		User user = ((UserService) service).findByEmail(email);
		if (user == null) {
			response = new ResponseVO<User>(Constants.ERROR_CODE_GENERAL, Constants.ERROR_MESSAGE_NO_USERS, user);
		} else {
			response = new ResponseVO<User>(Constants.SUCCESS_CODE, Constants.SUCCESS_MESSAGE_SELECT, user);
		}
		return ResponseEntity.ok(response);
	}

	@RequestMapping(value = "/", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public ResponseEntity<ResponseVO<User>> saveUser(@RequestBody User user) {
		ResponseVO<User> response = null;
		User savedUser = ((UserService) service).save(user);
		if (savedUser == null) {
			response = new ResponseVO<User>(Constants.ERROR_CODE_GENERAL, Constants.ERROR_MESSAGE_USER_SAVE, savedUser);
		} else {
			response = new ResponseVO<User>(Constants.SUCCESS_CODE, Constants.SUCCESS_MESSAGE_SAVE, savedUser);
		}
		return ResponseEntity.ok(response);
	}

	@RequestMapping(value = "/update/", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public ResponseEntity<ResponseVO<User>> updateUser(@RequestBody User user) {
		ResponseVO<User> response = null;
		User updatedUser = ((UserService) service).updateUser(user);
		if (updatedUser == null) {
			response = new ResponseVO<User>(Constants.ERROR_CODE_GENERAL, Constants.ERROR_MESSAGE_USER_UPDATE, updatedUser);
		} else {
			response = new ResponseVO<User>(Constants.SUCCESS_CODE, Constants.SUCCESS_MESSAGE_UPDATE, updatedUser);
		}
		return ResponseEntity.ok(response);
	}

	@RequestMapping(value = "/{userId}", produces = "application/json; charset=UTF-8", method = RequestMethod.DELETE)
	public ResponseEntity<ResponseVO<Boolean>> deleteComplaint(@PathVariable("userId") int userId) {
		ResponseVO<Boolean> response = null;
		boolean isDeleted = ((UserService) service).delete(userId);
		if (isDeleted) {
			response = new ResponseVO<>(Constants.SUCCESS_CODE, Constants.SUCCESS_MESSAGE_DELETE, true);
		} else {
			response = new ResponseVO<>(Constants.ERROR_CODE_DELETE, Constants.ERROR_MESSAGE_DELETE, false);
		}
		return ResponseEntity.ok(response);
	}

}
