require 'rails_helper'

RSpec.describe Invite, type: :model do
  context "making an invite object" do
    
    it "instantiates an invite object" do
      invite = Invite.new
      expect(invite).to be_an_instance_of(Invite)
    end

    it "has a guest associated with an invite" do
      user = User.new(id:1)
      invite = Invite.new(guest_id:1)
      expect(invite.guest).to be_an_instance_of(User)
    end
  end
end
