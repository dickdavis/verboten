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

require 'nokogiri'
require 'open-uri'
require 'socket'

module Verboten
  ##
  # = FindBook
  # Author::    Richard Davis
  # Copyright:: Copyright 2018 Mushaka Solutions
  # License::   GNU Public License 3
  #
  # Subroutine to find books on a given page.
  module FindBook
    LIBRARY = 'http://im.triggered.help/'
    PASTEBIN = 'dailyprog.org'
    PASTEBIN_PORT = 6969

    def search_for_books(args, file_type='pdf')
      if args[0].slice(0, 2) == '--' && args[0].slice(2..9).casecmp('filetype').zero?
        file_type = args[0].slice(11..-1)
        term = args[1]
      else
        term = args[0]
      end

      return ['No search term given. 😕'] if term.nil?

      page = Nokogiri::HTML(open(LIBRARY+'humble/'))
      links = page.css('a')
      filtered_links = []

      links.each do |link|
        next unless link['href'].end_with?(file_type)
        filtered_links.push("#{LIBRARY}#{link['href'].slice(1..-1)}") if link['href'].downcase.include?(term.downcase)
      end

      if filtered_links.count > 4
        socket = TCPSocket.open(PASTEBIN, PASTEBIN_PORT)
        socket.puts filtered_links
        link = 'More books at: ' + socket.gets
        filtered_links = filtered_links.take(4).push(link)
      end

      filtered_links
    end
  end
end

