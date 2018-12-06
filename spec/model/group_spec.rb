require 'rails_helper'

RSpec.describe Group, type: :model do
    let(:name)  { 'Tricycle' }

    # describe "validations" do
    #     it { should validate_presence_of(:name) }
    # end

    describe "group name" do
        it "takes in a name with less than 5 characters" do
            @group = Group.create(name: name)
            expect( Group.find_by(name: name) ).not_to be nil      
        end
    end
end