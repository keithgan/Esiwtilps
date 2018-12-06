require 'rails_helper'

RSpec.describe User, type: :model do
    let(:name)  { 'Keith' }
    let(:proper_email)  { 'keith@gmail.com' }
    let(:improper_email)    { 'wwwabreger' }
    let(:password)  {'keith'}

    context "validation" do
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:email) }
        it { should validate_presence_of(:password) }
        it { should allow_value(proper_email).for(:email) }
        it { should_not allow_value(improper_email).for(:email)  }
    end

    context "association" do
       it { should have_many(:authentications) }
       it { should have_many(:memberships) }
       it { should have_many(:friends) }
    end

    context "creates:" do
        it "takes in one valid email" do
			expect{ User.create(email: proper_email) }.not_to raise_error
        end
        
        it "won't create an entry if invalid email is being supplied" do
			User.create(email: improper_email)
			expect( User.find_by(email: improper_email) ).to be nil
        end
        
        it "creates an entry with 3 inputs when proper_inputs are supplied" do
			User.create(name: name, email: proper_email, password: password)
			expect( User.find_by(name: name) ).not_to be nil
		end
	end
end