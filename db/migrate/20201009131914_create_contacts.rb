class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name,          null: false
      t.string :email,         null: false
      t.string :title,         null: false
      t.text   :body,          null: false
      t.references :user,      foreign_key: true
      t.timestamps
    end
  end
end
