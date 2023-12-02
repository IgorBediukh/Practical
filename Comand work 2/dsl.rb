class Project
  def initialize
    @tasks = []
  end

  def task(name, &block)
    task = Task.new(name)
    task.instance_eval(&block) if block_given?
    @tasks << task
  end

  def run
    @tasks.each(&:execute)
  end
end

class Task
  attr_accessor :name, :description

  def initialize(name)
    @name = name
    @description = ""
  end

  def description(desc)
    @description = desc
  end

  def execute
    puts "Виконується завдання: #{@name}"
    puts "Опис: #{@description}"
    # Додайте логіку виконання завдання тут
  end
end

# Приклад використання DSL

project = Project.new

project.task "task1" do
  description "Це завдання 1"
  # Додаткова конфігурація або логіка завдання може бути додана тут
end

project.task "task2" do
  description "Це завдання 2"
  # Додаткова конфігурація або логіка завдання може бути додана тут
end

# Виконати завдання
project.run
