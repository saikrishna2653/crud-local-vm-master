package eu.dreamix.crud.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import eu.dreamix.crud.domain.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {
	Employee findByName(String name);
}
