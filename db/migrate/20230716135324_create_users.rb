class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.boolean :verified, default: false, null: false
      t.boolean :disabled, default: false, null: false
      t.timestamps
    end
  end
end
