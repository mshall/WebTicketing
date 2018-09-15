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
import com.shall.customercomplaints.model.Merchant;
import com.shall.customercomplaints.network.response.ResponseVO;
import com.shall.customercomplaints.service.GenericService;
import com.shall.customercomplaints.service.MerchantService;
import com.webticketing.util.Constants;

@CrossOrigin
@RestController
@RequestMapping("/v1/merchant")
public class MerchantController {

	@Autowired
	private GenericService<Merchant, Integer> service;

	@RequestMapping(value = "/all", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Iterable<Merchant>>> getAllMerchants() {
		return ResponseEntity.ok(new ResponseVO<>(service.findAll()));
	}

	@RequestMapping(value = "/{merchantId}", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Merchant>> findMerchantById(@PathVariable("merchantId") String merchantId) {
		Merchant merchant = service.find(Integer.parseInt(merchantId));
		ResponseVO<Merchant> response;
		if (merchant == null) {
			response = new ResponseVO<Merchant>(Constants.ERROR_CODE_NOT_FOUND, Constants.ERROR_MESSAGE_NO_FOUND,
					merchant);
		} else {
			response = new ResponseVO<Merchant>(Constants.SUCCESS_CODE, Constants.SUCCESS_MESSAGE, merchant);
		}
		return ResponseEntity.ok(response);
	}

	@RequestMapping(value = "/", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Merchant>> findComplaintByTechnicianId(@RequestParam("email") String email) {
		return ResponseEntity.ok(new ResponseVO<>(((MerchantService) service).findByEmail(email)));
	}

	@RequestMapping(value = "/phone", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Iterable<Merchant>>> findComplaintByPhoneNumber(
			@RequestParam("phoneNumber") String phoneNumber) {
		return ResponseEntity.ok(new ResponseVO<>(((MerchantService) service).findByPhone1(phoneNumber)));
	}

	@RequestMapping(value = "/", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public ResponseEntity<ResponseVO<Merchant>> saveMerchant(@RequestBody Merchant merchant) {
		ResponseVO<Merchant> response = null;
		Merchant savedMerchant = ((MerchantService) service).save(merchant);
		if (savedMerchant == null) {
			response = new ResponseVO<Merchant>(Constants.ERROR_CODE_GENERAL, Constants.ERROR_MESSAGE_MERCHANT_SAVE,
					savedMerchant);
		} else {
			response = new ResponseVO<Merchant>(Constants.SUCCESS_CODE, Constants.SUCCESS_MESSAGE_SAVE, savedMerchant);
		}
		return ResponseEntity.ok(response);
	}

	@RequestMapping(value = "/update", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public ResponseEntity<ResponseVO<Merchant>> updateMerchant(@RequestBody Merchant merchant) {
		ResponseVO<Merchant> response = null;
		Merchant updatedMerchant = ((MerchantService) service).updateMerchant(merchant);
		if (updatedMerchant == null) {
			response = new ResponseVO<Merchant>(Constants.ERROR_CODE_GENERAL, Constants.ERROR_MESSAGE_MERCHANT_UPDATE,
					updatedMerchant);
		} else {
			response = new ResponseVO<Merchant>(Constants.SUCCESS_CODE, Constants.SUCCESS_MESSAGE_UPDATE,
					updatedMerchant);
		}
		return ResponseEntity.ok(response);
	}

	@RequestMapping(value = "/{merchantId}", produces = "application/json; charset=UTF-8", method = RequestMethod.DELETE)
	public ResponseEntity<ResponseVO<Boolean>> deleteComplaint(@PathVariable("merchantId") Integer merchantId) {
		ResponseVO<Boolean> response = new ResponseVO<>(service.delete(merchantId));
		if (response.getResults()) {
			response.setCode(Constants.SUCCESS_CODE);
			response.setMessage(Constants.SUCCESS_MESSAGE_DELETE);
		} else {
			response.setCode(Constants.ERROR_CODE_GENERAL);
			response.setMessage(Constants.ERROR_MESSAGE_DELETE);
		}
		return ResponseEntity.ok(response);
	}

}
