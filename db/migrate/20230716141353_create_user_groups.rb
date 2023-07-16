class CreateUserGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :user_groups do |t|
      t.string :description, null: false
      t.boolean :enabled, default: true, null: false
      t.timestamps
    end
  end
end
