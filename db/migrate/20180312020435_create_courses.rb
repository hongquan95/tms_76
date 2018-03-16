class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :description
      t.integer :trash, default: 0
      t.string :status
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
    add_index :courses, :name, unique: true
  end
end
