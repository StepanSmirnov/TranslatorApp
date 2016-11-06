class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.string :source
      t.text :fromlang
      t.text :lang
      t.string :text
      t.timestamps
    end
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
    end
    add_index :users, :email, unique: true
  end
end
