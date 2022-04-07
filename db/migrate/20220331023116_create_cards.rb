class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string      :title,         null: false
      t.text        :explanation
      t.integer     :working_hours, null: false
      t.date        :limit_date
      t.date        :working_date
      t.references  :user,          null: false , foreign_key: true
      t.integer     :owner_id,      null: false 
      t.timestamps
    end
  end
end
