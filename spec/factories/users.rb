FactoryGirl.define do

  factory :user do
    nickname              "abe"
    email                 "kkk@gmail.com"
    password              "00000000"
    password_confirmation "00000000"
  end
#factory_girlを利用しない場合
# user = User.new(nickname: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
#factory_girlを利用する場合
# user = FactoryGirl.build(:user)
#createしたインスタンスはDBに保存される
# user = FactoryGirl.create(:user)
end
