require 'rails_helper'

describe 'Login process when successfull', type: :feature, js: true do
  before :each do
    @user = User
      .create(name: 'foo', email: 'foo1@foo.com', password: 'admin123', password_confirmation: 'admin123')
  end

  it 'Log in => Signed in successfully.' do
    visit new_user_session_path
    within('form') do
      fill_in 'user_email', with: 'foo1@foo.com'
      fill_in 'user_password', with: 'admin123'
    end

    all('a', text: 'Log In')[0].click

    expect(page).to have_content 'You have not added any category yet! Try adding one below.'
    expect(page).to have_content 'Add Category'
  end

  it 'redirects to root' do
    visit new_user_session_path
    within('form') do
      fill_in 'user_email', with: 'foo1@foo.com'
      fill_in 'user_password', with: 'admin123'
    end

    all('a', text: 'Log In')[0].click
    expect(current_path).to eq(root_path)
  end
end

describe 'Login process when unsuccesfull', type: :feature, js: true do
  before :each do
    @user = User
      .create(name: 'foo', email: 'foo1@foo.com', password: 'admin123', password_confirmation: 'admin123')
  end

  it 'when email and passoword are not found' do
    visit '/users/sign_in'
    within('form') do
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
    end

    all('a', text: 'Log In')[0].click

    expect(page).to have_content 'LOGIN'
  end

  it 'when email and passoword are not found' do
    visit '/users/sign_in'
    within('form') do
      fill_in 'user_email', with: 'fooooo1@foo.com'
      fill_in 'user_password', with: 'admin123'
    end
    all('a', text: 'Log In')[0].click

    expect(page).to have_content 'LOGIN'
  end

  it 'when email and passoword are not found' do
    visit '/users/sign_in'
    within('form') do
      fill_in 'user_email', with: 'user@example.com'
      fill_in 'user_password', with: 'thisisnotthepassword'
    end
    all('a', text: 'Log In')[0].click

    expect(page).to have_content 'LOGIN'
  end
end
