class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :recoverable, :rememberable, :trackable, :validatable, :database_authenticatable, :confirmable, :invitable, :invite_for => 2.weeks
  belongs_to :role
  has_many :prospects , :class_name => "Prospect", :foreign_key => "managed_by"
  has_many :customers , :class_name => "Customer", :foreign_key => "managed_by"
  has_many :tasks
  validates_presence_of :full_name, :phone, :email, :role_id
  validates_length_of :phone , :in => 7..32
  validates_numericality_of :phone

end
