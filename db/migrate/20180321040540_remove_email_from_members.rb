class RemoveEmailFromMembers < ActiveRecord::Migration[5.1]
  def change
    remove_column :members, :email, :string
    remove_column :members, :encrypted_password, :string
    remove_column :members, :reset_password_token, :string
    remove_column :members, :reset_password_sent_at, :datetime
    remove_column :members, :remember_created_at, :datetime
    remove_column :members, :sign_in_count, :integer
    remove_column :members, :current_sign_in_at, :datetime
    remove_column :members, :last_sign_in_at, :datetime
    remove_column :members, :current_sign_in_ip, :inet
    remove_column :members, :last_sign_in_ip, :inet
    remove_column :members, :role, :integer
  end
end
