# Directly access BankAccount
require './bank_account'
account = BankAccount.new(50)
account.deposit(50)
account.withdraw(15)
puts account.balance


# Protection Proxy
require './bank_account_proxy'
protection_proxy = BankAccountProxy.new(account)
protection_proxy.deposit(100)
protection_proxy.withdraw(25)
puts protection_proxy.balance

# Virtual Proxy
require './virtual_account_proxy'
virtual_proxy = VirtualAccountProxy.new { BankAccount.new(25) }
virtual_proxy.deposit(10)
virtual_proxy.withdraw(20)
puts virtual_proxy.balance

