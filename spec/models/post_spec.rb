require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '投稿機能' do
    context '投稿ができる場合' do
      it 'imageとtitle、category_id、textが存在すると投稿できる' do
        expect(@post).to be_valid
      end
    end

    context '投稿ができない場合' do
      it 'category_idが未選択では出品できない' do
        @post.category_id = '1'
        @post.valid?
        expect(@post.errors.full_messages).to include("Category can't be blank")
      end
      it 'titleが空では出品できない' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end
      it 'imageが空では出品できない' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Image can't be blank")
      end
      it 'textが空では出品できない' do
        @post.text = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Text can't be blank")
      end
      it 'userが紐付いていないと出品できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("User must exist")
      end
    end
  end
end
