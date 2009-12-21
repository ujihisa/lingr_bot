get '/vimhacks' do
  "hi I'm a bot"
end

post '/vimhacks' do
  v = VimHacks.new
  JSON.parse(params[:json])["events"].select {|e| e['message'] }.inject([]) {|re, e|
    re + case e['message']['text']
      when /^:vimh(acks)?\s+(\S.*)$/
        v.search($2).map(&:to_s)
      when /^:vimh(acks)?$/
        v.recent[0..8].map(&:to_s)
      end
  }.join "\n"
end
