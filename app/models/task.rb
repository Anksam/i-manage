class Task < ApplicationRecord
  belongs_to :taskable, polymorphic: true
end
