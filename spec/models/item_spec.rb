require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: @user.id)
  end

  describe '商品出品機能' do
    context '商品出品ができる場合' do
      it '全ての値が存在すれば作成できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品ができない場合' do
      it '商品名が空では登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品の説明が空では登録できない' do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'カテゴリーが未選択では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを入力してください')
      end
      it '商品の状態が未選択では登録できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を入力してください')
      end
      it '配送料の負担が未選択では登録できない' do
        @item.freight_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を入力してください')
      end
      it '配送元が未選択では登録できない' do
        @item.shipping_prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を入力してください')
      end
      it '配送日が未選択では登録できない' do
        @item.ship_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を入力してください')
      end
      it '販売価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it '販売価格が全角では登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end
      it '販売価格が300以下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は範囲を超えています')
      end
      it '販売価格が9999999以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は範囲を超えています')
      end
      it '画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it 'user_idが空だと投稿できない' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("ユーザーを入力してください")
      end
    end
  end
end
