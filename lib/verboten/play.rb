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

require 'net/https'
require 'uri'

module Verboten
  ##
  # = Play
  # Author::    Richard Davis
  # Copyright:: Copyright 2018 Mushaka Solutions
  # License::   GNU Public License 3
  #
  # Subroutine to add favorite songs to tswf queue.
  module Play
    ENDPOINT = 'https://hackerchan.org/api/submit?song='

    ##
    # Validates that the given url meets criteria
    def is_valid_url?(url)
      %r{https?:\/\/[\S]+[\.][\S]{2,}\/[\S]+} =~ url
    end

    ##
    # Queues a song up at tsfw
    def send_song_to_tswf(args)
      return 'Sorry, you entered an invalid URL. I cannot do anything with this.' unless is_valid_url?(args[0])

      if args[0].casecmp('despacito').zero?
        link = ENDPOINT+'https://invidio.us/watch?v=kJQP7kiw5Fk'
      else
        link = ENDPOINT + args[0]
      end

      uri = URI.parse(link)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      if response.code == '200'
        'Song successfully added to the queue.'
      else
        'The server did not accept this song; probably because it sucks.'
      end
    end
  end
end
