require 'rails_helper'

RSpec.describe "interviews/edit", type: :view do
  let(:interview) do
    Interview.create!
  end

  before(:each) do
    assign(:interview, interview)
  end

  it "renders the edit interview form" do
    render

    assert_select "form[action=?][method=?]", interview_path(interview), "post" do
    end
  end
end
