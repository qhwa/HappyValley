class Article < ActiveRecord::Base
  validates_presence_of :name, :body
  has_many :versions, class_name: 'ArticleVersion'
end
