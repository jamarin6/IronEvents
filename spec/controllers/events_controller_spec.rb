require 'spec_helper'

describe EventsController do

	describe '#index' do

		it 'display events for today' do
			event = double("event")

			expect(Event).to receive(:for_today).and_return([event])

			get :index

			expect(assigns(:events)).to eq([event])
		end
	end

	it 'display events for today' do
		event = FactoryGirl.create(:event, start_at: Time.now)

		get :index

		expect(assigns(:events)).to eq([event])
	end
end
