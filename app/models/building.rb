class Building < ActiveRecord::Base
  belongs_to :owner,
    inverse_of: :buildings 

  accepts_nested_attributes_for :owner

  validates_presence_of :street_address
  validates_presence_of :city
  validates_presence_of :state

  validates_length_of :postal_code, :is => 5, :message=> "must include 5 numbers.",
      only_integer: true,
      allow_blank: false

  # *****Doesn't work, Don't know Why. Boo.*****
  # def self.states
  #   list_states = []
  #   CSV.foreach('states.csv', headers: false) do |state|
  #     list_states << state
  #   end
  # end

  def self.owner_list
    @owners = Owner.all
  end

  def self.states
    ["",
    "Alabama",
    "Alaska",
    "American Samoa",
    "Arizona",
    "Arkansas",
    "California",
    "Colorado",
    "Connecticut",
    "Delaware",
    "District of Columbia",
    "Florida",
    "Georgia",
    "Guam",
    "Hawaii",
    "Idaho",
    "Illinois",
    "Indiana",
    "Iowa",
    "Kansas",
    "Kentucky",
    "Louisiana",
    "Maine",
    "Maryland",
    "Massachusetts",
    "Minnesota",
    "Mississippi",
    "Missouri",
    "Montana",
    "Nebraska",
    "Nevada",
    "New Hampshire",
    "New Jersey",
    "New Mexico",
    "New York",
    "North Carolina",
    "North Dakota",
    "Ohio",
    "Oklahoma",
    "Oregon",
    "Pennsylvania",
    "Puerto Rico",
    "Rhode Island",
    "South Carolina",
    "South Dakota",
    "Tennessee",
    "Texas",
    "Utah",
    "Vermont",
    "Virginia",
    "Virgin Islands",
    "Washington",
    "West Virginia",
    "Wisconsin",
    "Wyoming"
    ]
  end
end
