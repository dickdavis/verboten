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


require 'minitest/autorun'
require_relative '../lib/verboten/hello'

##
# = HelloTest
# Author::    Richard Davis
# Copyright:: Copyright 2018 Richard Davis
# License::   GNU Public License 3
#
# Contains tests for Hello class.
class HelloTest < Minitest::Test
  ##
  # Initializes test with sample data
  def setup
    @name = 'friend'
  end

  ##
  # Ensures the greeter is behaving as expected
  def test_hello
    assert_equal('Hello, friend.', Verboten::Hello.greeting(@name))
  end
end
