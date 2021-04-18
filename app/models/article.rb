class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true,
                    length: { minimum: 3 },
                    uniqueness: { case_sensitive: false }
  validates :body, presence: true
end
