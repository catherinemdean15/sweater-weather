require 'rails_helper'

RSpec.describe Direction do
  it 'exists' do
    data = { route: { hasTollRoad: false,
                      hasBridge: true,
                      boundingBox: { lr: { lng: -80.139053, lat: 25.774994 },
                                     ul: { lng: -80.199677, lat: 26.011757 } },
                      distance: 19.709,
                      hasTimedRestriction: false,
                      hasTunnel: false,
                      hasHighway: true,
                      computedWaypoints: [],
                      routeError: { errorCode: -400, message: '' },
                      formattedTime: '00:25:45',
                      sessionId: '60465b35-034b-5f21-02b4-3500-0a439d50b801',
                      hasAccessRestriction: false,
                      realTime: 1714,
                      hasSeasonalClosure: false,
                      hasCountryCross: false,
                      fuelUsed: 0.89,
                      legs: [{ hasTollRoad: false,
                               hasBridge: true,
                               destNarrative: 'Proceed to HOLLYWOOD, FL.',
                               distance: 19.709,
                               hasTimedRestriction: false,
                               hasTunnel: false }] } }

    directions = Direction.new(data)
    expect(directions).to be_a(Direction)
    expect(directions).to have_attributes(travel_time: '00 hours, 28 minutes')
  end
end
