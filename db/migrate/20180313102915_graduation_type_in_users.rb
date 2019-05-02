class GraduationTypeInUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :graduation, :string
  end
end
