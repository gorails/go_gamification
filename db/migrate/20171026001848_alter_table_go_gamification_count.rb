class AlterTableGoGamificationCount < ActiveRecord::Migration[5.1]
  def change
    add_column :gamification_goals, :count, :integer
  end
end
