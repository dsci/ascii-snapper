require File.join(File.dirname(__FILE__), "app")
require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'ascii-snapper.rb')

#use Rack::Linkify, :twitter => true
use AsciiSnapper::Middleware

run App.new