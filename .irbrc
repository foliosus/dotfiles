require 'rubygems'
# require 'utility_belt'
# require 'wirble'
# Wirble.init
# Wirble.colorize
# UtilityBelt::Themes.background(:dark)

class Object
  def app_request(options = {})
    method = options.delete(:method) || :get
    options.reverse_merge! :only_path => true
    ENV['REQUEST_URI'] = app.url_for(options)
    ENV['REQUEST_METHOD'] = method.to_s
    Dispatcher.dispatch
  end
end

if ENV['RAILS_ENV']
  load File.dirname(__FILE__) + '/.railsrc'
else
  IRB.conf[:PROMPT_MODE] = :SIMPLE
end
