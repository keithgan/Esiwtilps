require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(user).to be_valid
  end
end

describe User do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
  end