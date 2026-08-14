class Dumper < ApplicationRecord
  validates :name, presence: true
  validates :project, presence: true
  validates :slno, presence: true
end
