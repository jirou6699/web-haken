class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :good,           null: false
      t.text :bad,            null: false
      t.references :job,      foreign_key: true
      t.references :user,     foreign_key: true
      t.timestamps
    end
  end
end
