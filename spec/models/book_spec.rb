# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:author_response) { { name: 'Douglas Adams' } }
  let(:book_response) do
    {
      title: 'O Guida dos Mochileiros das Galaxias',
      description: 'Arthur Dent é um homem normal Lorem ipsum dolor sit amet',
      image: 'link'
    }
  end

  it 'has a valid factory' do
    book = Book.new(book_response)

    author = Author.new(author_response)
    book.author = author

    expect(book.save).to be(true)
  end

  it 'has validate to fields' do
    book = Book.new

    expect(book.save).to be(false)
  end

  it 'delete book' do
    book = Book.new(book_response)
    book.save
    book.destroy

    expect(book.destroyed?).to be(true)
  end
end
