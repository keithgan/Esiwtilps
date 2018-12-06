require 'rails_helper'

feature "Sign Up" do
    scenario "When a user tries to sign up" do
        visit "/"
        click_on "Sign Up"
        expect(page).to have_text("Sign Up")

        fill_in "Name", :with => "Keith"
        fill_in "Email", :with => "keith@gmail.com"
        fill_in "Password", :with => "keith"
        click_button "Sign me up!"

        page.html

        expect(page).to have_text("Welcome to Esiwtilps!")
    end
end