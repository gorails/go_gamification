module Gamification
  class Inventory < ApplicationRecord
    self.table_name = "gamification_inventories"
    belongs_to :user
    belongs_to :item, class_name: 'Gamification::Item', foreign_key: :gamification_item_id

    scope :equipped, -> {where equipped: true}

    def unnequip_same_type_item(user_id)
      Inventory.where(user_id: user_id,gamification_items: {gamification_item_type_id: self.item.item_type.id}).joins(:item).update_all(equipped: false)
    end

    def unnequip_same_associated_jump_item(user_id)
      if self.item.item_type
        unequip_inventory = Inventory.where(user_id: user_id,gamification_item_types: {key: self.item.item_type.key + "jump"})
                                .joins(item: :item_group).joins(item: :item_type)
        if unequip_inventory.any?
          unequip_inventory.update_all(equipped: false)
        end
      end
    end

    def equipe_associated_jump_item(user_id)
      if self.item.item_group
        inventory = Inventory.where.not(id: self.id).where(user_id: user_id,gamification_item_groups: {id: self.item.item_group.id}).where(gamification_item_types: {key: self.item.item_type.key + "jump"})
                        .joins(item: :item_group).joins(item: :item_type)
        if inventory.any?
          inventory.update_all(:equipped => true)
        end
      end
    end

    def equip_item(user_id)
      unnequip_same_type_item(user_id)
      unnequip_same_associated_jump_item(user_id)
      equipe_associated_jump_item(user_id)
      self.update_attributes(:equipped => true)
    end

  end
end
