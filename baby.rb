##require/use a feature to read CSV Files
require 'csv'
##requiring my human file or 'human.rb'
##you can also use "require './human.rb' " 
require_relative 'human'

#initializing an array/list of baby humans with an empty list
#this is just an empty variable
baby_humans = []

#reading a file using the class name and store as a list of babies
# on line #1 we require a csv that gives me access to the CSV class
# and this class has a method call "read" and accepts 1 parameter
baby_list = CSV.read("Popular_Baby_Names.csv")

##The format of the CSV File is like
=begin 
Year of Birth,Gender,Ethnicity,Child's First Name,Count,Rank
2011,FEMALE,HISPANIC,GERALDINE,13,75
2011,FEMALE,HISPANIC,GIA,21,67
2011,FEMALE,HISPANIC,GIANNA,49,42
=end

#this is a loop/iterator for each item of the baby_list array
baby_list.each do |baby|
    #my human class has 3 parameters now
    #but the columns of the csv file are not in specific order
    
    #appending new human for each line of the csv file
    baby_humans << Human.new(baby[3],baby[0].to_i,baby[1])
end

puts "There are #{baby_humans.length} humans"
puts "The name of the human number 100 is " + baby_humans[99].name
puts "The ethnicity of the human number 100 is " + baby_humans[99].ethnicity
puts "The age of the human number 100 is " + (Time.now.year - baby_humans[99].yb_date).to_s