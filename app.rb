require_relative './lib/database_connection'
require_relative './lib/cohort_repository'

DatabaseConnection.connect('students_directory_2')

repo = CohortRepository.new
cohort = repo.find_with_students(1)

puts "Students for the cohort #{cohort.name}, starting on #{cohort.starting_date}:"
cohort.students.each_with_index do |student, index|
  puts "#{index + 1}. #{student.name}"
end