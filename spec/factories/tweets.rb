# factory_girlを利用してtweetを作成できるようにする
# indexアクションで定義されているインスタンス変数@tweetsは、created_atで降順にソートしているので、これを再現するためにfakerを利用する。（二日前から現在までの間でランダムに時間を生成する。）
FactoryGirl.define do
  factory :tweet do
    text "hello!"
    image "hoge.png"
    user_id 1
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end
end
