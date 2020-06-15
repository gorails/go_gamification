module Gamification
  class ItemType < ApplicationRecord
    self.table_name = "gamification_item_types"
    has_many :items,class_name: 'Gamification::Item',foreign_key: :gamification_item_type_id
  end
end
