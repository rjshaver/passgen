
# The wordlist is a modified version of the diceware list:
# http://world.std.com/~reinhold/diceware.wordlist.asc
# Commands for re-generating it are in the Makefile.
WORDLIST = "wordlist.txt"

puts "// *****************************************************************"
puts "// THIS FILE IS GENERATED BY generate_wordlist.rb. DO NOT MODIFY IT!"
puts "// *****************************************************************"
puts ""
puts "#ifndef WORDLIST_H"
puts "#define WORDLIST_H"
puts ""

File.open(WORDLIST, 'r') do |wl|
  lines = wl.readlines
  puts "#define WORDLIST_WORD_COUNT #{lines.count}"
  puts ""
  puts "const char * const words[] = {"
  lines.each do |line|
    print '"' + line.strip + '"'
    puts ","
  end
  puts "};"
end

puts ""
puts "#endif"
