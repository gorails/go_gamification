class AddDescriptionToGoGamificationMedals < ActiveRecord::Migration[5.1]
  def change
     add_column :gamification_medals, :description, :text
  end
end
