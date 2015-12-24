class ArticleVersion < ActiveRecord::Base
  belongs_to :article

  validates_presence_of :name, :body

  scope :after, ->(v) { where(article_id: v.article_id).where(['id > ?', v.id]) }
end
