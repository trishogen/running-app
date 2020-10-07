require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) {
    User.create(
      :email => "trish@gmail.com",
      :password => "password",
      :first_name => "trish"
    )
  }

  let(:first_route) {
    Route.create(
      :title => "Prospect Park",
      :location => "Brooklyn",
      :distance => 3.2,
      :elevation => 238,
      :description => "loop around propsect park",
      :creator => user
    )
  }

  let(:second_route) {
    Route.create(
      :title => "Central Park",
      :location => "Manhattan",
      :distance => 5,
      :elevation => 349,
      :description => "loop around central park",
      :creator => user
    )
  }

  let(:first_run) {
    Run.create(
      :title => "Saturday morning run",
      :date => "2020-09-27 00:00:00",
      :run_time => 28,
      :mood => "Tired",
      :user => user,
      :route => first_route
    )
  }

  let(:second_run) {
    Run.create(
      :title => "Tuesday morning jog",
      :date => "2020-08-23 00:00:00",
      :run_time => 40,
      :mood => "Relaxed",
      :user => user,
      :route => first_route
    )
  }

  it "is valid with an email, password, and first name" do
    expect(user).to be_valid
  end

  it "is not valid without a password" do
    expect(User.new(email: "trish@gmail.com")).not_to be_valid
  end

  it "has many runs" do
    first_run # create first run tied to user
    second_run # create second run tied to user
    expect(user.runs.first).to eq(first_run)
    expect(user.runs.last).to eq(second_run)
  end

  it "has many routes through runs" do
    first_route # create first route tied to user
    second_route # create second route tied to user
    expect(user.routes.first).to eq(first_route)
    expect(user.routes.last).to eq(second_route)
  end

  it "has a method 'been_on_run' that returns true when the user the run belongs to the user" do
    first_run # create first run tied to user
    expect(user.been_on_run(first_run)).to eq(true)
  end
end
