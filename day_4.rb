# --- Day 4: High-Entropy Passphrases ---

# A new system policy has been put in place that requires all accounts to use a passphrase instead of simply a password. A passphrase consists of a series of words (lowercase letters) separated by spaces.

# To ensure security, a valid passphrase must contain no duplicate words.

# For example:

# aa bb cc dd ee is valid.
# aa bb cc dd aa is not valid - the word aa appears more than once.
# aa bb cc dd aaa is valid - aa and aaa count as different words.
# The system's full passphrase list is available as your puzzle input. How many passphrases are valid?

input = File.read('inputs/day_4.txt')

def valid_passphrase?(input)
  words = input.split(' ')
  words.uniq == words
end

def count_valid_passphrases(input)
  input.split("\n")
       .select { |line| valid_passphrase?(line) }
       .size
end


puts valid_passphrase?('aa bb cc dd ee') # => true
puts valid_passphrase?("aa bb cc dd aa ") # => false
puts valid_passphrase?('aa bb cc dd aaa') # => true

puts count_valid_passphrases(input) # => 337


# --- Part Two ---

# For added security, yet another system policy has been put in place. 
# Now, a valid passphrase must contain no two words that are anagrams of each other - that is, 
# a passphrase is invalid if any word's letters can be rearranged to form any other word in the passphrase.

# For example:

# abcde fghij is a valid passphrase.
# abcde xyz ecdab is not valid - the letters from the third word can be rearranged to form the first word.
# a ab abc abd abf abj is a valid passphrase, because all letters need to be used when forming another word.
# iiii oiii ooii oooi oooo is valid.
# oiii ioii iioi iiio is not valid - any of these words can be rearranged to form any other word.
# Under this new system policy, how many passphrases are valid?

def valid_passphrase?(input)
  words = input.split(' ').map(&:chars).map(&:sort)
  words.uniq == words
end

puts valid_passphrase?('abcde fghij') # => true
puts valid_passphrase?('abcde xyz ecdab') # => false
puts valid_passphrase?('a ab abc abd abf abj') # => true
puts valid_passphrase?('iiii oiii ooii oooi oooo') # => true
puts valid_passphrase?('oiii ioii iioi iiio') # => false

puts count_valid_passphrases(input) # => 231
