package eu.dreamix.crud.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import eu.dreamix.crud.domain.Department;

public interface DepartmentRepository extends JpaRepository<Department, Integer> {
	List<Department> findAllByDescription(String description);
}
