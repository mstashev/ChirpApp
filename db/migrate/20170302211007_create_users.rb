class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :api_token
      t.string :username_email
      t.string :avatar_url

      t.timestamps
    end
  end
end
