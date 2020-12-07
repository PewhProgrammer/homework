require 'net/http'
require 'json'

class RubyDownloader
    def initialize(p)
        @path = p
    end

    public
    def download_post(id)
        File.open(".#{@path}/post#{id}.txt", "w") {|f| f.write(post_string_by_id(id)) }
    end

    def show_post(id)
        puts post_string_by_id(id)
    end

    private
    def post_json_object(id)
        res = Net::HTTP.get('jsonplaceholder.typicode.com', "/posts/#{id}")
        JSON.parse(res)
    end

    def post_string_by_id(id)
        obj = post_json_object(id)
        "<#{obj["title"]}> \n\n<#{obj["body"]}>"
    end

end
 

ruby_downloader = RubyDownloader.new('/tmp')
ruby_downloader.download_post(7)
