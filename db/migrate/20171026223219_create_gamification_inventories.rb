class CreateGamificationInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :gamification_inventories do |t|
      t.integer :user_id
      t.references :gamification_item, foreign_key: true
      t.boolean :equipped

      t.timestamps
    end
  end
end
