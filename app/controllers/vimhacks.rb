get '/vimhacks' do
  "hi I'm a bot"
end

post '/vimhacks' do
  re = ''
  v = VimHacks.new
  JSON.parse(params[:json])["events"].each do |e|
    next unless e['message']
    m = e['message']['text']
    case m
    when /^:vimh(acks)?\s+(\S.*)$/
      v.search($1).map(&:to_s).each do |h|
        re += h + "\n"
      end
    when /^:vimh(acks)?$/
      v.recent[0..8].map(&:to_s).each do |h|
        re += h + "\n"
      end
    end
  end
  re
end
