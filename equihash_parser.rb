filename = ARGV.first

content = File.read(filename)

puts content

puts "hash length = #{(content.length/2.0).to_s} bytes." 

trans={}

trans["version"]    = content[0..7]
trans["prevhash"]   = content[8..71]
trans["merkleroot"] = content[72..135]
trans["reserved"]   = content[136..199]
trans["time"]       = content[200..207]
trans["bits"]       = content[208..215]
trans["nonce"]      = content[216..279]

solution_pre = content[280..285]
solution = content[286..286+2690-1]

trans.each do |k,v|
  puts "%-12s : %s" % [k, v]
end
puts "%-12s : %s" % ["sol_preamble", solution_pre]
puts "%-12s : %s" % ["solution", solution]


