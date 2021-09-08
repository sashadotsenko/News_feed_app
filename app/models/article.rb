class Article < ApplicationRecord
  include ImageUploader::Attachment(:image)

  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true
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
