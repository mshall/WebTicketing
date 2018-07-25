package com.shall.customercomplaints.service;

import java.io.Serializable;
import org.springframework.data.repository.CrudRepository;
import com.shall.common.core.exception.*;

/**
 * @author Mohamed S. El-Shall <a href="www.facebook.com/M.S.ElShall">Catch
 *         me</a>
 * @param <T>
 *            of type
 */
public interface GenericService<T, ID extends Serializable> {

	public default T find(ID id) {
		return getRepository().findOne(id);
	}

	public default Iterable<T> findAll() {
		return getRepository().findAll();
	}

	public default T save(T entity) {
		return getRepository().save(entity);
	}

	public default boolean delete(ID id) {
		if (getRepository().exists(id)) {
			getRepository().delete(id);
			if(getRepository().exists(id)){
				return false;
			}else{
				return true;
			}
		} else {
			throw new GenericServiceException("Rating>> 'id' doesn't exists: " + id);
		}
	}

	public default T update(T entity) {
		if (getRepository().exists(getId(entity))) {
			return getRepository().save(entity);
		} else {
			throw new GenericServiceException("Can't update Rating because it doesn't exist in DB: " + entity);
		}
	}

	public ID getId(T entity);

	public CrudRepository<T, ID> getRepository();
}