=begin
Assignment 2: Count Word Frequency
Task
●​ Given a sentence
●​ Count how many times each word appears
Example Input
"ruby is easy and ruby is fun"
Expected Output
{ "ruby" => 2, "is" => 2, "easy" => 1, "and" => 1, "fun" => 1 }
=end

print "Enter a sentence: "
sentence = gets.chomp

clean_sentence = sentence
                   .downcase
                   .gsub(/[^a-z\s]/, " ")
                   .strip

if clean_sentence.empty?
  puts "Please enter a valid sentence."
  exit
end

words = clean_sentence.split

word_count = Hash.new(0)

words.each do |word|
  word_count[word] += 1
end

puts word_count


=begin
aryan@aryan-LOQ-15IRX9:~/Desktop/Training/7. ROR/ruby/asg2_word_frequency$ ruby word_frequency.rb
Enter a sentence: Hello, my name is Aryan!   and I like 2 code
{"hello"=>1, "my"=>1, "name"=>1, "is"=>1, "aryan"=>1, "and"=>1, "i"=>1, "like"=>1, "code"=>1}

aryan@aryan-LOQ-15IRX9:~/Desktop/Training/7. ROR/ruby/asg2_word_frequency$ ruby word_frequency.rb
Enter a sentence: 
Please enter a valid sentence.
=end