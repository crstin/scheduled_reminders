require 'rails_helper'

RSpec.describe 'reminders/show', type: :view do
  before(:each) do
    @reminder = create(:reminder)
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/TitleTestMsg/)
    expect(rendered).to match(/BodyTestMsg/)
    expect(rendered).to match(/2020-02-20 02:02:02/)
  end
end
