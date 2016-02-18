require './employee'
require 'active_record'
require 'byebug'

class Department < ActiveRecord::Base
  has_many :employees

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

  def get_employees_in_abc_order
    employees.order(name: :asc)
  end

  def employees_paid_above_average
    average = (employees.reduce(0.0) {|sum, i| sum + i.salary}) / employees.count
    array = []
    employees.each {|e| array << e if (e.salary > average)}
    array
  end

  def employees_with_palindrome_names
    array = []
    employees.each {|e| array << e if (e.name.downcase == e.name.downcase.reverse)}
    array
  end

  def self.department_with_most_employees
    relation = Department.joins(:employees).group("departments.id").count
    Department.find(relation.key(relation.values.max))
  end

  def move_employees(new_dept)
    employees.each do |e|
      e.department_id = new_dept.id
      e.save
    end
  end
end
