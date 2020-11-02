# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles, id: false do |t|
      t.column :id, 'BIGINT PRIMARY KEY'
      t.string :title, null: false
      t.text :description, null: false
      t.string :link, null: false
      t.string :thumbnail, null: false

      t.timestamps
    end
  end
end
