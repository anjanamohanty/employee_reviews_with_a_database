require './employee'
require 'active_record'

class Department < ActiveRecord::Base
  has_many :employees

  def add_employee(new_employee)
    new_employee.department = self
    new_employee.save
  end

  def department_salary
    employees.reduce(0.0) {|sum, e| sum + e.salary}
  end

  def department_raise(alloted_amount)
    raise_eligible = employees.select {|e| yield(e)}
    amount = alloted_amount / raise_eligible.length

    raise_eligible.each do |e|
      e.raise_by_amount(amount)
    end
  end

  def number_of_employees
    employees.count
  end

  def lowest_paid_employee
    employees.order(salary: :asc).first
  end
end
