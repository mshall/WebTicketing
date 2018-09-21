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

import com.shall.customercomplaints.model.Complaint;
import com.shall.customercomplaints.model.Rollpaper;
import com.shall.customercomplaints.model.Store;
import com.shall.customercomplaints.network.response.ResponseVO;
import com.shall.customercomplaints.service.ComplaintService;
import com.shall.customercomplaints.service.GenericService;
import com.shall.customercomplaints.service.RollpaperService;
import com.shall.customercomplaints.service.StoreService;
import com.shall.customercomplaints.service.UserService;
import com.webticketing.util.Constants;

@CrossOrigin
@RestController
@RequestMapping("/v1/rollpaper")
public class RollpaperController {

	@Autowired
	private GenericService<Rollpaper, Integer> service;

	@RequestMapping(value = "/all", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Iterable<Rollpaper>>> getAllRollpapers() {
		ResponseVO<Iterable<Rollpaper>> response = new ResponseVO<>(service.findAll());
		if (response.getResults() == null || response.getResults().spliterator().getExactSizeIfKnown() == 0) {
			response.setCode(Constants.ERROR_CODE_NOT_FOUND);
			response.setMessage(Constants.ERROR_MESSAGE_NO_FOUND);

		} else {
			response.setCode(Constants.SUCCESS_CODE);
			response.setMessage(Constants.SUCCESS_MESSAGE_SELECT);
		}
		return ResponseEntity.ok(response);
	}

	@RequestMapping(value = "/{rollpaperId}", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Rollpaper>> findStoreById(@PathVariable("rollpaperId") String rollpaperId) {
		return ResponseEntity.ok(new ResponseVO<>(service.find(Integer.parseInt(rollpaperId))));
	}

	@RequestMapping(value = "/", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public ResponseEntity<ResponseVO<Rollpaper>> saveStoret(@RequestBody Rollpaper rollpaper) {
		return ResponseEntity.ok(new ResponseVO<>(service.save(rollpaper)));
	}

	@RequestMapping(value = "/update/", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public ResponseEntity<ResponseVO<Rollpaper>> updateStore(@RequestBody Rollpaper store) {
		ResponseVO<Rollpaper> response = null;
		Rollpaper updatedComplaint = ((RollpaperService) service).updateRollpaper(store);
		if (updatedComplaint == null) {
			response = new ResponseVO<Rollpaper>(Constants.ERROR_CODE_GENERAL, Constants.ERROR_MESSAGE_UPDATE,
					updatedComplaint);
		} else {
			response = new ResponseVO<Rollpaper>(Constants.SUCCESS_CODE, Constants.SUCCESS_MESSAGE_UPDATE,
					updatedComplaint);
		}
		return ResponseEntity.ok(response);
	}

	@RequestMapping(value = "/{rollpaperId}", produces = "application/json; charset=UTF-8", method = RequestMethod.DELETE)
	public ResponseEntity<ResponseVO<Boolean>> deleteComplaint(@PathVariable("rollpaperId") Integer rollpaperId) {
		ResponseVO<Boolean> response = null;
		boolean isDeleted = ((RollpaperService) service).delete(rollpaperId);
		if (isDeleted) {
			response = new ResponseVO<>(Constants.SUCCESS_CODE, Constants.SUCCESS_MESSAGE_DELETE, true);
		} else {
			response = new ResponseVO<>(Constants.ERROR_CODE_DELETE, Constants.ERROR_MESSAGE_DELETE, false);
		}
		return ResponseEntity.ok(response);
	}

}
