require 'rails_helper'

RSpec.describe 'reminders/new', type: :view do
  before(:each) do
    assign(:reminder, build(:reminder))
  end

  it 'renders new reminder form' do
    render

    assert_select 'form[action=?][method=?]', reminders_path, 'post' do
      assert_select 'input[name=?]', 'reminder[title]'
      assert_select 'textarea[name=?]', 'reminder[body]'
    end
  end
end
