require 'rails_helper'

RSpec.describe Run, :type => :model do
  let(:user) {
    User.create(
      :email => "trish@gmail.com",
      :password => "password",
      :first_name => "trish"
    )
  }

  let(:route) {
    Route.create(
      :title => "Prospect Park",
      :location => "Brooklyn",
      :distance => 3.2,
      :elevation => 238,
      :description => "loop around propsect park",
      :creator => user
    )
  }

  let(:run) {
    Run.create(
      :title => "Saturday morning run",
      :date => "2020-09-27 00:00:00",
      :run_time => 28,
      :mood => "Tired",
      :user => user,
      :route => route
    )
  }

  it "is valid with an title, date, run_time, mood, user, and route" do
    expect(run).to be_valid
  end

  it "is not valid without a title" do
    expect(Run.new(run_time: 27)).not_to be_valid
  end

  it "belongs to one user" do
    expect(run.user).to eq(user)
  end

  it "belongs to one route" do
    expect(run.route).to eq(route)
  end

end
