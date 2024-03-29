require 'rails_helper'

RSpec.describe "jobs/edit", type: :view do
  let(:job) do
    Job.create!
  end

  before(:each) do
    assign(:job, job)
  end

  it "renders the edit job form" do
    render

    assert_select "form[action=?][method=?]", job_path(job), "post" do
    end
  end
end
