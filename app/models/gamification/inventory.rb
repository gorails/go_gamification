module Gamification
  class Inventory < ApplicationRecord
    belongs_to :user
    belongs_to :item ,class_name: 'Gamification::Item',foreign_key: :gamification_item_id

    scope :equipped, -> { where equipped: true }

    def unnequip_same_type_item
      Inventory.where(gamification_items: {gamification_item_type_id:self.item.item_type.id}).joins(:item).update_all(equipped:false)
    end
  end
end
