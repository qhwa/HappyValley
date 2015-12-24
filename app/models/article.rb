class Article < ActiveRecord::Base
  validates_presence_of :name, :body

  has_many :versions, -> { order(created_at: :desc) }, class_name: 'ArticleVersion', dependent: :destroy

  after_save :append_version

  VERSIONED_COLUMS = %w[name body]

  # TODO: cache it in database
  def versions_count
    versions.count
  end

  # when restored to a version, append a new version
  def restore version
    attrs = version.attributes
    VERSIONED_COLUMS.each do |k|
      self.send "#{k}=", attrs[k]
    end
    self.save!
  end

  # when rolled back to a version, all versions after that
  # version lose!
  def rollback_to! version
    transaction do
      restore version
      versions.after(version).destroy_all
    end
  end

  private

    def append_version
      versions.create! attributes.slice(*VERSIONED_COLUMS)
    end

end
