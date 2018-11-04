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

    def search_for_books(term)
      page = Nokogiri::HTML(open(LIBRARY+'humble/'))
      links = page.css('a')
      filtered_links = []

      links.each do |link|
        next unless link['href'].end_with?('.pdf')
        filtered_links.push("#{LIBRARY}#{link['href'].slice(1..-1)}") if link['href'].downcase.include?(term)
      end

      filtered_links[0..4].join(' | ')
    end
  end
end

