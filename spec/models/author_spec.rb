# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Author, type: :model do
  let(:author_response) { { name: "Douglas Adams" } }

  it 'has a valid factory' do
	  author = Author.new(author_response)

    expect(author.save).to be(true)
  end

  it 'has validate to fields' do
    author = Author.new

    expect(author.save).to be(false)
  end

  it 'delete author' do
    author = Author.new(author_response)
    author.save
    author.destroy

    expect(author.destroyed?).to be(true)
  end
end
