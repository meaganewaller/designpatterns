require './subject'
require './employee'
require './payroll'
require './taxes'

meagan = Employee.new('Meagan Waller', 'Apprentice', 100000)

payroll = Payroll.new
meagan.add_observer(payroll)

taxes = Taxes.new
meagan.add_observer(taxes)

# Give Meagan a raise
meagan.salary = 250000
