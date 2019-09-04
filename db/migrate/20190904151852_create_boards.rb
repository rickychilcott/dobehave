class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards, id: :uuid do |t|
      t.string :email
      t.text :vision

      t.timestamps
    end
  end
end
