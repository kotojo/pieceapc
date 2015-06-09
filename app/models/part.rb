class Part < ActiveRecord::Base
  belongs_to :computer

  require 'newegg'

  def self.retrieve(user_input)
    # user_input ||= " "

    # if user_input == ""
    #   user_input = " "
    # end

    Newegg.search(store_id: 1, category_id: 38, page_number: 1, sort: "FEATURED", keywords: "#{user_input}")["ProductListItems"]

  end
end
