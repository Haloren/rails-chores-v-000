require 'rails_helper'

RSpec.describe User, type: :model do

  describe "misc" do
    before (:each) do
      @user = create(:user)
    end

    it "is valid with an email" do
      expect(@user).to be_valid
    end
  end

  describe "information cannot be left blank" do
    before (:each) do
      @user = build(:user)
    end

    it "is invalid without an email address" do
      @user.email = nil
      @user.valid?
      expect(@user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      @user.password = nil
      @user.valid?
      expect(@user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a house" do
      @user.house = nil
      @user.valid?
      expect(@user.errors[:house]).to include("can't be blank")
    end
  end

  describe "information cannot already be in use" do
    before (:each) do
      @user1 = create(:user, email: 'duplicate@example.com')
    end

    it "is invalid with a duplicate email address" do
      user2 = build(:user, email: 'duplicate@example.com')
      user2.valid?
      expect(user2.errors[:email]).to include("has already been taken")
    end
  end

  describe "associations" do
    let(:user) { subject }

    it "has many chores through user_chores" do
      chore = Chore.create
      user.chores << chore
      user.save

      expect(user.chores).to include(chore)
    end

    it "has many user_chores" do
      user_chore = UserChore.create
      user.user_chores << user_chore
      user.save

      expect(user_chore.user).to eq(user)
    end

    it "belongs to a house" do
      expect(user.house).to eq(@house)
    end
  end

end
