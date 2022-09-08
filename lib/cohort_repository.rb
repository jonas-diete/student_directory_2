require_relative './cohort'
require_relative './student'

class CohortRepository
  def find_with_students(id)
    sql = 'SELECT students.name AS "student_name", cohorts.name AS "cohort_name", cohorts.starting_date FROM students JOIN cohorts ON students.cohort_id = cohorts.id WHERE cohorts.id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])
    record = result_set[0]

    cohort = Cohort.new
    cohort.name = record['cohort_name']
    cohort.starting_date = record['starting_date']
    cohort.students = []

    result_set.each do |record|
      student = Student.new
      student.name = record['student_name']
      cohort.students << student
    end

    return cohort
  end
end