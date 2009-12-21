get '/vimhacks' do
  "hi I'm a bot"
end

post '/vimhacks' do
  v = VimHacks.new
  JSON.parse(params[:json])["events"].select {|e| e['message'] }.map {|e|
    case e['message']['text']
    when /^:vimh(acks)?\s+(\S.*)$/
      v.search($2)
    when /^:vimh(acks)?$/
      v.recent.take(9)
    end.map(&:to_s)
  }.flatten.compact.join("\n")
end
