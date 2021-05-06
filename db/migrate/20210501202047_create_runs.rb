class CreateRuns < ActiveRecord::Migration[4.2]
  def change
    create_table :runs do |t|
      t.string :date
      t.integer :distance
      t.integer :duration
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
