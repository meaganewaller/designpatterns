require './subject'
require './employee'

meagan = Employee.new('Meagan Waller', 'Apprentice', 100000)
meagan.add_observer do |changed_employee|
  puts "Cut a new check for #{changed_employee.name}!"
  puts "Their salary is now #{changed_employee.salary}!"
end

meagan.salary = 250000
