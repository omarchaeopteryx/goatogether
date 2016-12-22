require 'rails_helper'

describe Invite do
  let(:host) {User.create}
  let(:guest) {User.create}
  let(:journey) {Journey.create(name: "bean", hashtag: "#bean", start_time: '2016-12-12 12:12:00 UTC', end_time: '2016-12-25 00:12:00 UTC', user_id: host.id)}
  let(:invite) {Invite.create(journey_id: journey.id, guest_id: guest.id)}

  describe "#journey" do
    context "when the invite is created" do
      it "belongs to a journey" do
        p journey
        expect(invite.journey.id).to eq journey.id
      end
    end
  end

  describe "#guest" do
    context "when the invite is created" do
      it "belongs to a guest" do
        p guest
        expect(invite.guest.id).to eq guest.id
      end
    end
  end


end
