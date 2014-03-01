require 'aruba/cucumber'

allup_dir = File.expand_path('../../../', __FILE__)

raise 'allup build failed' unless system('GOPATH=`pwd` go build -o allup main')


require 'httparty'

def is_netlocal_running
  begin
    HTTParty.get("http://localhost:9999")
    return true
  rescue Errno::ECONNREFUSED
    return false
  end
end

if !is_netlocal_running
  puts "Netlocal is not running.  Please start it on localhost:9999"
  print "Waiting for you to start netlocal..."
  while !is_netlocal_running
    sleep 1
    print "."
  end
  puts
end



Before do
  set_env 'PATH', "#{allup_dir}:#{ENV['PATH']}"
end