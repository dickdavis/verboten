# verboten
This is an IRC bot written in Ruby that performs various functions.

## Table of Contents
* About
* License
* Getting started
    * Installation
    * Usage
* Contributing
    * Code Style
    * Documentation
    * Testing
* TODO
* Changelog

## About
This is an IRC bot written in Ruby that performs various functions.

## License
See `LICENSE` in the project root directory for license information.

## Getting Started
### Installation
To install, execute the following commands:
```
git clone git@github.com:d3d1rty/verboten.git
cd verboten
gem build verboten.gemspec
gem install verboten-0.2.0.gem
```

### Usage
Execute command `verboten -i` to initialize a config file with information that you provide.

Execute command `verboten -r` to run the bot using the config file that you generated.

The bot responds to either `verboten` or `<>`.

The bot currently know the following commands:
```
##
# Simple test method to see that the bot is working.
verboten howdy

##
# Finds books of an optionally provided filetype for a given search term.
# verboten find-books [--filetype=(pdf|epub|mobi)] [search term]
verboten find-books --filetype=epub java


##
# Adds a song to the channel queue.
# Example: verboten play [URL of song to play]
verboten play https://invidio.us/watch?v=XIkPyUecsnI
```

## Setting Up Systemd Control
In order to set up the bot to execute as a service, you'll need to create a wrapper and gemset. After you have installed the `verboten` gem and created a config file,
execute the following commands to generate a wrapper and gemset, replacing the ruby version with whatever ruby version you installed the gem under.
```
rvm alias create verboten ruby-2.5.1@verboten
rvm ruby-2.5.1 do rvm gemset create verboten
rvm wrapper verboten --no-links verboten
```

Create a `.service` file (example: `verboten.service`) in the /etc/systemd/system directory. Modify the below service file to fit your needs.
Important: replace the `/home/d3d1rty/.rvm` substring of the `ExecStart` directive with the output of `echo $rvm_path`; also, replace the value of
the `User` directive with your username on the server as well as whatever you would like to use as the `Description` directive.
```
[Unit]
Description="verboten IRC bot on #dailyprog Rizon"

[Service]
User=d3d1rty
ExecStart=/home/d3d1rty/.rvm/wrappers/verboten/verboten -r
Type=simple

[Install]
WantedBy=multi-user.target
```

## Contributing
### Code Style
To keep a consistent code style, it is recommended to use
[rubocop](https://github.com/bbatsov/rubocop). If you use `vim` and
[syntastic](https://github.com/vim-syntastic/syntastic), you
can use `rubocop` as a Ruby checker. To manually run `rubocop`, you
can run the following commands:

```
# Run rubocop for the entire project
bundle exec rubocop
# Run rubocop for a specific file
bundle exec rubocop foo/bar.rb
```

### Documentation
Comment any code contributions according to the existing conventions within the project.
Reference the examples listed below:

Example top-level comment:

```
##
# = ClassNameGoesHere
# Author::    [Author Information]
# Copyright:: Copyright [Year] [Author Information]
# License::   GNU Public License 3
#
# This is a class that is something and does something.
```

Example method comment:

```
##
# This is a method that does something
```

You can generate documentation using the following rake task.
```
# Run custom rake task to regenerate RDoc documentation
rake rdoc
```

### Testing
Integration tests should be written for all classes and methods.

## TODO
* Make tests...

## Changelog
### 2018-11-21
* Included instructions for running as a Systemd service.

### 2018-11-07
* Upgraded to version `0.2.0`.
* Added `play` command.
