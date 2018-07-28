package com.shall.customercomplaints.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.shall.customercomplaints.model.Store;
import com.shall.customercomplaints.model.Terminal;
import com.shall.customercomplaints.network.response.ResponseVO;
import com.shall.customercomplaints.service.GenericService;
import com.shall.customercomplaints.service.StoreService;
import com.shall.customercomplaints.service.TerminalService;
import com.webticketing.util.Constants;

@RestController
@RequestMapping("/v1/terminal")
public class TerminalController {

	@Autowired
	private GenericService<Terminal, Integer> service;

	@RequestMapping(value = "/all", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Iterable<Terminal>>> getAllTerminals() {
		return ResponseEntity.ok(new ResponseVO<>(service.findAll()));
	}

	@RequestMapping(value = "/{terminalId}", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Terminal>> findStoreById(@PathVariable("terminalId") String terminalId) {
		return ResponseEntity.ok(new ResponseVO<>(service.find(Integer.parseInt(terminalId))));
	}

	@RequestMapping(value = "/", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public ResponseEntity<ResponseVO<Terminal>> saveStoret(@RequestBody Terminal terminal) {
		return ResponseEntity.ok(new ResponseVO<>(service.save(terminal)));
	}

	@RequestMapping(value = "/update/", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public ResponseEntity<ResponseVO<Terminal>> updateStore(@RequestBody Terminal terminal) {
		ResponseVO<Terminal> response = null;
		Terminal updatedTerminal = ((TerminalService) service).updateTerminal(terminal);
		if (updatedTerminal == null) {
			response = new ResponseVO<Terminal>(Constants.ERROR_CODE_GENERAL, Constants.ERROR_MESSAGE_UPDATE,
					updatedTerminal);
		} else {
			response = new ResponseVO<Terminal>(Constants.SUCCESS_CODE, Constants.SUCCESS_MESSAGE_UPDATE,
					updatedTerminal);
		}
		return ResponseEntity.ok(response);
	}

	@RequestMapping(value = "/{terminalId}", produces = "application/json; charset=UTF-8", method = RequestMethod.DELETE)
	public ResponseEntity<ResponseVO<Boolean>> deleteComplaint(@PathVariable("terminalId") Integer terminalId) {
		ResponseVO<Boolean> response = new ResponseVO<>(service.delete(terminalId));
		if (response.getResults()) {
			response.setCode(Constants.SUCCESS_CODE);
			response.setMessage(Constants.SUCCESS_MESSAGE_SAVE);
		} else {
			response.setCode(Constants.SUCCESS_CODE);
			response.setMessage(Constants.SUCCESS_MESSAGE_SAVE);
		}
		return ResponseEntity.ok(response);
	}

}
