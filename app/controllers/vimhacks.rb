get '/vimhacks' do
  "hi I'm a bot"
end

post '/vimhacks' do
  re = ''
  json = JSON.parse(params[:json])
  v = VimHacks.new
  json["events"].each do |e|
    next unless e['message']
    m = e['message']['text']
    if /^:vimh(acks)?\s+(\S.*)$/ =~ m
      v.search($1).map{ |x| x.to_s }.each do |h|
        re += h + "\n"
      end
    elsif /^:vimh(acks)?$/ =~ m
      v.recent[0..8].map{ |x| x.to_s }.each do |h|
        re += h + "\n"
      end
    end
  end
  re
end
