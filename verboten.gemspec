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


lib = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name          = 'verboten'
  s.version       = '0.2.0'
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Richard Davis']
  s.email         = 'rvdavis@member.fsf.org'
  s.homepage      = 'https://github.com/d3d1rty/verboten'
  s.summary       = 'IRC bot written in Ruby.'
  s.description   = <<~HEREDOC
    This is an IRC bot written in Ruby that performs various functions.
  HEREDOC
  s.license       = 'GPL-3.0'
  s.files         = Dir['lib/**/*']

  s.executables   = ['verboten']

  s.test_files    = Dir['test/**/*']
  s.require_path  = ['lib']
  s.add_runtime_dependency 'vbot', '~> 0.2.1'
  s.add_runtime_dependency 'nokogiri', '~> 1.6', '>= 1.6.8'
end
