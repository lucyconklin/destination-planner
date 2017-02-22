require 'rails_helper'

describe 'As a User when I visit "/" and click on a destination' do
  before do
    @destination = Destination.create(name: 'Denver', zip: '80210', description: 'Mile High City', image_url: "/")
  end
  it 'I should be on page "/destinations/:id"' do
    visit root_path

    # click_link(destination_path(@destination.id))
    click_on('Show')

    expect(current_path).to eq("/destinations/#{@destination.id}")
  end

  it 'I should see destination information' do
    visit destination_path(@destination)

    expect(page).to have_content(@destination.name)
    expect(page).to have_content(@destination.zip)
    expect(page).to have_content(@destination.description)
  end

  it 'I should see forecast for that destination' do
    visit destination_path(@destination)

    expect(page).to have_content('10 day weather forecast')
    expect(page).to have_selector('.day', count: 10)
    within first('.day') do
      expect(page).to have_content('weekday')
      expect(page).to have_content('month')
      expect(page).to have_content('day')
      expect(page).to have_content('high temp')
      expect(page).to have_content('low temp')
      expect(page).to have_content('weather conditions')
    end
  end
end
