require 'rails_helper'

feature 'tweet', type: :feature do
 let(:user) { create(:user) }

  scenario 'post tweet' do
  # ログイン前には投稿ボタンがないことの確認
    # ルートにアクセスして期待するHTML要素が描画されているかどうか確かめる。
    # have_no_contentで投稿ボタンが存在しないことを確かめる。
    visit root_path
    expect(page).to have_no_content('投稿する')
  # ログイン処理
    # ログインページのプレフィックスでアクセス
    # fill_inメソッドを使って、idがuser_emailのフォームには、let(:user)で作成したuserのemail、idがuser_passwordのフォームにはuserのpasswordをそれぞれ入力しています。
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    # find('input[name="commit"]').clickでログインボタンをクリックしています。
    find('input[name="commit"]').click
    # expect(current_path).to eq root_pathで、ルートに移動したことを確かめる。
    expect(current_path).to eq root_path
    # expect(page).to have_content('投稿する')で、ログイン状態では投稿ボタンが表示されることを確かめる。
    expect(page).to have_content('投稿する')
  # ツイートの投稿
    expect {
      click_link('投稿する')
      expect(current_path).to eq new_tweet_path
      fill_in 'image', with: 'https://s.eximg.jp/expub/feed/Papimami/2016/Papimami_83279/Papimami_83279_1.png'
      fill_in 'text', with: 'フィーチャスペックのテスト'
      find('input[type="submit"]').click
    }.to change(Tweet, :count).by(1)
  end
end
