class Article < ActiveRecord::Base
  validates_presence_of :name, :body

  has_many :versions, class_name: 'ArticleVersion', dependent: :destroy

  after_save :append_version

  private

    def append_version
      versions.create! attributes.slice('name', 'body')
    end

end
