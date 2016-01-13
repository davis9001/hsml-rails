class CreateEbds < ActiveRecord::Migration
  def change
    create_table :ebds do |t|
      t.string :name
      t.string :description
      t.string :wikipedia_url

      t.timestamps null: false
    end
  end
end
