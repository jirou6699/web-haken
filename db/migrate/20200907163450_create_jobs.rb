class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.text :title,             null: false
      t.string :occupation,      null: false
      t.string :image1,          null: false
      t.string :image2,          null: false
      t.string :image3,          null: false
      t.text :description,       null: false
      t.string :salary,          null: false
      t.text :access,            null: false
      t.string :time,            null: false
      t.string :week,            null: false
      t.string :emplyee,         null: false
      t.string :term,            null: false
      t.string :pr1,             null: false
      t.string :pr2,             null: false
      t.string :pr3,             null: false
      t.timestamps
    end
  end
end