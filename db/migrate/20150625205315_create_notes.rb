class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :body
      t.integer :person_id

      t.timestamps null: false
    end
  end
end
