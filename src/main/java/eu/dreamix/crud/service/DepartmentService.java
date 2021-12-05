package eu.dreamix.crud.service;

import java.util.List;

import javax.persistence.EntityExistsException;
import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import eu.dreamix.crud.domain.Department;
import eu.dreamix.crud.repository.DepartmentRepository;

@Service
public class DepartmentService {
	private DepartmentRepository departmentRepository;

	@Autowired
	public DepartmentService(DepartmentRepository departmentRepository) {
		this.departmentRepository = departmentRepository;
	}

	public Department save(Department department) {
		if (department.getId() != null && departmentRepository.exists(department.getId())) {
			throw new EntityExistsException("There is already existing entity with such ID in the database.");
		}

		return departmentRepository.save(department);
	}

	public Department update(Department department) {
		if (department.getId() != null && !departmentRepository.exists(department.getId())) {
			throw new EntityNotFoundException("There is no entity with such ID in the database.");
		}

		return departmentRepository.save(department);
	}

	public List<Department> findAll() {
		return departmentRepository.findAll();
	}

	public Department findOne(Integer id) {
		return departmentRepository.findOne(id);
	}

	public void delete(Integer id) {
		departmentRepository.delete(id);
	}
}
