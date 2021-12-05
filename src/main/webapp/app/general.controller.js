angular.module("crudApp").controller("GeneralController", GeneralController);

GeneralController.inject = [ '$scope', 'Employee', 'Department' ];

function GeneralController($scope, Employee, Department) {
	$scope.departments = Department.query();
	$scope.employees = Employee.query();

	$scope.employee = {};
	$scope.department = {};

	$scope.saveEmployee = function() {
		if ($scope.employee.id !== undefined) {
			Employee.update($scope.employee, function() {
				$scope.employees = Employee.query();
				$scope.employee = {};
			});
		} else {
			Employee.save($scope.employee, function() {
				$scope.employees = Employee.query();
				$scope.employee = {};
			});
		}
	}

	$scope.updateEmployeeInit = function(employee) {
		$scope.employee = employee;
	}

	$scope.deleteEmployee = function(employee) {
		employee.$delete({id: employee.id}, function() {
			$scope.employees = Employee.query();
		});
	}

	$scope.saveDepartment = function() {
		if ($scope.department.id !== undefined) {
			Department.update($scope.department, function() {
				$scope.departments = Department.query();
				$scope.department = {};
			});
		} else {
			Department.save($scope.department, function() {
				$scope.departments = Department.query();
				$scope.department = {};
			});
		}
	}

	$scope.deleteDepartment = function(department) {
		department.$delete({id: department.id}, function() {
			$scope.departments = Department.query();
		});
	}

	$scope.updateDepartmentInit = function(department) {
		$scope.department = department;
	}
}