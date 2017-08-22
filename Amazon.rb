#Gems
require 'tty-prompt'
prompt = TTY::Prompt.new
require 'continuation'
continuation = callcc { |c| c } # define our savepoint



#arrays
@cart = []
@array = []
@authorarray = []
@purchase = []
@finalpurchase = []

#methods
def push(genre)
  Book.all.each do |book|
    if book.genre.category == genre
    @cart << book.name
    end
  end
end

def pull(author)
  Book.all.each do |book|
    if book.author.name == author
    @cart << book.name
    end
  end
end

#classes
class Book
  def initialize(name, author, genre)
    @name = name
    @author = author
    @genre = genre
  end
  attr_accessor :name, :author, :genre
  def self.all
    ObjectSpace.each_object(self).to_a.uniq
  end
end

class Author
  def initialize(name)
    @name = name
  end
  attr_accessor :name
  def self.all
    ObjectSpace.each_object(self).to_a.uniq
  end
end

class Genre
  def initialize(category)
    @category = category
  end
  attr_accessor :category
  def self.all
    ObjectSpace.each_object(self).to_a.uniq
  end
end

#LIBRARY
#Author
ernest_cline = Author.new("Ernest Cline")
george_martin = Author.new("George Martin")
mark_manson = Author.new("Mark Manson")
kevin_hart = Author.new("Kevin Hart")
ashlee_vance = Author.new("Ashlee Vance")
j_tolkien = Author.new("J R R Tolkien")
stephen_covey = Author.new("Stephen Covey")
rhonda_byrne = Author.new("Rhonda Byrne")
george_orwell = Author.new("George Orwell")
ahn_do = Author.new("Ahn Do")
#Genre
scifi = Genre.new("Scifi")
fantasy = Genre.new("Fantasy")
selfhelp = Genre.new("Self Help")
biography = Genre.new("Biography")

#Book
Book.new("Ready Player One", ernest_cline, scifi)
Book.new("Armada", ernest_cline, scifi)
Book.new("Armada Part 2", ernest_cline, scifi)
Book.new("1984", george_orwell, scifi)
Book.new("1985", george_orwell, fantasy)
Book.new("1986", george_orwell, selfhelp)
Book.new("A Game of Thrones (A Song of Ice and Fire, Book 1)", george_martin, fantasy)
Book.new("A Clash of Kings (A Song of Ice and Fire, Book 2)", george_martin, fantasy)
Book.new("Lord of The Rings", j_tolkien, fantasy)
Book.new("Lord of The Rings 2", j_tolkien, fantasy)
Book.new("Lord of The Rings 3", j_tolkien, fantasy)
Book.new("The Subtle Art of Giving a F*ck", mark_manson, selfhelp)
Book.new("The Subtle Art of Not Giving a F*ck", mark_manson, selfhelp)
Book.new("7 Habits of Highly Effective People", stephen_covey, selfhelp)
Book.new("8 Habits of Highly Ineffective People", stephen_covey, selfhelp)
Book.new("The Secret", rhonda_byrne, selfhelp)
Book.new("The Public Record", rhonda_byrne, selfhelp)
Book.new("I Can’t Make This Up: Life Lesson", kevin_hart, biography)
Book.new("Turns out I Can Make This Up: Life Lesson 2", kevin_hart, biography)
Book.new("Elon Musk: Tesla", ashlee_vance, biography)
Book.new("Elon Musk: SpaceX", ashlee_vance, biography)
Book.new("The Happiest Refugee", ahn_do, biography)
Book.new("The Saddest Native", ahn_do, scifi)
# library = true
# continuation AMAZON
# while library == true
#Application
system("clear")
system('artii "NOZAMA"')
puts "by team KFC"
puts
puts "=" * 20
puts
q1 = prompt.select("Do you want to view books by:", %w(Author Genre))
case q1
when "Author"
  Author.all.each do |author|
    @authorarray << author.name
  end
  q2 = prompt.select("Which Author?", @authorarray)
  pull(q2)
when "Genre"
  Genre.all.each do |genre|
    @array << genre.category
  end
  q3 = prompt.select("What Genre?", @array)
  push(q3)
end

@q4 = prompt.select("Which book would you like to borrow?", @cart)
Book.all.each do |book|
  if book.name == @q4
  @purchase << book
  end
end
Book.all.each do |book|
  if book.name == @q4
  @finalpurchase << book
  end
end
@purchase.each do |purchase|
  @cart.delete(purchase.name)
  random = @cart.sample
  selection = [random, "No Thanks"]
@q6 = prompt.select("Would you be interested in our recommended book?", selection)
end
Book.all.each do |book|
  if book.name == @q6
  @finalpurchase << book
  end
end
system("clear")
puts "Below are your books:"
@finalpurchase.each do |finalpurchase|
  puts "#{finalpurchase.name} by #{finalpurchase.author.name}"
end

#ATTEMPT TO LOOP = FAIL
# puts "Thank you for shopping at NOZAMA, have a nice day."
#
# puts "So you're borrowing #{purchase.name} by #{purchase.author.name}"

# q5 = prompt.select("Would you like to borrow another book?", %w(Yes No))
# case q5
# when "Yes"
#   @cart.clear
#   library = true
# when "No"
#   library = false
#   puts "Check Out"
#   @purchase.each do |purchase|
#     puts "So you're borrowing #{purchase.name} by #{purchase.author.name}"
#     @cart << "No Thanks"
#     @cart.delete(purchase.name)
#   prompt.select("Recommended books:", @cart)
#   end
# end
# end
# @cart.each do |cart|
#   puts "#{cart.name} by #{cart.author.name}"
# end
