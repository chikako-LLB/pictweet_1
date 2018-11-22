# specファイルが複数ある場合は特定のファイルを選択して実行することも可能。
# $ bundle exec rspec spec/controllers/tweets_controller_spec.rb ターミナルでコマンド。

require 'rails_helper'

# 「newアクションが動いたあとnew.html.erbに遷移するか」のテスト
# httpメソッド名を大文字で書き加える。
# 擬似的にnewアクションを動かすリクエストを行うコードを書く
# new.html.erbに遷移することを確かめるコードを書く
# コントローラーのアクションをシンボル型で渡します。必要なパラメーターが存在する場合は、各パラメーターをハッシュ形式で渡します。
# newアクションをリクエストするには引数は必要ないため、記述はget :newのみ
# example内でリクエストが行われた後の遷移先のビューの情報を持つインスタンスです。引数にシンボル型でアクション名を取ります。引数で指定したアクションがリクエストされた時に自動的に遷移するビューを返します。
describe TweetsController, type: :controller do
  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end
end

# アクション内で定義されているインスタンス変数の値が期待したものになるか」のテスト
# factory_girlを使ってこのexampleの中でtweetsテーブルにレコードを保存します。tweetをデータベースに保存したいので、createメソッドを利用する。
# idというキーのバリューに先ほど作成したインスタンスのidをセットすることができます。
# editアクションで取得しているインスタンス変数が、上記で作成した変数tweetと一致するかを確かめるため、expectメソッドの引数にassignsというメソッドを利用してエクスペクテーションを書きます。
describe 'GET #edit' do
  it "assigns the requested tweet to @tweet" do
    tweet = create(:tweet)
    get :edit, id: tweet
    expect(assigns(:tweet)).to eq tweet
  end
    it "renders the :edit template" do
      get :edit, id: tweet
      expect(response).to render_template :edit
    end

# indexアクションのテスト
# factory_girlのcreate_listメソッドを利用して、tweetsテーブルに複数のレコードを作成することからはじめます。第一引数に作成したいリソースをシンボル型で、第二引数に作成したい個数を数字で渡します。
# 期待される値が配列の場合は、matchを利用してindexアクションで定義されているインスタンス変数@tweetsの値を確かめる。
# sortメソッドを利用して、example内で定義しているtweetsの中身の順番を、created_atを基準に降順で並び替える。
describe 'GET #index' do
    it "populates an array of tweets ordered by created_at DESC" do
      tweets = create_list(:tweet, 3)
      get :index
      expect(assigns(:tweets)).to match(tweets.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
