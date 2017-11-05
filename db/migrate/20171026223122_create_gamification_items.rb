class CreateGamificationItems < ActiveRecord::Migration[5.1]
  def change
    create_table :gamification_items do |t|
      t.string :name
      t.references :gamification_item_type, foreign_key: true
      t.string :image
      t.integer :rarity
      t.numeric :cost
      t.integer :user_id
      t.text :description

      t.timestamps
    end
  end
end
