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

require 'vbot'

module Verboten
  ##
  # = VerbotenController
  # Author::    Richard Davis
  # Copyright:: Copyright 2018 Mushaka Solutions
  # License::   GNU Public License 3
  #
  # Maps command subroutines to message logic.
  class VerbotenController < Vbot::BotController
    ##
    # Executes command subroutines.
    def exec_command_subroutine(command_hash)
      rt = command_hash[:reply_to]
      pm = command_hash[:pm]
      cmd = command_hash[:command]
      #arguments = command_hash[:arguments]

      if cmd.upcase == 'HELLO' && pm == true
        "PRIVMSG #{rt} :Hello, #{rt}.\r\n"
      elsif cmd.upcase == 'HELLO' && pm == false
        "PRIVMSG #{@chan} :hello, #{rt}.\r\n"
      end
    end
  end
end
