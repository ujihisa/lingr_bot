get '/vimhacks' do
    'hi I\'m a bot'
end

post '/vimhacks' do
    re = ''
    json = JSON.parse(params[:json])
    v = VimHacks.new
    json["events"].each do |e|
        if e['message']
            # m = e['message']['text'].force_encoding(Encoding::ASCII_8BIT)
            m = e['message']['text']
            if /^:vimhacks\s+(\S.*)$/ =~ m
                re = v.search($1)
            end
        end
    end
    re
end
