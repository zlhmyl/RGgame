class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.string :type
      t.string :info
      t.integer :human
      t.string :score

      t.timestamps
    end
  end
end