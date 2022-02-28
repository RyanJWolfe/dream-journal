require 'rails_helper'

RSpec.describe "journals/show", type: :view do
  before(:each) do
    @journal = assign(:journal, Journal.create!(
      title: "Title",
      author: "Author"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Author/)
  end
end
