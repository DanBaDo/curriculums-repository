class CreateMenbership < ActiveRecord::Migration[7.0]
  def change
    create_table :menberships do |t|
      t.belongs_to :user
      t.belongs_to :user_group
      t.timestamps
    end
  end
end
