class Student <ApplicationRecord
  has_many :professor_students, dependent: :destroy
  has_many :professors, through: :professor_students

  validates :name, presence: :true
  validates :age, presence: :true
  validates :house, presence: :true
end
