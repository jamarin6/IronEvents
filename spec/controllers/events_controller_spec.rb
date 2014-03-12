require 'spec_helper'

describe EventsController do

	describe '#index' do

		#it 'display events for today' do
		#	event = double("event")
#
		#	expect(Event).to receive(:for_today).and_return([event])
#
		#	get :index

		#	expect(assigns(:events)).to eq([event])
		#end
	

	#it 'display events for today' do
	#	event = FactoryGirl.create(:event, start_at: Time.now)
#
	#	get :index
#
	#	expect(assigns(:events)).to eq([event])
	#end

	it 'display events for today' do
		event = FactoryGirl.create(:event, start_at: Time.now)

		expect(Event).to receive(:for_today).and_call_original
		# dime si recives el metodo for today y llama al original (lo ejecutas)

		get :index

		expect(assigns(:events)).to eq([event])
	end

  end

  describe '#create' do

  	 it 'create a new event1' do
  		attrs = {
  			name: 'my_event1',
  			description: 'a'*150,
  			start_at: Time.now,
  			end_at: 1.day.from_now,
  			address: 'calle pepito 6'
  		}   #attrs = FactoryGirl.attributes_for(:event)
  		expect {post :create, event: attrs }.to change(Event, :count)# .by(2) es xa q se creasen 2

  		#expect(response).to redirect_to(assigns (:event))
  		# expect(response).to redirect_to(event_url)
  	 end

  	# it 'renders the form when invalid' do
  	# 	post :create, event: { name: 'hola'} # erroneo xq debe llevar fechas
#
  	# 	expect(response).to render_template(:new)
  	# end
  end

  describe '#new' do

  	it 'create a new Empty Event' do
  		get :new
  		expect(assigns(:event)).to be_a_new(Event)
  	end
  end

end
