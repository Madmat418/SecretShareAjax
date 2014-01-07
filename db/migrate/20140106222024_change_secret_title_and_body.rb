class ChangeSecretTitleAndBody < ActiveRecord::Migration
  def change
    remove_column :secrets, :title
    add_column :secrets, :body, :text
  end
end
