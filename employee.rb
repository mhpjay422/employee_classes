require 'pry'

class Employee
  attr_reader :name, :salary, :title
  attr_accessor :boss

  def initialize(name, salary, title, boss = nil)
    @name, @salary, @title = name, salary, title
    self.boss = boss
  end

  def boss=(boss)
    @boss = boss
    boss.add_employee(self) unless boss.nil?

    boss
  end

  def bonus()
    percent = 10
    self.salary * percent / 100
  end
end

class Manager < Employee
  attr_reader :employees

  def initialize(name, salary, title, boss = nil)
    super(name, salary, title, boss)
    @employees = []
  end

  def add_employee(subordinate)
    employees << subordinate

    subordinate
  end

  def bonus()
    percent = 20
    self.total_subsalary * percent / 100
  end

  protected
  
  def total_subsalary
    total_subsalary = 0
    self.employees.each do |employee|
      if employee.is_a?(Manager)
        total_subsalary += employee.salary + employee.total_subsalary
      else
        total_subsalary += employee.salary
      end
    end

    total_subsalary
  end
end

class Executive < Manager
  def initialize(name, salary, title, boss = nil, signing_bonus)
    super(name, salary, title)
    @employees = []
  end

  def add_manager
  end

  def bonus
    (self.total_subsalary * percentage / 100) + 1000000
  end

  protected

  def total_subsalary
  end
end


def run_employees
  a = Employee.new("John", 50000, "Call Center Rep")
  b = Employee.new("Jandice", 50000, "Call Center Rep")
  c = Manager.new("James", 100000, "Call Center Supervisor")
  d = Manager.new("Jim", 150000, "Call Center Manager")
  e = Manager.new("June", 200000, "Call Center Director")
  c.add_employee(a)
  c.add_employee(b)
  d.add_employee(c)
  # e.add_employee(d)
  # binding.pry;
  # f = Executive.new()

end

run_employees();

# What is the differenc between using @method and self.method? Think context

# What does super do? Think bubbles

# What did we practice today? 

# What have you learned? 

# What do you want to google? 

# What are you not sure of? 

# HW - 5 Minutes

# add a new file to this folder
# create a class. 
# write a initialize method adding two variables that the class will start with. 
# create a class that inherits the first and write a initialize method. Use super. 
# require pry at the top of the file. Bind pry. Open terminal and start a pry session
# Create new instances of your classes. 
# examine what these objects look like


# optional 

# create methods for these classes and invoke them along with the above
# Use pry to examine outputs

# google github cli and learn to use it. It will save you time =)


