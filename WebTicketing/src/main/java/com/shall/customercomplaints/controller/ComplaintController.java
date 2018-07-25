//package com.shall.customercomplaints.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.RestController;
//
//import com.shall.customercomplaints.model.Complaint;
//import com.shall.customercomplaints.network.response.ResponseVO;
//import com.shall.customercomplaints.service.ComplaintService;
//import com.shall.customercomplaints.service.GenericService;
//
//@RestController
//@RequestMapping("/v1/complaint")
//public class ComplaintController {
//
//	@Autowired
//	private GenericService<Complaint, Long> service;
//
//	@RequestMapping(value = "/all", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
//	public ResponseEntity<ResponseVO<Iterable<Complaint>>> getAllCustomerAccounts() {
//		return ResponseEntity.ok(new ResponseVO<>(service.findAll()));
//	}
//
//	@RequestMapping(value = "/{complaint-id}", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
//	public ResponseEntity<ResponseVO<Complaint>> findComplaintById(@PathVariable("complaint-id") String complaintId) {
//		return ResponseEntity.ok(new ResponseVO<>(service.find(Long.parseLong(complaintId))));
//	}
//
//	@RequestMapping(value = "/", produces = "application/json; charset=UTF-8", method = RequestMethod.GET)
//	public ResponseEntity<ResponseVO<Iterable<Complaint>>> findComplaintByCustomerEmail(
//			@RequestParam("email") String email) {
//		return ResponseEntity.ok(new ResponseVO<>(((ComplaintService) service).findByCustomerEmail(email)));
//	}
//
//	@RequestMapping(value = "/", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
//	public ResponseEntity<ResponseVO<Complaint>> saveComplaint(@RequestBody Complaint complaint) {
//		return ResponseEntity.ok(new ResponseVO<>(service.save(complaint)));
//	}
//
//	@RequestMapping(value = "/", produces = "application/json; charset=UTF-8", method = RequestMethod.PATCH)
//	public ResponseEntity<ResponseVO<Complaint>> updateComplaint(@RequestBody Complaint complaint) {
//		return ResponseEntity.ok(new ResponseVO<>(service.update(complaint)));
//	}
//
//	@RequestMapping(value = "/{complaint-id}", produces = "application/json; charset=UTF-8", method = RequestMethod.DELETE)
//	public ResponseEntity<ResponseVO<Boolean>> deleteComplaint(@PathVariable("complaint-id") Long complaintId) {
//		return ResponseEntity.ok(new ResponseVO<>(service.delete(complaintId)));
//	}
//
//}
