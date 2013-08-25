class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, uniqueness: true
      t.string :email, :null => true
      t.string :password_digest, :null => false

      t.timestamps
    end
  end
end
