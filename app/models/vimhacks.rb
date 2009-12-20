class VimHacks
    def search(s)
        ret = ''
        s = 'Hack #' + s + ':' if /^\d+$/ =~ s
        url = 'http://vim-users.jp/?s='+CGI.escape(s.to_s)
        c = Curl::Easy.new(url)
        c.perform
        c.body_str.split(/\n/).each do |s|
            if /<h2><a href="(.*?)">(.*?)<\/a><\/h2>/ =~ s
                ret = ret + $2 + "\n" + $1 + "\n"
            end
        end
        return ret
    end
end
