package com.shall.customercomplaints.service;

import java.util.List;
import org.dozer.DozerBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;
import com.shall.customercomplaints.model.Sim;
import com.shall.customercomplaints.repository.SimRepository;

@Service
public class SimService implements GenericService<Sim, Integer> {

	@Autowired
	private SimRepository simRepository;

	@Autowired
	private DozerBeanMapper dozerMapper;

	@Override
	public CrudRepository<Sim, Integer> getRepository() {
		return simRepository;
	}

	@Override
	public Integer getId(Sim entity) {
		return entity.getSimSerial();
	}

	@Override
	public Sim save(Sim entity) {
		return GenericService.super.save(entity);
	}

	public List<Sim> findAllNewSims() {
		// Where false means new
		return simRepository.findBySimCondition(false);
	}

	public List<Sim> findAllUsedSims() {
		// where true means used
		return simRepository.findBySimCondition(true);
	}

	public List<Sim> findAllStockedSims() {
		// Where false means stocked
		return simRepository.findByStatus(false);
	}

	public List<Sim> findAllDeployedSims() {
		// Where true means deployed
		return simRepository.findByStatus(true);
	}

	public List<Sim> findByStoreId(int storeId) {
		return simRepository.findByStoreId(storeId);
	}

	public Sim findByMerchantId(int merhcnatId) {
		return simRepository.findByMerchantId(merhcnatId);
	}

	public Sim findByTerminalId(int terminalId) {
		return simRepository.findByTerminalId(terminalId);
	}

	public Sim updateSim(Sim sim) {
		if (sim.getSimSerial() != null) {
			Sim existing = simRepository.findOne(sim.getSimSerial());
			if (existing != null) {
				sim.setSimSerial(existing.getSimSerial());
				dozerMapper.map(sim, existing);
				Sim updatedSim = simRepository.save(existing);
				return updatedSim;
			} else {// This sim doesn't exist
				return null;
			}
		} else {
			return null;
		}

	}

	public long countSims() {
		return simRepository.count();
	}
}
