require 'rails_helper'

describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it '全ての項目が入力されていれば出品ができる' do
        expect(@item).to be_valid
      end
    
    context '商品出品がうまくいかないとき' do
      it 'imageが空では登録されない' do
      
      end
    end

    end
  end
end