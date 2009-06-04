%w(rubygems sinatra activerecord yaml erb lib/enhance_base_convert lib/models).each do |lib|
  require lib
end

get '/:id' do |id|
  if id.to_i == id.to_i(64)
    redirect "http://tatsuj.in/"
  end
  str = id.to_i(64).to_s
  case str[-1].chr
  when "1", "2" # Entry
    entry = Entry.find_by_id str[0..-2]
    if entry && entry.person
      redirect "http://tatsuj.in/people/#{entry.person.id}-#{entry.person.name}/entries/#{entry.id}"
    end
  end
  redirect "http://tatsuj.in/"
end
