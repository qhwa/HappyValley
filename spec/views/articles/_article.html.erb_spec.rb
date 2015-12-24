require 'rails_helper'

RSpec.describe "articles/_article", type: :view do

  let(:article) { build :article }

  it do
    render partial: 'articles/article.html.erb', object: article
    expect(rendered).to have_selector '.article'
    expect(rendered).to have_content article.name
  end
end
