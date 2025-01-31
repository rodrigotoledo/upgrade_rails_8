require "sidekiq/web"

# Configurar a senha para acessar o painel administrativo
Sidekiq::Web.use Rack::Auth::Basic do |username, password|
  username == "user" && password == "password"
end
