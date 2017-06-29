set(:method) do |method|
  method = method.to_s.upcase
  condition { request.request_method == method }
end

before :method => :get do
  find_user
end

get '/' do
  redirect '/questions/all'
end
