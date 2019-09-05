json.user do 
  json.set! @user.id do
    json.extract! @user
  end
end