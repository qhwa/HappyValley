require 'rails_helper'

RSpec.describe "article_versions/index.html.erb", type: :view do
  let(:article) { create :article }

  it do
    assign :article, article
    assign :article_versions, article.versions
    render

    expect(rendered).to have_selector 'li'
  end
end
