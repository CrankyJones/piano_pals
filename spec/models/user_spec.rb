require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :username }
  it { should validate_uniqueness_of(:username).case_insensitive }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_presence_of :password }
  it { should validate_confirmation_of :password }
end
