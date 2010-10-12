class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.text :data
      t.boolean :active, :default => false 
      t.text    :description
      t.datetime :born_at

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
