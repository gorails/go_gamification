class CreateGoGamificationLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :gamification_levels do |t|
      t.integer :experience
      t.integer :previous_level_difference
      t.timestamps
    end
  end
end
