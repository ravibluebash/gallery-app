class Album < ApplicationRecord
  has_many_attached :images,dependent: :destroy
  belongs_to :user
  has_and_belongs_to_many :tags, dependent: :destroy
  


  validates :title,:content, presence: true,
                    length: { minimum: 3 }
end
