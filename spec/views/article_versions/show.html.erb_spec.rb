require 'rails_helper'

RSpec.describe "article_versions/show.html.erb", type: :view do
  let(:article) { create :article }

  it do
    assign :article, article
    assign :article_version, article.versions.last
    render

    expect(rendered).to have_selector '.article.version'
  end
end
