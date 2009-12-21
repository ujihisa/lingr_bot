get '/vimhacks' do
  "hi I'm a bot"
end

post '/vimhacks' do
  v = VimHacks.new
  JSON.parse(params[:json])["events"].select {|e| e['message'] }.inject([]) {|re, e|
    case e['message']['text']
    when /^:vimh(acks)?\s+(\S.*)$/
      re += v.search($2).map(&:to_s)
    when /^:vimh(acks)?$/
      re += v.recent[0..8].map(&:to_s)
    end
    re
  }.join "\n"
end
