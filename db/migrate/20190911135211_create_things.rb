class CreateThings < ActiveRecord::Migration[6.0]
  def change
    create_table :things, id: :uuid do |t|
      t.uuid :board_id, null: false
      t.string :summary, null: false
      t.text :details, null: false, default: ""
      t.datetime :completed_at
      t.string :type, null: false

      t.timestamps
    end
  end
end
