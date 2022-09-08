require 'cohort_repository'

def reset_cohorts_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'students_directory_2_test' })
  connection.exec(seed_sql)
end

describe CohortRepository do
  before(:each) do 
    reset_cohorts_table
  end

  it "returns all students from a certain cohort" do
    repo = CohortRepository.new
    cohort = repo.find_with_students(1)
    expect(cohort.name).to eq 'August'
    expect(cohort.starting_date).to eq '01-08-2022'
    expect(cohort.students.length).to eq 2
    expect(cohort.students[0].name).to eq "Jonas"
    expect(cohort.students[1].name).to eq "Sadat"
    
  end
end