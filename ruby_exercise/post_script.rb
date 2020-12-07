#!/usr/bin/env ruby

require 'net/http'
require 'json'

def download_post(id, path)
    File.open("#{path}/post#{id}.txt", "w") {|f| f.write(post_string_by_id(id)) }
end

def show_post(id)
    puts post_string_by_id(id)
end

def post_json_object(id)
    res = Net::HTTP.get('jsonplaceholder.typicode.com', "/posts/#{id}")
    JSON.parse(res)
end

def post_string_by_id(id)
    obj = post_json_object(id)
    "<#{obj["title"]}> \n\n<#{obj["body"]}>"
end


begin
    cmd = String(ARGV[0])
    id = Integer(ARGV[1])
  rescue => err
    puts "Verify your arguments: ./post_script.rb (show|download) <post_id>"
    exit
end

case cmd
when "show"
    show_post(id)
when "download"
    begin
        path = String(ARGV[2])
      rescue => err
        puts "You forgot the relative download path."
        exit
    end

    unless path.to_s.strip.empty?
        download_post(id, path)
        exit
    end
    puts "You forgot the relative download path. Exmpl: tmp"
else
    "You gave me #{x} -- I have no idea what to do with that."
end
