class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.password_digest :password
      t.string :email
      t.text :bio
    end
  end
end
