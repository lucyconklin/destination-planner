require 'rails_helper'

describe 'Weather API' do
  before do
    @destination = Destination.create(name: "Rome",
                                      zip: "8000",
                                      description: "when in Rome...",
                                      image_url: "/")
    @destination2 = Destination.create(name: "Florence",
                                      zip: "8000",
                                      description: "some other description",
                                      image_url: "/")
  end
  it 'can return one destination' do
    get "/destinations/#{@destination.id}.json"

    destination = JSON.parse(response.body)

    expect(destination["name"]).to eq("Rome")
    expect(destination["zip"]).to eq("8000")
    expect(destination["description"]).to eq("when in Rome...")
    expect(destination["image_url"]).to eq("/")
  end

  it 'can return all destinations'do
    get "/destinations.json"

    destinations = JSON.parse(response.body)
    destination = destinations.first

    expect(destinations.count).to eq(2)
    expect(destination).to have_key("name")
    expect(destination).to have_key("zip")
    expect(destination).to have_key("description")
    expect(destination).to have_key("image_url")
  end

  it 'can create a destination' do
    post "/destinations.json", destination: { name: "Denver",
                                              zip: "8000",
                                              description: "Mile High City",
                                              image_url: "/" }

    expect(Destination.count).to eq(3)
  end

  it 'can edit a destination' do
    put "/destinations/#{@destination.id}.json", destination: { name: "Twin Falls",
                                              zip: "9000",
                                              description: "it's in Idaho",
                                              image_url: "/" }
    @destination.reload

    expect(Destination.count).to eq(2)
    expect(@destination.name).to eq("Twin Falls")
    expect(@destination.zip).to eq("9000")
    expect(@destination.description).to eq("it's in Idaho")
    expect(@destination.image_url).to eq("/")
  end

  it 'can delete a destination' do
    delete "/destinations/#{@destination.id}.json"

    expect(Destination.count).to eq(1)
  end
end
