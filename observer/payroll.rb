class Payroll
  def update(changed_employee)
    puts "Cut a new check for #{changed_employee.name}!"
    puts "Their salary is now #{changed_employee.salary}!"
  end
end
