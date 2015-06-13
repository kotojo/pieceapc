class Computer < ActiveRecord::Base
  validates :name, presence: true
  has_many :parts, dependent: :destroy
  belongs_to :user
  acts_as_votable

  def self.retrieve(api_id)
    # user_input ||= " "

    # if user_input == ""
    #   user_input = " "
    # end

    Newegg.search(store_id: 1, page_number: 1, sort: "FEATURED", keywords: "#{api_id}")["ProductListItems"]

  end

  def score
    self.update_attribute(:rating, self.get_upvotes.size - self.get_downvotes.size)
    self.get_upvotes.size - self.get_downvotes.size

  end

end
