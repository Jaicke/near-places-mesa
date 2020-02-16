class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :note
      t.text :comment
      t.references :user
      t.references :place

      t.timestamps
    end
  end
end
