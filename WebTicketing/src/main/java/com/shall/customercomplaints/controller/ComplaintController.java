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
import com.shall.customercomplaints.network.response.ResponseVO;
import com.shall.customercomplaints.service.ComplaintService;
import com.shall.customercomplaints.service.GenericService;
import com.webticketing.util.Constants;

@CrossOrigin
@RestController
@RequestMapping("/v1/complaint")
public class ComplaintController {

	@Autowired
	private GenericService<Complaint, Long> service;

	@RequestMapping(value = "/all", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Iterable<Complaint>>> getAllComplaint() {
		return ResponseEntity.ok(new ResponseVO<>(service.findAll()));
	}

	@RequestMapping(value = "/status/{complaintStatus}", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Iterable<Complaint>>> findComplaintsByStatusd(
			@PathVariable("complaintStatus") String complaintStatus) {
		return ResponseEntity.ok(new ResponseVO<>(((ComplaintService) service).findByStatus(complaintStatus)));
	}

	@RequestMapping(value = "/{complaintId}", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Complaint>> findComplaintById(@PathVariable("complaintId") String complaintId) {
		return ResponseEntity.ok(new ResponseVO<>(service.find(Long.parseLong(complaintId))));
	}

	@RequestMapping(value = "/", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Iterable<Complaint>>> findComplaintByTechnicianId(
			@RequestParam("technicianId") int technicianId) {
		return ResponseEntity.ok(new ResponseVO<>(((ComplaintService) service).findByTechnicianId(technicianId)));
	}

	@RequestMapping(value = "/phone", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
	public ResponseEntity<ResponseVO<Iterable<Complaint>>> findComplaintByPhoneNumber(
			@RequestParam("phoneNumber") String phoneNumber) {
		return ResponseEntity.ok(new ResponseVO<>(((ComplaintService) service).findByPhoneNumber(phoneNumber)));
	}

	@RequestMapping(value = "/", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public ResponseEntity<ResponseVO<Complaint>> saveComplaint(@RequestBody Complaint complaint) {
		return ResponseEntity.ok(new ResponseVO<>(service.save(complaint)));
	}

	@RequestMapping(value = "/update", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public ResponseEntity<ResponseVO<Complaint>> updateComplaint(@RequestBody Complaint complaint) {
		ResponseVO<Complaint> response = null;
		Complaint updatedComplaint = ((ComplaintService) service).updateComplaint(complaint);
		if (updatedComplaint == null) {
			response = new ResponseVO<Complaint>(Constants.ERROR_CODE_GENERAL, Constants.ERROR_MESSAGE_USER_UPDATE,
					updatedComplaint);
		} else {
			response = new ResponseVO<Complaint>(Constants.SUCCESS_CODE, Constants.SUCCESS_MESSAGE_UPDATE,
					updatedComplaint);
		}
		return ResponseEntity.ok(response);
	}

	@RequestMapping(value = "/{complaintId}", produces = "application/json; charset=UTF-8", method = RequestMethod.DELETE)
	public ResponseEntity<ResponseVO<Boolean>> deleteComplaint(@PathVariable("complaintId") Long complaintId) {
		ResponseVO<Boolean> response = new ResponseVO<>(service.delete(complaintId));
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
