get '/vimhacks' do
  "hi I'm a bot"
end

post '/vimhacks' do
  re = []
  v = VimHacks.new
  JSON.parse(params[:json])["events"].select {|e| e['message'] }.each do |e|
    case e['message']['text']
    when /^:vimh(acks)?\s+(\S.*)$/
      v.search($2).map(&:to_s).each do |h|
        re << h
      end
    when /^:vimh(acks)?$/
      v.recent[0..8].map(&:to_s).each do |h|
        re << h
      end
    end
  end
  re.join "\n"
end
