class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  validates :article_type, presence: true

  PUBLIC = 'public'
  PRIVATE = 'private'

  enum article_type: {
    public: PUBLIC,
    private: PRIVATE,
  }, _prefix: true
end
