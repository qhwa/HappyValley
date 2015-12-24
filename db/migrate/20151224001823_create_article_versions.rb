class CreateArticleVersions < ActiveRecord::Migration
  def change
    create_table :article_versions do |t|
      t.references :article, index: true
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
