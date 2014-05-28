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
    #Rails.logger.info("Doing something")
    @mc.list_subscribe({:id => '39ee7ea464',
                               :email_address => self.email, 
                               :merge_vars => {:FNAME => self.name}, 
                               :double_optin => "false"})  
  end

end
