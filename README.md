# Employee Reviews

This code allows you to create a department and add employees to it (with a name, email address, phone number and salary). You can then use it to give an employee a review, give them a raise and give raises across an entire department.

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
