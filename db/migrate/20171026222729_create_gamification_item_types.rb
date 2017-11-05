class CreateGamificationItemTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :gamification_item_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
