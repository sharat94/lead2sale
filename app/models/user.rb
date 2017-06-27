class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :prospects , :class_name => "Prospect", :foreign_key => "managed_by"
  has_many :customers , :class_name => "Customer", :foreign_key => "managed_by"
  has_many :tasks
  validates_presence_of :full_name, :phone, :email, :role_id
  validates_length_of :phone, is: 10
  validates_numericality_of :phone

end
