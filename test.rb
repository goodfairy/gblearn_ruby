puts File.join(Dir.pwd,'**','*')
puts 
#puts Dir[File.join(Dir.pwd,'**','*')]
puts Dir[File.join(Dir.pwd, '**', '*')].count { |file| File.extname(file) == ".rb" }

puts Dir[(File.join(Dir.pwd,'**','*.rb'))].size