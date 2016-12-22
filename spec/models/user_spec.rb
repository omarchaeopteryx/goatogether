require 'rails_helper'

describe User do
  let(:host) {User.create(name: "keith", nickname: "sweet_puppy42")}
  let(:guest) {User.create}
  let(:journey) {Journey.create(name: "bean", hashtag: "#bean", start_time: '2016-12-12 12:12:00 UTC', end_time: '2016-12-25 00:12:00 UTC', user_id: host.id)}
  let(:invite) {Invite.create(journey_id: journey.id, guest_id: guest.id)}

  describe "#name" do
    context "when the user is created" do
      it "belongs to a user" do
        p host
        expect(host.name).to eq "keith"
      end
    end
  end

  describe "#nickname" do
    context "when the user is created" do
      it "has a nickname" do
        expect(host.nickname).to eq "sweet_puppy42"
      end
    end
  end




end
