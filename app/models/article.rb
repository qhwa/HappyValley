class Article < ActiveRecord::Base
  validates_presence_of :name, :body
end
