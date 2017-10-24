module Gamification
  class Medal < ApplicationRecord
    belongs_to :goal

    mount_uploader :image, ImageUploader
  end
end
