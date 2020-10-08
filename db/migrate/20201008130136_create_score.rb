class CreateScore < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|
      t.string :title
      t.string :composer
      t.string :genre
      t.integer :year_composed
      t.integer :user_id
    end
  end
end
