#!/usr/bin/env ruby
# frozen_string_literal: true

require 'rubygems'
begin
  gem 'colorize'
  gem 'clipboard'
rescue Gem::LoadError
#   Gem.install('colorize')
 `gem install colorize --user`
 `gem install clipboard --user`
  gem 'colorize'
  gem 'clipboard'
end
require 'colorize'
require 'clipboard'

# Shift Each Character
def shift_character(character, min_range)
  (character - min_range) % 26 + min_range
end

# Caesar Cipher
def caesar_cipher(text, key, key_modifier)
  key *= key_modifier
  text.split('').map do |character|
    ord = character.ord
    if ord.between?(97, 122)
      min_range = 97
    elsif ord.between?(65, 90)
      min_range = 65
    else
      next character
    end
    shift_character(ord + key, min_range).chr
  end.compact.join('')
end

# For operations
operation_hash = { 1 => 'Encryption', -1 => 'Decryption' }

# Note
puts 'Note: '.red
puts "You can Press 'Enter' to exit in text input".red
puts "You need to enter key used to encrypt so program will reverse it\n".red

# Init Script
loop do
  print 'Do you want to use your clipboard text? (y/n) > '.yellow
  choice = gets.chomp

  # Text Choice Selection
  if choice == 'y'
    text = Clipboard.paste
    puts "Text from Clipboard > #{text}".yellow
  else
    print "\nEnter the Text > ".yellow
    text = gets
    break if text == "\n"

    text = text.chomp
  end

  # Type of Function Selection
  print "\n1) Encrypt\n2) Decrypt\n > ".yellow
  key_modifier = gets.chomp.to_i
  key_modifier = key_modifier == 1 ? 1 : -1

  # Key to Shift
  print "\nEnter the Key > ".yellow
  key = gets.chomp.to_i

  # Print Result
  print "\nAfter #{operation_hash[key_modifier]} with key #{key_modifier * key}: ".green
  after_shift = caesar_cipher(text, key, key_modifier)
  Clipboard.copy after_shift
  puts after_shift
  puts "\nSuccessfully Copied to Clipboard!\n".green
end
