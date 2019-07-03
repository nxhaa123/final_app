class Photo < ApplicationRecord
  belongs_to :tabPhoto, polymorphic: true
end
