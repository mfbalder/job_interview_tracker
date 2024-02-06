require 'rails_helper'

RSpec.describe "interviews/index", type: :view do
  before(:each) do
    assign(:interviews, [
      Interview.create!(),
      Interview.create!()
    ])
  end

  it "renders a list of interviews" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
