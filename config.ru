require 'start'
use Rack::ShowExceptions
use Rack::CommonLogger

run Sinatra::Application
