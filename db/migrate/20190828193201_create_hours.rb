class CreateHours < ActiveRecord::Migration[5.2]
  def change
    create_table :hours do |t|
      t.string :notes
      t.integer :user_id
      t.datetime :date_start, null: false
      t.datetime :date_end,  null: false
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
