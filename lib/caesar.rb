#!/usr/bin/env ruby
# frozen_string_literal: true

class CaesarCipher
  def caesar_cipher(text, key)
    text.split('').map { |character| shift(character, key) }.join('')
  end

  private

  def shift(character, key)
    ordinal = character.ord
    return character unless acceptable_ordinal?(ordinal)

    range_start_value = range_start(ordinal)
    shifted_ordinal = ordinal + key
    ordinal_distance_from_range_start = (shifted_ordinal - range_start_value)
    ordinal_in_given_range = range_start_value + ordinal_distance_from_range_start % 26
    ordinal_in_given_range.chr
  end

  def acceptable_ordinal?(ordinal)
    ordinal.between?(97, 122) || ordinal.between?(65, 90)
  end

  def range_start(ordinal)
    return 97 if ordinal.between?(97, 122)
    return 65 if ordinal.between?(65, 90)
  end
end
