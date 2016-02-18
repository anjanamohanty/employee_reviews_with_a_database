# Employee Reviews

This code allows you to create a department and add employees to it (with a name, email address, phone number and salary). You can then use it to give an employee a review, give them a raise and give raises across an entire department.

## Feature updates 2016-02-17

- Use ```Gemfile``` and ```employee_and_department_migration.rb``` to create database tables for your application or testing environments (see [ERD.png](ERD.png) for schema)
- NEW methods now available:
```ruby
a = Department.create(name: "Marketing")
emp_one = Employee.create(name: "Xavier", email: "ProfX@marvel.com", phone: "911", salary: 70000.00)
emp_two = Employee.create(name: "Dan", email: "d@mail.com", phone: "914-555-5555", salary: 50000.00)

a.employees << emp_one
a.employees << emp_two

b = Department.create(name: "Sales")
emp_three = Employee.create(name: "Yvonne", email: "Yvonne@urFired.com", phone: "919-123-4567", salary: 40000.00)

b.employees << emp_three

a.number_of_employees
# Returns the total number of employees in a department a.

a.lowest_paid_employee
# Returns the employee who is being paid the least in department a.

a.get_employees_in_abc_order
# Returns an arry of all employees in department a, ordered alphabetically by name.

a.employees_paid_above_average
# Returns an array of all employees in department a who are getting paid more than the average salary.

a.employees_with_palindrome_names
# Returns an array of all employees in department a with names which are palindromes.

Department.department_with_most_employees
# Returns the department with the most employees.

b.move_employees(a)
# Moves all employees from department b to department a.

Employee.give_raises
# Gives a raise of 10% to ALL employees with good reviews.
```

## Running the tests

If you wish to run the tests for this project, also include ```employee_reviews_test.rb``` in your project directory, and:

```bash
ruby employee_reviews_test.rb
```

## Creating employees and departments

Create a new department:
```ruby
computer_science = Department.new("Computer Science")
```

Create new employees:
```ruby
bob = Employee.new("Bob", "bob@email.com", "919-555-5555", 100000)
carl = Employee.new("Carl", "carl@email.com", "919-777-7777", 60000)
```

Add employees to a department:
```ruby
computer_science.employees << bob
computer_science.employees << carl
```

## Submitting reviews for employees
> Once a review is given for an employee their rating is automatically set as satisfactory or unsatisfactory, based on the review that was given.

```ruby
review_text = "Aliqua fap tousled distillery, scenester reprehenderit poutine
brunch mustache vinyl williamsburg listicle yr post-ironic put a bird on it.
Hoodie kombucha waistcoat, nesciunt franzen esse velit pitchfork cronut.
Wolf salvia gluten-free nisi, assumenda ramps four loko butcher raw denim narwhal
ennui veniam pabst. Adipisicing helvetica reprehenderit, nulla tattooed keytar."

bob.add_employee_review(review_text)
```

## Give raises based on current salary and satisfactory standing
```ruby
raise_amount = 5000

d.department_raise(raise_amount) {|e| e.satisfactory == true && e.salary < 60000.00}

# Gives a $5,000 raise to all employees in the department who make less that $60,000 and have a satisfactory rating based on their performance review.
```
