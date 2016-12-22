require 'rails_helper'

RSpec.describe Invite, type: :model do
  context "making an invite object" do

    it "instantiates an invite object" do
      invite = Invite.new
      expect(invite).to be_an_instance_of(Invite)
    end


  end
end
