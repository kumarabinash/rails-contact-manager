require 'rails_helper'

RSpec.describe "notes/index", type: :view do
  before(:each) do
    assign(:notes, [
      Note.create!(
        :body => "MyText",
        :person_id => 1
      ),
      Note.create!(
        :body => "MyText",
        :person_id => 1
      )
    ])
  end

  it "renders a list of notes" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
