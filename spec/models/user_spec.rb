# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user_response) { { email: Faker::Internet.email, password: 'password' } }

  it 'has a valid factory' do
    user = User.new(user_response)
    expect(user.save).to be(true)
  end

  it 'delete user' do
    user = User.new(user_response)
    user.save
    user.destroy
    expect(user.destroyed?).to be(true)
  end
end
