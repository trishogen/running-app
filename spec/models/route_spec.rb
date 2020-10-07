require 'rails_helper'

RSpec.describe Route, :type => :model do
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

  it "is valid with an title, location, distance, elevation, and description" do
    expect(route).to be_valid
  end

  it "is not valid without a title" do
    expect(Route.new(location: "Florida")).not_to be_valid
  end

  it "belongs to one creator" do
    expect(route.creator).to eq(user)
  end

  it "has many runs" do
    run # create run tied to route
    expect(route.runs.first).to eq(run)
  end

  it "has many users" do
    run # create run tied to user and route
    expect(route.users.first).to eq(user)
  end

end
