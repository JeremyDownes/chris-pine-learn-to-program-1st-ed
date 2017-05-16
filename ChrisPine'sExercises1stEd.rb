# 99 bottles of beer duh
i = 99
while (i>2) do
  puts "#{i} bottles of beer on the wall,"
  puts "#{i} bottles of beer!"
  puts "If one of those bottles should happen to fall"
  i-=1
  puts "#{i} bottles of beer on the wall..."
end
puts "#{i} bottles of beer on the wall,"
puts "#{i} bottles of beer!"
puts "If one of those bottles should happen to fall"
i-=1
puts "#{i} bottle of beer on the wall..."
puts "#{i} bottle of beer on the wall,"
puts "#{i} bottle of beer!"
puts "If THAT bottle should happen to fall"
i-=1
puts "NO bottles of beer on the wall..."
 
#A chat with Grandma
puts "HEY THERE SONNY ! COME OVER HERE AND HAVE A CHAT WITH YOUR OLD GRANDMA."
ignore_grandma = false
  while !ignore_grandma do
    print "< Your message to Grandma >"
    msg_2_gma = gets.chomp
      
    if msg_2_gma != msg_2_gma.upcase
      puts "EH SONNY, WHATD YA SAY?"
      count_out = 0
    else if msg_2_gma == "BYE GRANDMA"
      puts "EH SONNY, WHATD YA SAY?" 
      count_out += 1
    else 
      year = rand(50) + 1932
      puts "OH, MY ! WELL NOT SINCE #{year}, SONNY"
      count_out = 0
    end
    if count_out == 3 
      ignore_grandma = true
    end
  end
end
if ignore_grandma 
    puts "I guess nobody has time for Grandma..."
end

#Calculate and print leap years
Puts "Calculate leap years"
print "Starting year: "
start_year = Integer(gets.chomp)
print "Ending year: "
end_year = Integer(gets.chomp)
if start_year % 4 != 0 
  start_year += 4-(start_year % 4)
end
# the following block of code is unnecessary if explicit but I like it
=begin
if end_year % 4 != 0 
    end_year += (start_year % 4) - 4 
end
=end
while start_year <= end_year
    puts start_year
    start_year += 4
end

# Next chapter first paragraph asked and answered (what? that was retorical?)
stop = false
message = ""
while !stop do
    word = gets.chomp
    if word == ""
        stop = true
    end
    message += word+","
end

# So here I have to reinvent the wheel cuz I didn't read the whole paragraph ALPHABETIZE
# I can treat the string as an array if word[0] > word[10] but I'd have to keep track of 
# the position of the character following the comma without using an array which is 
# exceedingly difficult so I wont but I can use the bones to finish
# the following works if there are no duplicates

message = message.split(",")
puts message.sort_by(&:downcase).join(" ")
puts message.sort_by{|word| word.downcase}.join(" ")

# and without using sort method which was actually a bit of a puzzle
message2 = message          # save the array for later
message.each do |word|
    for x in message do
        if word.downcase < x.downcase
            if message.index(x) < message.index(word)   #index returns the first instance but I needed an integer !
                message.delete_at(message.index(word))
                message.insert(message.index(x),word)
                break
            end
        end
    end
end
puts message.join(" ")

# and handling duplicates frustrated me for severl hours
# "if indx < w_indx" checks that you don't search past your position
# cuz we're all cutting in line and if you're first you dont even check  
# cuz you can't get a better position. This line saves considerable processing

message = message2          # restore the value to what it was before the last block
puts "The corrected sort method will return:"

w_indx = 0
message.each do |word|
    indx = 0
    while indx < message.length do
        comp = message[indx]
        if indx < w_indx
            if word.downcase < comp.downcase
                message.delete_at(w_indx)
                message.insert(indx,word)
                break
            end
        else break
        end
        indx += 1
    end
    w_indx += 1
end
puts message.join(" ")

# one billion seconds old

