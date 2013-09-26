require 'spec_helper'

describe Owner do
  it { should have_many :buildings }

  it { should have_valid(:first_name).when('Lloyd', 'Harry') }
  it { should_not have_valid(:first_name).when('',nil) }

  it { should have_valid(:last_name).when('Christmas', 'Dunne') }
  it { should_not have_valid(:last_name).when('',nil) }

  it { should have_valid(:email).when('Lloyd@gmail.com', '1Harrymarry@hotmail.com') }
  it { should_not have_valid(:email).when('',nil) }

end
