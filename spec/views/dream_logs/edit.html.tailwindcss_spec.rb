require 'rails_helper'

RSpec.describe "dream_logs/edit", type: :view do
  before(:each) do
    @dream_log = assign(:dream_log, DreamLog.create!(
      dream: false,
      remember: false,
      body: "MyText",
      sleep_time: 1,
      journal: nil
    ))
  end

  it "renders the edit dream_log form" do
    render

    assert_select "form[action=?][method=?]", dream_log_path(@dream_log), "post" do

      assert_select "input[name=?]", "dream_log[dream]"

      assert_select "input[name=?]", "dream_log[remember]"

      assert_select "textarea[name=?]", "dream_log[body]"

      assert_select "input[name=?]", "dream_log[sleep_time]"

      assert_select "input[name=?]", "dream_log[journal_id]"
    end
  end
end
