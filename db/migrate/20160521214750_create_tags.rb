class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.text :tag_type
      t.belongs_to :film, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
