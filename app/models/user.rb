class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:visitor, :student, :association, :moderator, :staff, :admin]

  after_initialize :set_default_role, if: :new_record?
  before_save :set_default_name

  def set_default_name
    self.name ||= "#{self.first_name.capitalize} #{self.last_name.capitalize}" unless self.first_name.nil? or self.last_name.nil?
  end

  def set_default_role
    self.role ||= :visitor
  end

  def student?
    self.role == 'student'
  end

  def association?
    self.role == 'association'
  end

  def moderator?
    self.role == 'moderator'
  end

  def staff?
    self.role == 'staff'
  end

  def admin?
    self.role == 'admin'
  end
end
