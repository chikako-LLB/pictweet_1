class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string   "name"
      t.text     "image"
      t.text     "text"
      t.datetime "created_at"
      t.datetime "updated_at"

    end
  end
end
