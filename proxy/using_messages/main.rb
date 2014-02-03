require '../bank_account'
require './account_proxy'
require './account_protection_proxy'

proxy = AccountProxy.new(BankAccount.new(100))
proxy.deposit(25)
proxy.withdraw(50)
puts "account balance is now: #{proxy.balance}"

# Generic virtual proxy
require './virtual_proxy'
array = VirtualProxy.new { Array.new }
array << 'hello'
array << 'out'
array << 'there'

puts array.to_s
