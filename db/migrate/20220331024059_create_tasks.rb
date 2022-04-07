class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string     :matter,  null: false
      t.boolean    :finish,  default: false
      t.references :card,     null: false , foreign_key: true
      t.timestamps
    end
  end
end
