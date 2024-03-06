class User < ApplicationRecord
  devise :database_authenticatable, :trackable, :confirmable, :registerable, :timeoutable, :lockable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :memberships, dependent: :destroy
  has_many :squads, through: :memberships
  has_many :task_groups, as: :owner, dependent: :destroy
  has_many :task_types, as: :owner, dependent: :destroy
  has_many :tasks, as: :owner, dependent: :destroy
  has_many :task_views, as: :item, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :task_views, dependent: :destroy
  has_many :status_colors, dependent: :destroy

  validates :name, presence: { message: 'Name is required' },
                   length: { maximum: 50, message: 'Name must be less than 50 characters' }

  validates :password, format: {
    with: /\A(?=.*[A-Z])(?=.*[0-9])(?=.*[^\w\s]).{8,}\z/
  }

  # Check if the user exists with the same auth credentials, if not, create a new user
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.photo = auth.info.image
      user.uid = auth.uid
      user.provider = auth.provider
      user.skip_confirmation! # Uncomment if using devise confirmable & the provider already confirms email
    end
  end

  def reactivate_account
    return unless deleted && deleted_at >= 30.days.ago && !unlock_token

    update(deleted: false, deleted_at: nil)
    UserMailer.with(user: self).account_reactivated(self).deliver_later
  end
end
