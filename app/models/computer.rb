class Computer < ActiveRecord::Base
  has_many :parts

  def self.retrieve(api_id)
    # user_input ||= " "

    # if user_input == ""
    #   user_input = " "
    # end

    Newegg.search(store_id: 1, category_id: 38, page_number: 1, sort: "FEATURED", keywords: "#{api_id}")["ProductListItems"]

  end
end
