class AlterTableGoGamificationLevels < ActiveRecord::Migration[5.1]
  def change
    add_column :gamification_levels, :level, :integer
  end
end
