require 'spec_helper'

describe Event do
	describe 'name' do
		it 'should not be blank' do
			event = Event.new name:nil
			expect(event).to have(1).error_on(:name)
		end

		it 'should not have error when present' do
			event = Event.new name: "hi"
			expect(event).not_to have(1).error_on(:name)
		end

		it 'should not be longer than 60 characters' do
			event = Event.new name: "a"*61
			expect(event).to have(1).error_on(:name)
		end
	end

	describe 'description' do

		 it 'is valid when blank' do
		 	event = Event.new description: ""
		 	expect(event).to have(0).error_on(:description)
		 end

		it 'is not valid when it has less than 100 characters' do
			event = Event.new description: "a"*99
			expect(event).to have(1).error_on(:description)
		end

		it 'es valid when it has 100 characters' do
			event = Event.new description: "a"*99
			expect(event).to have(1).error_on(:description)
		end

	end

	describe 'start_at' do

		it 'is invalid when blank' do
			event = Event.new start_at: nil
			expect(event).to have(1).error_on(:start_at)
		end

		it 'is invalid when start_at is before end date' do
			event = Event.new start_at: '2014-03-15', end_at: '2014-03-14'
			expect(event).to have(1).error_on(:start_at)
		end
	end
end
