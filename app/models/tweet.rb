class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :comments
end

  # def change
  #       create_table :tweets do |t|
  #         t.string      :name
  #         t.text        :text
  #         t.text        :image
  #       end
  # end
