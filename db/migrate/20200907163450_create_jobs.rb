class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.text :title
      t.string :image1
      t.text :description
      t.string :salary
      t.text :access
      t.string :time
      t.string :week
      t.string :emplyee
      t.string :term
      t.timestamps
    end
  end
end
