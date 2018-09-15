package com.shall.customercomplaints.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.shall.customercomplaints.model.Sim;
import com.shall.customercomplaints.network.response.ResponseVO;
import com.shall.customercomplaints.service.GenericService;
import com.shall.customercomplaints.service.SimService;
import com.webticketing.util.Constants;

@CrossOrigin
@RestController
@RequestMapping("/v1/sim")
public class SimController {

	@Autowired
	private GenericService<Sim, Integer> service;

	@RequestMapping(value = "/all", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Iterable<Sim>>> getAllSims() {
		return ResponseEntity.ok(new ResponseVO<>(service.findAll()));
	}

	@RequestMapping(value = "/", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Iterable<Sim>>> getSimsbyOperator(@RequestParam("operator") String operator) {
		ResponseVO<Iterable<Sim>> response = new ResponseVO<>();
		List<Sim> sims = ((SimService) service).findSimsByOperator(operator);
		if (sims == null || sims.size() == 0) {
			response.setCode(Constants.ERROR_CODE_NOT_FOUND);
			response.setMessage(Constants.ERROR_MESSAGE_NO_FOUND);
			response.setResults(sims);
		} else {
			response.setCode(Constants.SUCCESS_CODE);
			response.setMessage(Constants.SUCCESS_MESSAGE_SELECT);
			response.setResults(sims);
		}
		return ResponseEntity.ok(response);
	}

	@RequestMapping(value = "/{simSerial}", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Sim>> findBySimSerial(@PathVariable("simSerial") String simSerial) {
		return ResponseEntity.ok(new ResponseVO<>(service.find(Integer.parseInt(simSerial))));
	}

	@RequestMapping(value = "/new", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Iterable<Sim>>> findNewSims() {
		return ResponseEntity.ok(new ResponseVO<>(((SimService) service).findAllNewSims()));
	}

	@RequestMapping(value = "/used", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Iterable<Sim>>> findUsedSims() {
		return ResponseEntity.ok(new ResponseVO<>(((SimService) service).findAllUsedSims()));
	}

	@RequestMapping(value = "/stocked", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Iterable<Sim>>> findStockedSims() {
		return ResponseEntity.ok(new ResponseVO<>(((SimService) service).findAllStockedSims()));
	}

	@RequestMapping(value = "/deployed", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Iterable<Sim>>> findDeployedSims() {
		return ResponseEntity.ok(new ResponseVO<>(((SimService) service).findAllDeployedSims()));
	}

	@RequestMapping(value = "/", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public ResponseEntity<ResponseVO<Sim>> saveComplaint(@RequestBody Sim sim) {
		return ResponseEntity.ok(new ResponseVO<>(service.save(sim)));
	}

	@RequestMapping(value = "/update", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public ResponseEntity<ResponseVO<Sim>> updateComplaint(@RequestBody Sim sim) {
		ResponseVO<Sim> response = null;
		Sim updatedSim = ((SimService) service).updateSim(sim);
		if (updatedSim == null) {
			response = new ResponseVO<Sim>(Constants.ERROR_CODE_GENERAL, Constants.ERROR_MESSAGE_USER_UPDATE,
					updatedSim);
		} else {
			response = new ResponseVO<Sim>(Constants.SUCCESS_CODE, Constants.SUCCESS_MESSAGE_UPDATE, updatedSim);
		}
		return ResponseEntity.ok(response);
	}

	@RequestMapping(value = "/{simSerial}", produces = "application/json; charset=UTF-8", method = RequestMethod.DELETE)
	public ResponseEntity<ResponseVO<Boolean>> deleteComplaint(@PathVariable("simSerial") Integer simSerial) {
		ResponseVO<Boolean> response = new ResponseVO<>(service.delete(simSerial));
		if (response.getResults()) {
			response.setCode(Constants.SUCCESS_CODE);
			response.setMessage(Constants.SUCCESS_MESSAGE_SAVE);
		} else {
			response.setCode(Constants.ERROR_CODE_GENERAL);
			response.setMessage(Constants.ERROR_MESSAGE_DELETE);
		}
		return ResponseEntity.ok(response);
	}

}
