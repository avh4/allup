require 'httparty'

CONTROL = 'http://localhost:9999'

Before do
  HTTParty.delete("#{CONTROL}")
end

Given(/^GET "http:\/\/localhost:([0-9]*)\/(.*?)" responds:$/) do |port, path, string|
  response = HTTParty.post("#{CONTROL}/http/#{port}/get/#{path}", body: string)
  response.code.should == 200
end

Given(/^GET "http:\/\/localhost:([0-9]*).*?" does not connect$/) do |port|
  HTTParty.delete("#{CONTROL}/http/#{port}")
end
