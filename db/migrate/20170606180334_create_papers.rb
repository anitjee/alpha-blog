class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.datetime :timestamp
    end
  end
end
