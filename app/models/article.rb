class Article < ApplicationRecord
  has_rich_text :content

  belongs_to :user
  validates :title, presence: true
  validates :article_type, presence: true

  PUBLIC = 'public'
  PRIVATE = 'private'
  UNPUBLISHED = 'unpublished'
  PUBLISHED = 'published'
  CANCELED = 'canceled'

  enum article_type: {
    public: PUBLIC,
    private: PRIVATE
  }, _prefix: true

  enum status: {
    unpublished: UNPUBLISHED,
    published: PUBLISHED,
    canceled: CANCELED
  }, _prefix: true
end
