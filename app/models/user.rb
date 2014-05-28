class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts

  validates :name, presence: true
  validates :location, presence: true

  after_create :add_to_mailing_list

  def add_to_mailing_list
    begin
      @mc = Gibbon::API.new("e201544ee220446b4a0d8b17978ae834-us8")
      current_list = '39ee7ea464'
      #Rails.logger.info("Doing something")
      @mc.lists.subscribe({:id => current_list, :email => {:email => self.email}, :merge_vars => {:FNAME => self.name}, :double_optin => false})
    rescue
    end
  end

end
