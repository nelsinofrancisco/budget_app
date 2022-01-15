require 'rails_helper'

RSpec.feature 'Categories page', type: :feature, js: true do
  background do
    login_user
    visit root_path
  end

  scenario 'Should display the title' do
    expect(page).to have_content('Categories')
  end

  scenario 'Should display Category created' do
    expect(page).to have_content('Loan')
  end

  scenario 'Should display transactions quantities' do
    expect(page).to have_content "Transactions: #{@group.transaction_groups.length}"
  end

  scenario 'should redirect to new category path' do
    find('button', text: 'Add Category').click
    expect(current_path).to eq(new_group_path)
  end
end
