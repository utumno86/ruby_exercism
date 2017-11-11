# A Class to produce the food-chain nursery rhyme
class FoodChain
  VERSION = 2
  @animals = {
    'fly' => "I don't know why she swallowed the fly. Perhaps she'll die.",
    'spider' => 'It wriggled and jiggled and tickled inside her.',
    'bird' => 'How absurd to swallow a bird!',
    'cat' => 'Imagine that, to swallow a cat!',
    'dog' => 'What a hog, to swallow a dog!',
    'goat' => 'Just opened her throat and swallowed a goat!',
    'cow' => "I don't know how she swallowed a cow!",
    'horse' => "She's dead, of course!"
  }

  def self.song
    song_text = ""
    verse_counter = 0
    animals = []
    @animals.each do |animal, verse|
      animals << animal
      song_text << "I know an old lady who swallowed a " + animal + ".\n"
      song_text << verse + "\n"
      if verse_counter == 0
        song_text << "\n"
      end
      if verse_counter > 0 && verse_counter < 7
        verse_counter.downto(1) do |cumulation|
          song_text << "She swallowed the " + animals[cumulation] + " to catch the " + animals[cumulation -1]
          if animals[cumulation-1] == 'spider'
            song_text << " that wriggled and jiggled and tickled inside her.\n"
          else
            song_text << ".\n"
          end
        end
        unless verse_counter == 7
          if verse_counter == 0
            song_text << "\n"
          else
            song_text << "I don't know why she swallowed the fly. Perhaps she'll die.\n\n"
          end
        else
          song_text << "She's dead, of course!\n"
        end
      end
      verse_counter += 1
    end
    song_text
  end
end
