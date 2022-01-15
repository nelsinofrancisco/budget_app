require 'rails_helper'

RSpec.feature 'Categories page', type: :feature, js: true do
  background do
    login_user
    visit group_path(@group.id)
  end

  scenario 'Should display the title' do
    expect(page).to have_content('Transactions')
  end

  scenario 'Should display transaction created' do
    expect(page).to have_content('pay Nelsino back')
  end

  scenario 'Should display transaction amount' do
    expect(page).to have_content '$ 20.0'
  end

  scenario 'should redirect to new category path' do
    click_button 'Add Transaction'
    expect(current_path).to eq(new_user_transaction_path)
  end
end
