class Add < ActiveRecord::Migration
  def change
    add_column :articles, :headline, :String
    add_column :articles, :descript, :text
  end
end
