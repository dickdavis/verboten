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


require 'rake/testtask'
require 'rdoc/task'

Rake::TestTask.new do |t|
  t.libs << 'test'
end

RDoc::Task.new :rdoc do |rdoc|
  rdoc.main = 'README.md'
  rdoc.rdoc_files.include('README.md',
                          './lib/*.rb',
                          './lib/**/*.rb',
                          './test/**/*.rb')
  rdoc.title = 'verboten Documentation'
  rdoc.rdoc_dir = 'docs/'
  rdoc.options << '--all'
end
