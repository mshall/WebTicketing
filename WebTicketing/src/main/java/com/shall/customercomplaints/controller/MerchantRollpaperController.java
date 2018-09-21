package com.shall.customercomplaints.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.shall.customercomplaints.model.MerchantRollpaper;
import com.shall.customercomplaints.network.response.ResponseVO;
import com.shall.customercomplaints.service.GenericService;
import com.shall.customercomplaints.service.MerchantRollpaperService;
import com.webticketing.util.Constants;

@CrossOrigin
@RestController
@RequestMapping("/v1/merchant-rollpaper")
public class MerchantRollpaperController {

	@Autowired
	private GenericService<MerchantRollpaper, Integer> service;

	@RequestMapping(value = "/all", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Iterable<MerchantRollpaper>>> getAllMerchantRollpapers() {
		ResponseVO<Iterable<MerchantRollpaper>> response = new ResponseVO<>(service.findAll());
		if (response.getResults() == null || response.getResults().spliterator().getExactSizeIfKnown() == 0) {
			response.setCode(Constants.ERROR_CODE_NOT_FOUND);
			response.setMessage(Constants.ERROR_MESSAGE_NO_FOUND);

		} else {
			response.setCode(Constants.SUCCESS_CODE);
			response.setMessage(Constants.SUCCESS_MESSAGE_SELECT);
		}
		return ResponseEntity.ok(response);
	}

	@RequestMapping(value = "/{merchantRollpaperId}", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<MerchantRollpaper>> findMerchantRollpaperById(
			@PathVariable("merchantRollpaperId") String merchantRollpaperId) {
		return ResponseEntity.ok(new ResponseVO<>(service.find(Integer.parseInt(merchantRollpaperId))));
	}

	@RequestMapping(value = "/", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public ResponseEntity<ResponseVO<MerchantRollpaper>> saveMerchantRosllpaper(
			@RequestBody MerchantRollpaper merchantRollpaper) {
		ResponseVO<MerchantRollpaper> response = new ResponseVO<>();
		try {
			response = new ResponseVO<>(((MerchantRollpaperService) service).save(merchantRollpaper));

		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.ok(response);
	}

	@RequestMapping(value = "/update/", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public ResponseEntity<ResponseVO<MerchantRollpaper>> updateMerchantRollpaper(
			@RequestBody MerchantRollpaper merchantRollpaper) {
		ResponseVO<MerchantRollpaper> response = null;
		MerchantRollpaper updatedMerchantRollpaper = ((MerchantRollpaperService) service).update(merchantRollpaper);
		if (updatedMerchantRollpaper == null) {
			response = new ResponseVO<MerchantRollpaper>(Constants.ERROR_CODE_GENERAL, Constants.ERROR_MESSAGE_UPDATE,
					updatedMerchantRollpaper);
		} else {
			response = new ResponseVO<MerchantRollpaper>(Constants.SUCCESS_CODE, Constants.SUCCESS_MESSAGE_UPDATE,
					updatedMerchantRollpaper);
		}
		return ResponseEntity.ok(response);
	}

	@RequestMapping(value = "/{merchantRollpaperId}", produces = "application/json; charset=UTF-8", method = RequestMethod.DELETE)
	public ResponseEntity<ResponseVO<Boolean>> deleteMerchantRollpaper(
			@PathVariable("merchantRollpaperId") Integer merchantRollpaperId) {
		ResponseVO<Boolean> response = null;
		boolean isDeleted = ((MerchantRollpaperService) service).delete(merchantRollpaperId);
		if (isDeleted) {
			response = new ResponseVO<>(Constants.SUCCESS_CODE, Constants.SUCCESS_MESSAGE_DELETE, true);
		} else {
			response = new ResponseVO<>(Constants.ERROR_CODE_DELETE, Constants.ERROR_MESSAGE_DELETE, false);
		}
		return ResponseEntity.ok(response);
	}

}
