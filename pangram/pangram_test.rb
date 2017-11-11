#!/usr/bin/env ruby
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'pangram'

# Common test data version: 1.0.0 f375051
class PangramTest < Minitest::Test
  def test_sentence_empty
    phrase = ''
    result = Pangram.pangram?(phrase)
    refute result, "Expected false, got: #{result.inspect}. #{phrase.inspect} is NOT a pangram"
  end

  def test_pangram_with_only_lower_case
    phrase = 'the quick brown fox jumps over the lazy dog'
    result = Pangram.pangram?(phrase)
    assert result, "Expected true, got: #{result.inspect}. #{phrase.inspect} IS a pangram"
  end

  def test_missing_character_x
    phrase = 'a quick movement of the enemy will jeopardize five gunboats'
    result = Pangram.pangram?(phrase)
    refute result, "Expected false, got: #{result.inspect}. #{phrase.inspect} is NOT a pangram"
  end

  def test_another_missing_character_x
    phrase = 'the quick brown fish jumps over the lazy dog'
    result = Pangram.pangram?(phrase)
    refute result, "Expected false, got: #{result.inspect}. #{phrase.inspect} is NOT a pangram"
  end

  def test_pangram_with_underscores
    phrase = 'the_quick_brown_fox_jumps_over_the_lazy_dog'
    result = Pangram.pangram?(phrase)
    assert result, "Expected true, got: #{result.inspect}. #{phrase.inspect} IS a pangram"
  end

  def test_pangram_with_numbers
    phrase = 'the 1 quick brown fox jumps over the 2 lazy dogs'
    result = Pangram.pangram?(phrase)
    assert result, "Expected true, got: #{result.inspect}. #{phrase.inspect} IS a pangram"
  end

  def test_missing_letters_replaced_by_numbers
    phrase = '7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog'
    result = Pangram.pangram?(phrase)
    refute result, "Expected false, got: #{result.inspect}. #{phrase.inspect} is NOT a pangram"
  end

  def test_pangram_with_mixed_case_and_punctuation
    phrase = '"Five quacking Zephyrs jolt my wax bed."'
    result = Pangram.pangram?(phrase)
    assert result, "Expected true, got: #{result.inspect}. #{phrase.inspect} IS a pangram"
  end

  def test_upper_and_lower_case_versions_of_the_same_character_should_not_be_counted_separately
    phrase = 'the quick brown fox jumped over the lazy FOX'
    result = Pangram.pangram?(phrase)
    refute result, "Expected false, got: #{result.inspect}. #{phrase.inspect} is NOT a pangram"
  end

  def test_bookkeeping
    assert_equal 4, BookKeeping::VERSION
  end
end
