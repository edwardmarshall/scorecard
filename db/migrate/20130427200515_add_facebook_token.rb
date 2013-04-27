class AddFacebookToken < ActiveRecord::Migration
  def change
    add_column :users, :facebook_token, :string
    add_column :users, :facebook_token_expiration, :datetime
  end
end
