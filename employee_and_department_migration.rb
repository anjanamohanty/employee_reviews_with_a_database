require 'active_record'

class EmployeeAndDepartmentMigration < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.timestamps
    end

    create_table :employees do |t|
      t.references :department
      t.string :name
      t.string :email
      t.string :phone
      t.decimal :salary
      t.text :review
      t.boolean :satisfactory
      t.timestamps
    end
  end
end
