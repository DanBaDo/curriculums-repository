class CreateCurriculums < ActiveRecord::Migration[7.0]
  def change
    create_table :curriculums do |t|
      t.belongs_to :user
      t.string :file_url, null: false
      t.boolean :replaced, default: false, null: false
      t.timestamps
    end
  end
end
