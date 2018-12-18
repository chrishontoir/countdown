words = {}
File.open("/usr/share/dict/words") do |file|
  file.each do |line|
    words[line.strip] = true
  end
end
p words["magic"]
p words["key"]




# comt = 30
# while (comt > 0)
#     sleep(1)
#     comt = comt -1
#     puts comt
# end

array = ["30", "29", "28", "27", "26", "25", "24", "23", "22", "21", "20", "19", "18", "17", "16", "15", "14", "13", "12", "11", "10", "09", "08", "07", "06", "05", "04", "03", "02", "01", "00"]
vowels = ["a", "e", "i", "o", "u"]
consonants = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"]

chosen_vowels = []
chosen_consonants = []
chosen_letters = []
# array.each do |i|
#   print "Timer: #{i}\r" # Courtesy of @Sculpur
#   $stdout.flush
#   sleep(1)
# end
@count = 30

while chosen_consonants.length < 9
  chosen_consonants << consonants.shuffle.first
end

while chosen_vowels.length < 9
  chosen_vowels << vowels.shuffle.first
end

system "clear"

p "COUNTDOWN"
p "Would you like a vowel or a consonant? (v/c)"

# p chosen_consonants
# p chosen_vowels
 while chosen_letters.length < 9
   player_choice = gets.chomp
   if player_choice == "consonant" || player_choice == "c"
     p "#{chosen_consonants[0]} (#{(chosen_letters.length) +1}/9)"
     chosen_letters << chosen_consonants[0]
     chosen_consonants.shift
   end
   if player_choice == "vowel" || player_choice == "v"
     p "#{chosen_vowels[0]} (#{(chosen_letters.length) +1}/9)"
     chosen_letters << chosen_vowels[0]
     chosen_vowels.shift
   end
 end
 system "clear"
 p chosen_letters


while @count > 0
  for num in array
    print "Countdown! - #{num}\r"
    sleep(1)
    @count -= 1
  end

  p "Enter your answer:"
  answer = gets.chomp
  # p answer
  split_answer = answer.split("")
  # p split_answer
  count = 0

  for char in split_answer
    if chosen_letters.include?(char)
      chosen_letters.slice!(chosen_letters.index(char))
      # p "Letter valid #{char}"
      count += 1
    else
      p "Letter not valid"
    end
  end

  # for char in chosen_letters
  #   if answer_check.include?char
  #     answer_check.delete! (char)
  #     # p "#{char} used and removed from array"
  #   else
  #     # p "Invalid character used"
  #   end
  # end
  if count == split_answer.length
    if words[answer] == true
      p "Correct! #{answer.length} letter word."
    else
      p "Incorrect answer!"
    end
  end
end

# for num in array
#   print "Countdown! - #{num}\r"
#   $stdout.flush
#   sleep(1)
# end
#
# print "Enter your answer"
