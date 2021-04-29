class Article < ApplicationRecord
  include Sortable

  belongs_to :user

  validates :title, presence: true,
                    length: { minimum: 3 },
                    uniqueness: { case_sensitive: false }
  validates :body, presence: true

  def self.sort_by
    %w[title body]
  end

  private_class_method :sort_by
end
