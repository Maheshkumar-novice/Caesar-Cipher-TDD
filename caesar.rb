#!/usr/bin/env ruby
# frozen_string_literal: true

def shift_character(character, min_range)
  (character - min_range) % 26 + min_range
end

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

