require 'rails_helper'

describe 'As a User' do
  scenario 'when I visit "/" and click on a destination' do
    before do
      @destination = "destination"
    end

    xit 'I should be on page "/destinations/:id"' do
      visit root_path

      click_on(@destination)

      expect(current_path).to eq('/destinations/2')
    end

    xit 'I should see destination information' do
      visit destination_path(@destination)

      expect(page).to have_content(@destination.name)
      expect(page).to have_content(@destination.zipcode)
      expect(page).to have_content(@destination.description)
    end

    xit 'I should see forecast for that destination' do
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
end
