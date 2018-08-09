class CreateTargetTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :target_tweets do |t|
      t.integer :tweet_id, null: false, default: 0, limit: 8, unsigned: true, unique: true
      t.references :data_clean_task, foreign_key: true
      t.integer :decision, null: true, default: nil

      t.timestamps
    end
  end
end
