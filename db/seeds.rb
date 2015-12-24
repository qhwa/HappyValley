# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
require 'random_data'

100.times do
  Article.create(name: Random.alphanumeric, body: Random.paragraphs).tap do |article|
    rand(10).times do
      article.update body: Random.paragraphs
    end
  end
end