print "Please enter your birth year (four digit)"
year = gets.chomp
print "Please enter your birth month (numeric value)"
month = gets.chomp
print "Please enter your birth day (of the month)"
day = gets.chomp
birthday = Time.mktime(year.to_i,month.to_i,day.to_i)
puts "Your one billion seconds old day is:",(birthday+1000000000)

# 101 lines of fluff to follow: orange tree app

class OrangeTree
    def initialize
        @height = 3
        @age = 0
        @oranges = 0
        @healthy = true
        @watered = 0
        @fertilized = 0
        puts "You brought home an orange tree and planted it in your yard."
        puts "It is "+@height.to_s+"ft tall and has "+@oranges.to_s+" oranges."
    end
    def aged
        @same_year = false
        @oranges = 0
        @age += 1
        @mode =  (@age*1.0) / (@height - @age)
        @mode *= 4
         if @height < 30
             @height =  @height + @mode.to_i
         end
        puts "One year has passed and now your orange tree is "+@height.to_s+"ft tall and "+@age.to_s+" years old!"
        @chance = rand(@age)
        if !@healthy 
            @chance += rand(@age)
        end
        if @chance > rand(20)
            fungus
        end    
    end
    def fungus
        @healthy = false
        puts "Your orange tree has contracted a fungus"
        @odds = rand(@age+1)
        if @odds < rand(20)
            puts "You treat it and the tree survives"
            if @odds < rand(5)
                puts "Plus the fungus has all cleared up!"
                @healthy = true
            else
                puts "But the fungus didn't go away"
            end
        else
            puts "You did your best to save it but your tree has died"
            exit
        end
    end
    def water
        @watered += 1
        puts "You water your orange tree"
        puts "You can't tell if it likes it but it looks happy"
    end
    def fertilize
        @fertilized += 1
        puts "You fertilize your tree"
        puts "This stuff stinks. I wonder what's in it?"
    end
    def calc_oranges
        if !@same_year
            if @age > 3
                @oranges=rand(@age+@fertilized+@watered)+2
            end
        end
        puts "Let's see now there are ..."+@oranges.to_s+" oranges !"
        @same_year = true;
    end
    def pick_oranges (num)
        if  num > @oranges
            puts "I'm not sure there are any oranges"
        else
            puts "You pick "+num.to_s+" oranges."
            @oranges = @oranges - num
            puts "There are "+@oranges.to_s+" oranges remaining."

        end
    end
end
your_tree = OrangeTree.new
puts "You can WATER your tree or FERTILIZE it"
puts "You can COUNT or PICK your oranges"
puts "You can also WAIT or QUIT"
while true do
  input = gets.chomp
  input.downcase!
  if input == "water" 
    your_tree.water
  elsif input == "fertilize" 
    your_tree.fertilize
  elsif input == "count" 
    your_tree.calc_oranges
  elsif input == "wait" 
    your_tree.aged
  elsif input == "quit" 
    exit
  elsif input == "pick" 
    puts "How many?"
    quantity = gets.chomp
    quantity = quantity.to_i
    your_tree.pick_oranges(quantity)
  else 
    puts "You can't do "+input
  end
end

#Grandfather Clock:  Passes a block of code into a method calls like a proc. Note the &. I like it !

def grandfather_clock &block
  time = Time.now.hour
  if time > 12
    time = time - 12
  end
  time.times do
    block.call
  end
end
puts "If you were a grandfather clock what noise would you make?"
bong = gets.chomp

grandfather_clock do
  puts bong
end

# The last two exercises in chis pine's book 1st addition

$Count = 0
def lodge description, &block
    $Count.times do
        print " "
    end
    puts "Beginning "+description
    $Count += 2
    y = block.call
    
    $Count.times do
        print " "
    end
    puts description+" Completed"
    $Count -= 2
    "Here's your change"
    
end

x = lodge "This is the outer method" do
    puts x
    y = lodge "This is the middle method" do
        puts y
        z = lodge "This is the inner method" do
            puts z
            puts "I'm deep in it and not evaluated yet"
            puts z
        end
    end
end