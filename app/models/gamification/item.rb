module Gamification
  class Item < ApplicationRecord
    belongs_to :item_type
    belongs_to :user
    has_many :inventories,class_name: 'Gamification::Inventory',foreign_key: :gamification_item_id

    mount_uploader :image, ImageUploader
  end
end
