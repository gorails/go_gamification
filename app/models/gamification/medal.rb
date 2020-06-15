module Gamification
  class Medal < ApplicationRecord
    self.table_name = "gamification_medals"
    belongs_to :goal

    has_one_attached :image
  end
end
