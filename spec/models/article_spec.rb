require 'rails_helper'

RSpec.describe Article, type: :model do
  it { expect(subject).to validate_presence_of :name }
end
