helpers do

  def mine?(obj)
    if @user == obj.user
      return true
    else
      return false
    end
  end


end
