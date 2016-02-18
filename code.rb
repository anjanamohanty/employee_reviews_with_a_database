require './employee_and_department_migration.rb'
require './database_configuration.rb'

EmployeeAndDepartmentMigration.migrate(:up)
