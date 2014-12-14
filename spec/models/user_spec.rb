require 'cancan/matchers'
require 'support/helpers/user_helpers'

describe User do
  include Models::UserHelpers

  before(:each) { @user = User.new(email: 'user@example.com', first_name: 'Stéphane', last_name: 'Barale') }

  subject { @user }

  it { should respond_to(:email) }

  it '#email returns a string' do
    expect(@user.email).to match 'user@example.com'
  end

  it '#name returns a string' do
    expect(@user.set_default_name).to match 'Stéphane Barale'
  end

  it '#role set default to visitor' do
    expect(@user.set_default_role).to match 'visitor'
  end

  it '#student? on student account' do
    check_role(User.new(role: :student), 'student').should be_truthy
  end

  it '#association? on association account' do
    check_role(User.new(role: :association), 'association').should be_truthy
  end

  it '#moderator? on moderator account' do
    check_role(User.new(role: :moderator), 'moderator').should be_truthy
  end

  it '#staff? on staff account' do
    check_role(User.new(role: :staff), 'staff').should be_truthy
  end

  it '#admin? on admin account' do
    check_role(User.new(role: :admin), 'admin').should be_truthy
  end

  describe Ability do
    subject(:ability) { Ability.new(user) }
    let(:user) { nil }

    context 'when is an account student' do
      let(:user) { FactoryGirl.create(:user) }

      it { should_not be_able_to(:manage, User.new) }
      it { should be_able_to(:manage, user) }
    end
  end
end
