require "rails_helper"

RSpec.describe BooksController do
  describe 'GET #index' do
    it 'リクエストは200 OKとなること'  do
      expect(response.status).to eq 200
    end
    it "indexテンプレートの表示" do
      get :index
      expect(response).to render_template("index")
    end
  end
  describe 'GET #show' do
    let(:book) {create(:book)}
    before { get :show, params: { id: book.id }}
    it 'リクエストは200 OKとなること' do
      expect(response.status).to eq 200
    end
    it '@bookに割り当てること' do
      expect(assigns(:book)).to eq book
    end
    it 'showテンプレートの表示' do
    expect(response).to render_template("show")
    end
  end
  describe 'GET #edit' do
    let(:book) {create(:book)}
    before { get :show, params: { id: book.id }}
    it 'リクエストは200 OKとなること' do
      expect(response.status).to eq 200
    end
    it '@bookに割り当てること' do
      expect(assigns(:book)).to eq book
    end
    it 'editテンプレートの表示' do
      expect(response).to render_template("books/show")
      end
  end
  describe 'POST #create' do
    let(:article_attributes) { attributes_for(:book) }
    it 'bookの作成' do
      expect do
        post :create, params: { book: article_attributes }, session: {}
      end.to change(Book, :count).by(1)
    end
  end
  describe 'PATCH #update' do
    let!(:book) { create(:book) }
    let(:update_attributes) do
      { title: 'update title', body: 'update body' }
    end
    it 'bookの更新' do
      expect do
        patch :update, params: { id: book.id, book: update_attributes }, session: {}
      end.to change(Book, :count).by(0)
    end
    it '更新済みのbookの更新' do
      patch :update, params: { id: book.id, book: update_attributes }, session: {}
      book.reload
      expect(book.title).to eq update_attributes[:title]
      expect(book.body).to eq update_attributes[:body]
    end
  end
  describe 'DELETE #destroy' do
    let!(:book) { create(:book) }
    it 'bookの削除' do
      expect do
        delete :destroy, params: { id: book.id }, session: {}
      end.to change(Book, :count).by(-1)
    end
  end
end