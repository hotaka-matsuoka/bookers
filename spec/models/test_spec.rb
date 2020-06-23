require 'rails_helper'

RSpec.describe Book, type: :model do
  before do
    @book = build(:book)
  end
  describe 'create' do
    it 'ずべての登録情報があれば登録できる' do
      @book.valid?
      expect(@book).to be_valid
    end
    it 'titleがnilの場合は登録できない' do
      @book.title = ''
      @book.valid?
      expect(@book.errors[:title]).to include("can't be blank")
    end
    it 'bodyがnilの場合は登録できない' do
      @book.body = ''
      @book.valid?
      expect(@book.errors[:body]).to include("can't be blank")
    end
  end
  describe 'edit' do
    it 'ずべての登録情報があれば編集できる' do
      @book.update(title: "hoge", body: "hoge")
      @book.valid?
      expect(@book).to be_valid
    end
    it 'titleがnilの場合は編集できない' do
      @book.update(title: nil, body: "hoge")
      @book.valid?
      expect(@book.errors[:title]).to include("can't be blank")
    end
    it 'bodyがnilの場合は編集できない' do
      @book.update(title: "hoge", body: nil)
      @book.valid?
      expect(@book.errors[:body]).to include("can't be blank")
    end
  end
end
