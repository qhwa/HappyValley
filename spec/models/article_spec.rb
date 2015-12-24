require 'rails_helper'

RSpec.describe Article, type: :model do
  it { expect(subject).to validate_presence_of :name }
  it { expect(subject).to validate_presence_of :body }

  context 'versions' do
    let(:article) { build :article }

    it { expect(subject).to have_many :versions }

    it do
      expect(article.versions).to eq []
    end

    it do
      article.save!
      expect(article.versions.size).to eq 1
    end
  end
end
