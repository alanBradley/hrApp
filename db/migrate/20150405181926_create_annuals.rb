class CreateAnnuals < ActiveRecord::Migration
  def change
    create_table :annuals do |t|
      t.datetime :date
      t.string :description
      t.references :employee, index: true

      t.timestamps null: false
    end
    add_foreign_key :annuals, :employees
  end
end
