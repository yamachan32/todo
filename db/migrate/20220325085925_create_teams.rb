class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :team_name,  null: false, default: ""
      t.text :team_explanation,  null: false
      t.references :user,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
