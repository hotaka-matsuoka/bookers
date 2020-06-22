require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'create' do
    it 'ずべての登録情報があれば登録できる' do
      book = Book.create(title: "test", body: "test")
      book.valid?
      expect(book).to be_valid
    end
    it 'titleがnilの場合は登録できない' do
      book = Book.create(title: nil, body: "test")
      book.valid?
      expect(book.errors[:title]).to include("can't be blank")
    end
    it 'bodyがnilの場合は登録できない' do
      book = Book.create(body: "test", body: nil)
      book.valid?
      expect(book.errors[:body]).to include("can't be blank")
    end
  end
  describe 'edit' do
    it 'ずべての登録情報があれば登録できる' do
      book = Book.create(title: "test", body: "test")
      book.update(title: "hoge", body: "hoge")
      book.valid?
      expect(book).to be_valid
    end
    it 'titleがnilの場合は登録できない' do
      book = Book.create(title: "test", body: "test")
      book.update(title: nil, body: "hoge")
      book.valid?
      expect(book.errors[:title]).to include("can't be blank")
    end
    it 'bodyがnilの場合は登録できない' do
      book = Book.create(title: "test", body: "test")
      book.update(title: "hoge", body: nil)
      book.valid?
      expect(book.errors[:body]).to include("can't be blank")
    end
  end
end
