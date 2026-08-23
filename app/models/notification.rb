class Notification < ApplicationRecord
  belongs_to :hemm
  belongs_to :notifiable, polymorphic: true
end
