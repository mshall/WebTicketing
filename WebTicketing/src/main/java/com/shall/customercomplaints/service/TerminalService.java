package com.shall.customercomplaints.service;

import java.util.List;

import org.dozer.DozerBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;

import com.shall.customercomplaints.model.Merchant;
import com.shall.customercomplaints.model.Sim;
import com.shall.customercomplaints.model.Store;
import com.shall.customercomplaints.model.Terminal;
import com.shall.customercomplaints.repository.MerchantRepository;
import com.shall.customercomplaints.repository.SimRepository;
import com.shall.customercomplaints.repository.StoreRepository;
import com.shall.customercomplaints.repository.TerminalRepository;

@Service
public class TerminalService implements GenericService<Terminal, Integer> {

	@Autowired
	private TerminalRepository terminalRepository;

	@Autowired
	private StoreRepository StoreRepository;

	@Autowired
	MerchantRepository merchantRepository;

	@Autowired
	SimRepository simRepository;

	@Autowired
	private DozerBeanMapper dozerMapper;

	@Override
	public CrudRepository<Terminal, Integer> getRepository() {
		return terminalRepository;
	}

	@Override
	public Integer getId(Terminal entity) {
		return entity.getTerminalId();
	}

	public Terminal save(Terminal entity) {
		Store store = StoreRepository.findOne(entity.getStoreId());
		entity.setStoreName(store.getStoreName());
		return GenericService.super.save(entity);
	}

	public List<Terminal> findTerminalsByStatus(String status) {
		return terminalRepository.findByStatus(status);
	}

	public Terminal updateTerminal(Terminal terminal) {
		Terminal existingTerminal = terminalRepository.findOne(terminal.getTerminalId());

		if (existingTerminal != null) {
			try {
				// dozerMapper.map(terminal, existingTerminal);

				existingTerminal = mapTerminal(terminal, existingTerminal);
			} catch (Exception e) {
				e.printStackTrace();
			}
			Terminal updatedTerminal = terminalRepository.save(existingTerminal);
			updateSimForTerminalDeployment(terminal);
			return updatedTerminal;
		} else {// This user doesn't exist to be updated
			return null;
		}

	}

	public Terminal mapTerminal(Terminal source, Terminal destination) {
		if (source.getBranch() != null && !source.getBranch().isEmpty()) {
			destination.setBranch(source.getBranch());
		}
		if (source.getCondition() != null && !source.getCondition().isEmpty()) {
			destination.setCondition(source.getCondition());
		}
		if (source.getCreatedDate() != null) {
			destination.setCreatedDate(source.getCreatedDate());
		}
		if (source.getCurrency() != null && !source.getCurrency().isEmpty()) {
			destination.setCurrency(source.getCurrency());
		}
		if (source.getDeploymentDate() != null) {
			destination.setDeploymentDate(source.getDeploymentDate());
		}
		if (source.getFirstSimSerial() != 0) {
			destination.setFirstSimSerial(source.getFirstSimSerial());
		}
		if (source.getMerchantId() != 0) {
			destination.setMerchantId(source.getMerchantId());
		}
		if (source.getModel() != null && !source.getModel().isEmpty()) {
			destination.setModel(source.getModel());
		}
		if (source.getSecondSimSerial() != 0) {
			destination.setSecondSimSerial(source.getSecondSimSerial());
		}
		if (source.getStatus() != null && !source.getStatus().isEmpty()) {
			destination.setStatus(source.getStatus());
		}
		if (source.getStoreId() != 0) {
			destination.setStoreId(source.getStoreId());
		}
		if (source.getTerminalClass() != null && !source.getTerminalClass().isEmpty()) {
			destination.setTerminalClass(source.getTerminalClass());
		}
		if (source.getTerminalSerialNumber() != null && !source.getTerminalSerialNumber().isEmpty()) {
			destination.setTerminalSerialNumber(source.getTerminalSerialNumber());
		}

		return destination;
	}

	public void updateSimForTerminalDeployment(Terminal terminal) {
		Merchant merchant = merchantRepository.findOne(terminal.getMerchantId());
		Sim firstSim = simRepository.findOne(terminal.getFirstSimSerial());
		Sim secondSim = simRepository.findOne(terminal.getSecondSimSerial());
		if (merchant != null && firstSim != null && secondSim != null) {
			firstSim.setMerchantName(merchant.getMerchantName());
			firstSim.setMerchantId(merchant.getMerchantId());
			// ---------------------
			secondSim.setMerchantName(merchant.getMerchantName());
			secondSim.setMerchantId(merchant.getMerchantId());
			secondSim.setTerminalId(terminal.getTerminalId());
			secondSim.setTerminalSerial(terminal.getTerminalSerialNumber());
			firstSim.setTerminalId(terminal.getTerminalId());
			firstSim.setTerminalSerial(terminal.getTerminalSerialNumber());
			simRepository.save(firstSim);
			simRepository.save(secondSim);
		}

	}
}
