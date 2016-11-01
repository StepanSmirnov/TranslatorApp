class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.string :source
      t.text :fromlang
      t.text :lang
      t.string :text
      t.timestamps
    end
  end
end
