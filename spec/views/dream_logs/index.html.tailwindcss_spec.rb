require 'rails_helper'

RSpec.describe "dream_logs/index", type: :view do
  before(:each) do
    assign(:dream_logs, [
      DreamLog.create!(
        dream: false,
        remember: false,
        body: "MyText",
        sleep_time: 2,
        journal: nil
      ),
      DreamLog.create!(
        dream: false,
        remember: false,
        body: "MyText",
        sleep_time: 2,
        journal: nil
      )
    ])
  end

  it "renders a list of dream_logs" do
    render
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
