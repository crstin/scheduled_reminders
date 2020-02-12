require 'rails_helper'

RSpec.describe 'reminders/index', type: :view do
  let(:user) { create :user }
  before(:each) do
    assign(:reminders, [
      Reminder.create(title: 'aaa', body: 'bbb', date: '2020-02-20 02:02:02', user_id: user.id),
      Reminder.create(title: 'aaa', body: 'bbb', date: '2020-02-20 02:02:02', user_id: user.id)
    ])
  end

  it 'renders a list of reminders' do
    render
    assert_select 'tr>td', text: 'aaa'.to_s, count: 2
    assert_select 'tr>td', text: 'bbb'.to_s, count: 2
    assert_select 'tr>td', text: '2020-02-20 02:02:02 UTC'.to_s, count: 2
  end
end
