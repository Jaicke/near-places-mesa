class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :city
      t.string :state
      t.string :street
      t.string :country

      t.timestamps
    end
  end
end
