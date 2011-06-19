class AddBetaCodeIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :beta_code, :string
    code = BetaCode.where(:code => "FirstUsers").first
    BetaCode.create!(:code => "FirstUsers") unless code
    User.all.each do |user|
      user.update_attributes!(:beta_code => "FirstUsers")
    end
  end

  def self.down
    remove_column :users, :beta_code
  end
end
