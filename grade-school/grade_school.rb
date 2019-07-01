# Class for determining list of students
class School
  def initialize
    @grade_school = Hash.new { |hash, key| hash[key] = [] }
  end

  def add(name, grade_level)
    @grade_school[grade_level] << name
  end

  def students(grade_level)
    @grade_school[grade_level].sort!
  end

  def students_by_grade
    @grade_school.keys.sort.map do |grade_level|
      { grade: grade_level, students: students(grade_level) }
    end
  end
end
