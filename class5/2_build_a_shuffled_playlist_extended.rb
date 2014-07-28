#!/usr/bin/env ruby
#
# 4 points
#
# Extend the playlist program with some user-friendly features.
#
# 1. Allow a user to specify the name of the playlist file as a command line
# argument. The program should accept file names with and without a .m3u
# extension. For example:
#
#   $ ruby 2_build_a_shuffled_playlist_extended.rb salsa
#   => Build a shuffled playlist
#   => Created salsa.m3u with 16 songs
#
# If no name is given, the program should output a helpful usage message and
# immediately exit. For example:
#
#   $ ruby 2_build_a_shuffled_playlist_extended.rb
#   Usage: 2_build_a_shuffled_playlist_extended.rb PLAYLIST
#
# 2. If the playlist file already exists, the program should ask the user to
# either cancel the operation, overwrite the file with new content, or append
# new content to the end of the file. For example
#
#   $ ruby 2_build_a_shuffled_playlist_extended.rb salsa.m3u
#   => Build a shuffled playlist
#   => WARNING: salsa.m3u already exists
#   => (c)ancel, (o)verwrite, or (a)ppend > c
#   => Canceled
#
#   $ ruby 2_build_a_shuffled_playlist_extended.rb salsa.m3u
#   => Build a shuffled playlist
#   => WARNING: salsa.m3u already exists
#   => (c)ancel, (o)verwrite, or (a)ppend > o
#   => Overwrote salsa.m3u with 16 songs
#
#   $ ruby 2_build_a_shuffled_playlist_extended.rb salsa.m3u
#   => Build a shuffled playlist
#   => WARNING: salsa.m3u already exists
#   => (c)ancel, (o)verwrite, or (a)ppend > a
#   => Appended salsa.m3u with 16 songs
#
# A few methods you might find useful are:
#
#   String#end_with?(suffix) → true or false
#
#     Returns true if the string ends with the given suffix, otherwise false.
#
#     "code.rb".end_with?(".rb")   #=> true
#
#   File.exists?(file_name) → true or false
#
#     Return true if the named file exists, otherwise false.
#
#   File.open(file_name, mode) { |file|  }
#
#     Opens file_name with a "mode" and then passes the opened file to a block.
#     Possible modes include:
#
#     "w"   Truncates an existing file to zero length or creates a new file for
#           writing.
#
#     "a"   Starts at end of a file, if it exists, otherwise creates a new file
#           for writing.

abort "Usage 2_build_a_shuffled_playlist_extended.rb PLAYLIST" unless ARGV.first

def build_playlist(file_name, mode, action)
  songs = Dir["songs/*.{mp3,m4a}"].shuffle

  File.open(file_name, mode) { |f| f.write songs.join("\n") + "\n" }

  "=> #{action} #{file_name} with #{songs.size} songs"
end

puts "=> Build a shuffled playlist"

file_name = ARGV.first
file_name += ".m3u" unless file_name.end_with?(".m3u")

unless File.exists?(file_name)
  puts build_playlist(file_name, "w", "Created")
  exit
end

puts "=> WARNING: #{file_name} already exists"

loop do
  print "=> (c)ancel, (o)verwrite, or (a)ppend > "
  input = $stdin.gets.chomp

  abort "=> Canceled" if input == "c"

  if input == "o"
    puts build_playlist(file_name, "w", "Overwrote")
    exit
  elsif input == "a"
    puts build_playlist(file_name, "a", "Appended")
    exit
  else
    puts "=> Invalid choice '#{input}'"
  end
end
