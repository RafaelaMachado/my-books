# frozen_string_literal: true

require 'rails_helper'

feature 'Show home' do
  it 'published books for anon user' do
    FactoryBot.create(:book)

    visit root_path

    expect(page).not_to have_content('Edit')
    expect(page).not_to have_content('Destroy')

    expect(page).to have_content('O Guia')
    expect(page).to have_content('das galaxias')
    expect(page).to have_content('Douglas Adams')
  end

  it 'published books for logged user' do
    FactoryBot.create(:book)
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)

    visit root_path

    expect(page).to have_content('Edit')
    expect(page).to have_content('Destroy')

    expect(page).to have_content('O Guia')
    expect(page).to have_content('das galaxias')
    expect(page).to have_content('Douglas Adams')
  end

  it 'correct menu button for logged user' do
    item_selector = 'a.dropdown-item'

    FactoryBot.create(:book)

    user = FactoryBot.create(:user)
    login_as(user, scope: :user)

    visit root_path

    expect(page).to have_selector item_selector, text: 'Books'
    expect(page).to have_selector item_selector, text: 'Authors'
    expect(page).to have_selector item_selector, text: 'Sign out'
    expect(page).to have_selector item_selector, text: 'My Account'
    expect(page).to have_selector item_selector, text: 'New user'
    expect(page).not_to have_selector item_selector, text: 'Sign in'
  end

  it 'show correct menu button for anon user' do
    item_selector = 'a.dropdown-item'

    visit root_path

    expect(page).not_to have_selector item_selector, text: 'Books'
    expect(page).not_to have_selector item_selector, text: 'Authors'
    expect(page).not_to have_selector item_selector, text: 'Sign out'
    expect(page).not_to have_selector item_selector, text: 'My Account'
    expect(page).not_to have_selector item_selector, text: 'New user'
    expect(page).to have_selector item_selector, text: 'Sign in'
  end
end
