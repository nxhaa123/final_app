class AlbumController < ApplicationController
  def show

  end
end
class Employee1 < ApplicationRecord
  has_many :physicians, through: employees
end
class Employee1 < ApplicationRecord
  belongs_to :employee1s
  belongs_to :physicians

end

class Physician < ApplicationRecord
  has_many :employee1s, through: employees
end
