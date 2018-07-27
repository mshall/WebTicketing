package com.shall.customercomplaints.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.shall.customercomplaints.model.Complaint;
import com.shall.customercomplaints.model.Store;
import com.shall.customercomplaints.network.response.ResponseVO;
import com.shall.customercomplaints.service.ComplaintService;
import com.shall.customercomplaints.service.GenericService;
import com.shall.customercomplaints.service.StoreService;
import com.webticketing.util.Constants;

@RestController
@RequestMapping("/v1/store")
public class StoreController {

	@Autowired
	private GenericService<Store, Integer> service;

	@RequestMapping(value = "/all", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Iterable<Store>>> getAllStores() {
		return ResponseEntity.ok(new ResponseVO<>(service.findAll()));
	}

	@RequestMapping(value = "/{storeId}", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Store>> findStoreById(@PathVariable("storeId") String storeId) {
		return ResponseEntity.ok(new ResponseVO<>(service.find(Integer.parseInt(storeId))));
	}

	@RequestMapping(value = "/", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public ResponseEntity<ResponseVO<Store>> saveStoret(@RequestBody Store store) {
		return ResponseEntity.ok(new ResponseVO<>(service.save(store)));
	}

	@RequestMapping(value = "/update/", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public ResponseEntity<ResponseVO<Store>> updateStore(@RequestBody Store store) {
		ResponseVO<Store> response = null;
		Store updatedComplaint = ((StoreService) service).updateStore(store);
		if (updatedComplaint == null) {
			response = new ResponseVO<Store>(Constants.ERROR_CODE_GENERAL, Constants.ERROR_MESSAGE_UPDATE,
					updatedComplaint);
		} else {
			response = new ResponseVO<Store>(Constants.SUCCESS_CODE, Constants.SUCCESS_MESSAGE_UPDATE,
					updatedComplaint);
		}
		return ResponseEntity.ok(response);
	}

	@RequestMapping(value = "/{storeId}", produces = "application/json; charset=UTF-8", method = RequestMethod.DELETE)
	public ResponseEntity<ResponseVO<Boolean>> deleteComplaint(@PathVariable("storeId") Integer storeId) {
		return ResponseEntity.ok(new ResponseVO<>(service.delete(storeId)));
	}

}
