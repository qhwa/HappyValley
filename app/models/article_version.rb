class ArticleVersion < ActiveRecord::Base
  belongs_to :article

  validates_presence_of :name, :body
end
