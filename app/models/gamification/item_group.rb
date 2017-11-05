module Gamification
  class ItemGroup < ApplicationRecord
    has_many :items,class_name: 'Gamification::Item',foreign_key: :gamification_item_group_id
  end
end
