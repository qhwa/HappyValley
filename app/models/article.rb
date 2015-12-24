class Article < ActiveRecord::Base
  validates_presence_of :name, :body

  has_many :versions, -> { order(created_at: :desc) }, class_name: 'ArticleVersion', dependent: :destroy

  after_save :append_version

  # TODO: cache it in database
  def versions_count
    versions.count
  end

  private

    def append_version
      versions.create! attributes.slice('name', 'body')
    end

end
