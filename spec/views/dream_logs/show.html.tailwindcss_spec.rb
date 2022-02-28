require 'rails_helper'

RSpec.describe "dream_logs/show", type: :view do
  before(:each) do
    @dream_log = assign(:dream_log, DreamLog.create!(
      dream: false,
      remember: false,
      body: "MyText",
      sleep_time: 2,
      journal: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
