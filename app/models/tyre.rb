class Tyre < ApplicationRecord
  belongs_to :hemm
  has_many :notifications,as: :notifiable,dependent: :destroy
  after_update :log_change_to_notification,if: :saved_changes?
  POSITIONS=%w[FL FR RL RR RLO RLI RRI RRO].freeze
  validates :position, presence: true
  validates :position, inclusion: { in: POSITIONS }
  validates :pressure, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 150
  },  allow_nil: true
  validates :sensor_id,uniqueness: true,allow_blank: true
  private
  def log_change_to_notification
    significant_changes = saved_changes.except(:updated_at , :created_at)
    return if significant_changes.empty?
    formatted_changes = significant_changes.map do |attribute, (old_value, new_value)|
      "#{attribute} from '#{old_value}' to '#{new_value}'"
    end.join(", ")

    Notification.create(
      hemm: hemm,
      notifiable: self,
      message: "#{hemm.slno} Tyre Changes detected: #{formatted_changes}",
    )
  end
end
