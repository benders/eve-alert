class User < TwitterAuth::GenericUser
  # Extend and define your user model as you see fit.
  # All of the authentication logic is handled by the 
  # parent TwitterAuth::GenericUser class.
  has_many :accounts
  
  def refresh
    self.accounts.each do |a|
      a.refresh
    end
  end
end
