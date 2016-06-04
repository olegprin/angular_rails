class Configurables < ActiveRecord::Migration
  def change
    create_table :configurables do |t|
      t.string :name
      t.string :value

      t.timestamps
    end  
  end
end
