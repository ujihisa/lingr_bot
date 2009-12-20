class VimHacks
    def initialize(h={})
        raise ArgumentError, ":title is not string!" unless h[:title].kind_of?(String)
        raise ArgumentError, ":url is not string!" unless h[:url].kind_of?(String)
        @title = h[:title]
        @url = h[:url]
    end

    def self.search(s)
        raise ArgumentError, "s is not string or integer" unless s.kind_of?(String) || s.kind_of?(Integer)
        ary = []
        s = 'Hack #' + s + ':' if s.kind_of?(Integer) || /^\d+$/ =~ s
        url = 'http://vim-users.jp/?s='+CGI.escape(s.to_s)
        c = Curl::Easy.new(url)
        c.perform
        c.body_str.split(/\n/).each do |s|
            if /<h2><a href="(.*?)">(.*?)<\/a><\/h2>/ =~ s
                ary << self.new(:title => $2, :url => $1)
            end
        end
        return ary
    end

    def self.recent
        ary = []
        c = Curl::Easy.new(url)
        c.perform
        c.body_str.split(/\n/).each do |s|
            if /<li>[0-9]+\/[0-9]+\/[0-9]+: <a href="(.+)" title=".+">(Hack #[0-9]+: .+)<\/a><\/li>/ =~ s
                ary << self.new(:title => $2, :url => $1)
        end
        return ary
    end

    def to_s
        @title + "\n" + @url
    end

    attr_reader :title, :url
end
