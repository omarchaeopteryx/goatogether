module JourneysHelper
  def upcoming_journeys
    @journeys.select{|journey| journey.start_time > Time.zone.now }
  end

  def previous_journeys
    @journeys.select{|journey| journey.start_time < Time.zone.now }
  end
end
