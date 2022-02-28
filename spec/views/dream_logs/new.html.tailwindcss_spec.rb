require 'rails_helper'

RSpec.describe "dream_logs/new", type: :view do
  before(:each) do
    assign(:dream_log, DreamLog.new(
      dream: false,
      remember: false,
      body: "MyText",
      sleep_time: 1,
      journal: nil
    ))
  end

  it "renders new dream_log form" do
    render

    assert_select "form[action=?][method=?]", dream_logs_path, "post" do

      assert_select "input[name=?]", "dream_log[dream]"

      assert_select "input[name=?]", "dream_log[remember]"

      assert_select "textarea[name=?]", "dream_log[body]"

      assert_select "input[name=?]", "dream_log[sleep_time]"

      assert_select "input[name=?]", "dream_log[journal_id]"
    end
  end
end
