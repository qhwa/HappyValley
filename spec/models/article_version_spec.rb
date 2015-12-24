require 'rails_helper'

RSpec.describe ArticleVersion, type: :model do
  it { expect(subject).to belong_to :article }
end
