package com.shall.customercomplaints.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Service;
import com.shall.customercomplaints.model.Terminal;
import com.shall.customercomplaints.repository.TerminalRepository;

@Service
public class TerminalService implements GenericService<Terminal, Integer> {

	@Autowired
	private TerminalRepository terminalRepository;

	@Override
	public CrudRepository<Terminal, Integer> getRepository() {
		// TODO Auto-generated method stub
		return terminalRepository;
	}

	@Override
	public Integer getId(Terminal entity) {
		return entity.getTerminalId();
	}

	public Terminal updateTerminal(Terminal terminal) {
		Terminal existingTerminal = terminalRepository.findOne(terminal.getTerminalId());
		if (existingTerminal != null) {
			terminal.setTerminalId((existingTerminal.getTerminalId()));
			Terminal updatedTerminal = terminalRepository.save(terminal);
			return updatedTerminal;
		} else {// This user doesn't exist to be updated
			return null;
		}

	}
}
