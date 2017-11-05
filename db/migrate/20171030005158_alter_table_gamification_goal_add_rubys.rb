class AlterTableGamificationGoalAddRubys < ActiveRecord::Migration[5.1]
  def change
    add_column :gamification_goals, :rubys, :integer
  end
end
