package com.shall.customercomplaints.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.shall.customercomplaints.model.Store;
import com.shall.customercomplaints.network.response.ResponseVO;
import com.shall.customercomplaints.service.GenericService;
import com.shall.customercomplaints.service.StoreService;
import com.webticketing.util.Constants;

@CrossOrigin
@RestController
@RequestMapping("/v1/store")
public class StoreController {

	@Autowired
	private GenericService<Store, Integer> service;

	@RequestMapping(value = "/all", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Iterable<Store>>> getAllStores() {
		ResponseVO<Iterable<Store>> response = new ResponseVO<>(service.findAll());
		if (response.getResults() == null || response.getResults().spliterator().getExactSizeIfKnown() == 0) {
			response.setCode(Constants.ERROR_CODE_NOT_FOUND);
			response.setMessage(Constants.ERROR_MESSAGE_NO_FOUND);
		} else {
			response.setCode(Constants.SUCCESS_CODE);
			response.setMessage(Constants.SUCCESS_MESSAGE_SELECT);
		}
		return ResponseEntity.ok(response);
	}

	@RequestMapping(value = "/{storeId}", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Store>> findStoreById(@PathVariable("storeId") String storeId) {
		ResponseVO<Store> response = new ResponseVO<>(service.find(Integer.parseInt(storeId)));
		if (response.getResults() == null) {
			response.setCode(Constants.ERROR_CODE_NOT_FOUND);
			response.setMessage(Constants.ERROR_MESSAGE_NO_FOUND);
		} else {
			response.setCode(Constants.SUCCESS_CODE);
			response.setMessage(Constants.SUCCESS_MESSAGE_SELECT);
		}
		return ResponseEntity.ok(response);
	}

	@RequestMapping(value = "/", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public ResponseEntity<ResponseVO<Store>> saveStoret(@RequestBody Store store) {
		ResponseVO<Store> response = null;
		Store savedStore = ((StoreService) service).save(store);
		if (savedStore == null) {
			response = new ResponseVO<Store>(Constants.ERROR_CODE_GENERAL, Constants.ERROR_MESSAGE_MERCHANT_SAVE,
					savedStore);
		} else {
			response = new ResponseVO<Store>(Constants.SUCCESS_CODE, Constants.SUCCESS_MESSAGE_SAVE, savedStore);
		}
		return ResponseEntity.ok(response);
	}

	@RequestMapping(value = "/update", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public ResponseEntity<ResponseVO<Store>> updateStore(@RequestBody Store store) {
		ResponseVO<Store> response = null;
		Store updatedComplaint = ((StoreService) service).updateStore(store);
		if (updatedComplaint == null) {
			response = new ResponseVO<Store>(Constants.ERROR_CODE_GENERAL, Constants.ERROR_MESSAGE_STORE_UPDATE,
					updatedComplaint);
		} else {
			response = new ResponseVO<Store>(Constants.SUCCESS_CODE, Constants.SUCCESS_MESSAGE_UPDATE,
					updatedComplaint);
		}
		return ResponseEntity.ok(response);
	}

	@RequestMapping(value = "/{storeId}", produces = "application/json; charset=UTF-8", method = RequestMethod.DELETE)
	public ResponseEntity<ResponseVO<Boolean>> deleteStore(@PathVariable("storeId") Integer storeId) {
		ResponseVO<Boolean> response = null;
		boolean isDeleted = ((StoreService) service).delete(storeId);
		if (isDeleted) {
			response = new ResponseVO<>(Constants.SUCCESS_CODE, Constants.SUCCESS_MESSAGE_DELETE, true);
		} else {
			response = new ResponseVO<>(Constants.ERROR_CODE_DELETE, Constants.ERROR_MESSAGE_DELETE, false);
		}
		return ResponseEntity.ok(response);
	}

}
