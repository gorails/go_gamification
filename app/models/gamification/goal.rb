module Gamification
  class Goal < ApplicationRecord
    self.table_name = "gamification_goals"
    belongs_to :rewarding, polymorphic: true
    has_one :medal, dependent: :destroy
    has_many :rewards, dependent: :destroy

    accepts_nested_attributes_for :medal, allow_destroy: true, reject_if: :all_blank

    # TODO: These should be SQL. But that's hard.
    scope :completed_by,  ->(subject) { all.select { |goal| goal.completed_by? subject }}
    scope :incomplete_by, ->(subject) { all.reject { |goal| goal.completed_by? subject }}

    # Determine whether the given subject has completed the goal.
    #
    # subject - An ActiveRecord model that can receive rewards.
    def completed_by? subject
      !!reward_for(subject)
    end

    # Complete the goal for the given subject.
    #
    # subject - An ActiveRecord model that can receive rewards.
    def complete_for subject
      if completed_by? subject
        raise Completed, "#{self} is already completed for #{subject}"
      else
        Reward.create! goal: self, rewardable: subject
      end
    end

    private

    # Find the Reward for the given subject.
    #
    # subject - A rewardable model.
    def reward_for rewardable
      rewards.find_by rewardable: rewardable
    end
  end
end
