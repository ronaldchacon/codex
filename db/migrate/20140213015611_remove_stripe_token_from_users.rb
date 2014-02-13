class RemoveStripeTokenFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :stripe_token
  end

  def down
    add_column :users, :stripe_token, :string
  end
end
