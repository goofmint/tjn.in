require 'lib/rewindable_input'
use Tatsujin::RewindableInput
use Rack::CommonLogger
require 'app'
run Sinatra::Application
