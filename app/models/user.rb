class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :lockable, :timeoutable

  validates :name, presence: true, length: { maximum: 255 }
  validates :role, presence: true

  # Role employee: superadmin: 0, supervisor: 1, manager: 2, tech: 3, unassigned: 4, disabled: 5
  # Default role is set to unassigned
  enum role: [:superadmin, :supervisor, :manager, :tech, :unassigned, :disabled]
end
