package com.shall.customercomplaints.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.shall.customercomplaints.model.Users;
import com.shall.customercomplaints.network.response.ResponseVO;
import com.shall.customercomplaints.service.GenericService;
import com.shall.customercomplaints.service.UserService;
import com.webticketing.util.Constants;

@RestController
@RequestMapping("/v1/user")
public class UserController {

	@Autowired
	private GenericService<Users, Integer> service;

	@RequestMapping(value = "/all", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Iterable<Users>>> getAllUsers() {
		return ResponseEntity.ok(new ResponseVO<>(100, "Ok", ((UserService) service).getAllUsers()));
	}

	@RequestMapping(value = "/{username}", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Users>> findUserByUsername(@PathVariable("username") String username) {
		ResponseVO<Users> response = null;
		Users user = ((UserService) service).findByUsername(username);
		if (user == null) {
			response = new ResponseVO<Users>(Constants.ERROR_GENERAL, Constants.ERROR_MESSAGE_NO_USERS, user);
		} else {
			response = new ResponseVO<Users>(Constants.SUCCESS_CODE, Constants.SUCCESS_MESSAGE_SELECT, user);
		}
		return ResponseEntity.ok(response);
	}

	@RequestMapping(value = "/", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Users>> findUserByEmail(@RequestParam("email") String email) {
		ResponseVO<Users> response = null;
		Users user = ((UserService) service).findByEmail(email);
		if (user == null) {
			response = new ResponseVO<Users>(Constants.ERROR_GENERAL, Constants.ERROR_MESSAGE_NO_USERS, user);
		} else {
			response = new ResponseVO<Users>(Constants.SUCCESS_CODE, Constants.SUCCESS_MESSAGE_SELECT, user);
		}
		return ResponseEntity.ok(response);
	}

	@RequestMapping(value = "/", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public ResponseEntity<ResponseVO<Users>> saveUser(@RequestBody Users user) {
		ResponseVO<Users> response = null;
		Users savedUser = ((UserService) service).save(user);
		if (savedUser == null) {
			response = new ResponseVO<Users>(Constants.ERROR_GENERAL, Constants.ERROR_MESSAGE_USER_SAVE, savedUser);
		} else {
			response = new ResponseVO<Users>(Constants.SUCCESS_CODE, Constants.SUCCESS_MESSAGE_SAVE, savedUser);
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
			response = new ResponseVO<>(Constants.SUCCESS_CODE, Constants.SUCCESS_MESSAGE_DELETE, true);
		}
		return ResponseEntity.ok(response);
	}

}
