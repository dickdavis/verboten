require 'json'

module Verboten
  module Config
    CONFIG_DIR = ENV['HOME']+'/.verboten/'
    CONFIG_FILE = 'config.json'

    ##
    # Prompts user for configuration and returns as hash
    def self.interactive
      puts 'Server =>'
      server = STDIN.gets.chomp

      puts 'Port => '
      port = STDIN.gets.chomp

      puts 'Nick => '
      nick = STDIN.gets.chomp

      puts 'Ident => '
      ident = STDIN.gets.chomp

      puts 'Gecos => '
      gecos = STDIN.gets.chomp

      puts 'Channel => '
      chan = STDIN.gets.chomp

      {
        server: server,
        port: port,
        nick: nick,
        ident: ident,
        gecos: gecos,
        chan: chan
      }
    end

    ##
    # Writes given configuration to JSON file
    #
    def self.write_to_file(config)
      # TODO add error handling
      f = File.open(CONFIG_DIR+CONFIG_FILE, 'w+')
      f.write(JSON.pretty_generate(config))
      f.close
    end

    ##
    # Parses configuration as hash from JSON file
    #
    def self.read_from_file
      # TODO add error handling
      f = File.read(CONFIG_DIR+CONFIG_FILE)
      JSON.parse f
    end
  end
end
