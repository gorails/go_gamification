module Gamification
  class ItemType < ApplicationRecord
    has_many :items,class_name: 'Gamification::Item',foreign_key: :gamification_item_type_id
  end
end
