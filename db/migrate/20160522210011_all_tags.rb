class AllTags < ActiveRecord::Migration
  def change
    create_table :all_tags do |t|
      t.string :all_list
      t.timestamps null: false
    end
  end
end
