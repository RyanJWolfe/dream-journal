require 'rails_helper'

RSpec.describe 'journals/index', type: :view do
  before(:each) do
    assign(:journals, [
             Journal.create!(
               title: 'Title',
               author: 'Author'
             ),
             Journal.create!(
               title: 'Title',
               author: 'Author'
             )
           ])
  end

  it 'renders a list of journals' do
    skip('auto generated, need to fix')
    render
    assert_select 'tr>td', text: 'Title'.to_s, count: 2
    assert_select 'tr>td', text: 'Author'.to_s, count: 2
  end
end
