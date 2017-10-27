module Gamification
  class Inventory < ApplicationRecord
    belongs_to :user
    belongs_to :item ,class_name: 'Gamification::Item',foreign_key: :gamification_item_id

    scope :equipped, -> { where equipped: true }
  end
end
