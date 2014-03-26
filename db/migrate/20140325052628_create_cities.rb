class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
    	t.string :name
    	t.integer :woeid
    	t.float :lat
    	t.float :long
    	t.text :trendlist

      t.timestamps
    end
  end
end
