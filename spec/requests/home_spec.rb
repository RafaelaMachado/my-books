# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :request do
  describe "GET #index" do
    it 'displays books listing' do
      FactoryBot.create(:book)

      get root_path

      expect(response).to be_successful
      expect(response.body).to include('O Guia')
    end
  end
end