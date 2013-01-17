require 'spec_helper'

describe User do
  it "includes the UserExtensions" do
    subject.should respond_to(:full_name)
  end
end