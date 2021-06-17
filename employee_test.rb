require 'minitest/autorun'
require_relative "./employee"

class EmployeeTest < Minitest::Test
  # test employee attributes

  # test employee has a boss
  
  # test employee bonus

  def test_employee_bonus_is_ten_percent_of_salary
    a = Employee.new("John", 50000, "Call Center Rep")

    assert_equal(5000, a.bonus())
  end

end

class ManagerTest < Minitest::Test

  def test_manager_calculates_bonus_of_twenty_percent
    a = Employee.new("John", 50000, "Call Center Rep")
    b = Employee.new("Johny", 50000, "Call Center Rep")
    c = Manager.new("James", 100000, "Call Center Supervisor")
    c.add_employee(a)
    c.add_employee(b)

    assert_equal(20000,c.bonus)
  end
end

