require 'rails_helper'

RSpec.describe ArticleVersion, type: :model do
  it { expect(subject).to belong_to :article }
  it { expect(subject).to validate_presence_of :name }
  it { expect(subject).to validate_presence_of :body }
end
