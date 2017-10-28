class CreateGamificationItemGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :gamification_item_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
