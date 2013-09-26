require 'spec_helper'

describe Building do
  it { should have_valid(:street_address).when('2 China Moon', '101 Paradise') }
  it { should_not have_valid(:street_address).when('', nil) }

  it { should have_valid(:city).when('Ormond Beach', 'Charlotte') }
  it { should_not have_valid(:city).when('', nil) }

  it { should have_valid(:state).when('Florida', 'Maine') }
  it { should_not have_valid(:state).when('', nil) }

  it { should have_valid(:postal_code).when(12345, 67899) }
  it { should_not have_valid(:postal_code).when('', nil, 1234567, 2) }
end
