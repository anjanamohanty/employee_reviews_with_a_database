require './employee'
require 'active_record'

class Department < ActiveRecord::Base
  has_many :employees

  def add_employee(new_employee)
    new_employee.department = self
    new_employee.save
  end

  def department_salary
    employees = Employee.where(department: self)
    employees.reduce(0.0) {|sum, e| sum + e.salary}
  end

  def department_raise(alloted_amount)
    raise_eligible = @staff.select {|e| yield(e)}
    amount = alloted_amount / raise_eligible.length
    raise_eligible.each {|e| e.raise_by_amount(amount)}
  end
end
