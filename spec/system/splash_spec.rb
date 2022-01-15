require 'rails_helper'

RSpec.feature 'Splash page', type: :feature, js: true do
  before :each do
    visit root_path
  end

  it 'Should display the app name' do
    expect(page).to have_content('SmartTrackApp')
  end

  it 'Should display Login button' do
    click_button 'Log in'

    expect(current_path).to eq(new_user_session_path)
  end

  it 'Should display Signup button' do
    click_button 'Sign Up'

    expect(current_path).to eq(new_user_registration_path)
  end
end
