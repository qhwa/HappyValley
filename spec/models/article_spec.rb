require 'rails_helper'

RSpec.describe Article, type: :model do
  it { expect(subject).to validate_presence_of :name }
  it { expect(subject).to validate_presence_of :body }

  context 'versions' do
    let(:article) { build :article }
    let(:save) { article.save! }
    let(:versions) { article.versions }
    let(:first_version) { article.versions.first }

    it { expect(subject).to have_many :versions }

    it do
      expect(article.versions).to eq []
    end

    it do
      save
      expect(article.versions.size).to eq 1
    end

    it 'saved with exactly the same values' do
      save
      expect(first_version.name).to eq article.name
      expect(first_version.body).to eq article.body
    end

    it 'append versions on saving' do
      name_mapping = ->(i) { "hello #{i}" }
      
      3.times { |i| article.update name: name_mapping.call(i) }
      expect(article.versions.map(&:name)).to eq 3.times.map {|i| name_mapping.call(i) }
    end

    it 'remove revsions on destroying' do
      save
      article.destroy!
      expect(article.versions).to eq []
    end
  end
end
