# frozen_string_literal: true

# Copyright 2018 Richard Davis
#
# This file is part of verboten.
#
# verboten is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# verboten is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with verboten.  If not, see <http://www.gnu.org/licenses/>.

##
# = /lib/verboten/base.rb
# Author::    Richard Davis
# Copyright:: Copyright 2018 Richard Davis
# License::   GNU Public License 3
#
# Main application file that loads other files.

require 'verboten/verboten_controller'
require 'verboten/config'

require 'optparse'
require 'English'

trap('INT') do
  puts "\nTerminating..."
  exit
end

options = {}

optparse = OptionParser.new do |opts|
  opts.banner = 'Usage: verboten [options]'

  opts.on('-r', '--run', 'Runs the bot using options in the config file.') do
    options[:run] = true
  end

  opts.on('-i', '--interactive', 'Runs the bot using input provided by user.') do
    options[:interactive] = true
  end

  opts.on('-l', '--license', 'Displays the copyright notice') do
    puts "This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
"
  end

  opts.on('-w', '--warranty', 'Displays the warranty statement') do
    puts "This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
"
  end

  opts.on_tail('-h', '--help', 'Displays the help screen') do
    puts opts
    exit
  end
end

begin
  optparse.parse!
rescue OptionParser::InvalidOption, OptionParser::MissingArgument
  puts $ERROR_INFO.to_s
  puts 'Use -h or --help for options.'
  exit 1
end

if options[:run]
  if File.exists?(Verboten::Config::CONFIG_DIR+Verboten::Config::CONFIG_FILE)
    config = Verboten::Config.read_from_file
  else
    config = Verboten::Config.interactive
    puts 'Save configuration? (y/n) => '
    choice = STDIN.gets.chomp.upcase
    if choice == 'Y'
      Dir.mkdir(Verboten::Config::CONFIG_DIR) unless Dir.exist?(Verboten::Config::CONFIG_DIR)
      Verboten::Config.write_to_file(config)
    end
  end
  bot = Verboten::VerbotenController.new(config)
  trap("INT") { bot.close_connection }
  bot.handle_connection
end

if options[:interactive]
  config = Verboten::Config.interactive
  puts 'Save configuration? (y/n) => '
  choice = STDIN.gets.chomp.upcase
  if choice == 'Y'
    Dir.mkdir(Verboten::Config::CONFIG_DIR) unless Dir.exist?(Verboten::Config::CONFIG_DIR)
    Verboten::Config.write_to_file(config)
  end
  bot = Verboten::VerbotenController.new(config)
  trap("INT") { bot.close_connection }
  bot.handle_connection
end
