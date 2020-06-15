module Gamification
  class ItemGroup < ApplicationRecord
    self.table_name = "gamification_item_groups"
    has_many :items, class_name: 'Gamification::Item',
      foreign_key: :gamification_item_group_id
  end
end
