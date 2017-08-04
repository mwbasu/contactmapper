module Api
	module V1
		class ContactsController < ApplicationController
			def index
				contacts = Contact.order('id DESC');
				render json: {status: 'SUCCESS', message:'Loaded contacts', data:contacts},status: :ok
			end
			def show
				contact=Contact.find(params[:id])
				render json: {status: 'SUCCESS', message:'Loaded contact', data:contact},status: :ok
			end
			def create
				contact=Contact.new(add_contact)
				if contact.save
					render json: {status: 'SAVE SUCCESS', message:'Saved contact', data:contact},status: :ok
				else
					render json: {status: 'SAVE UNSUCCESS', message:'Unsaved contact', data:contact.errors},status: :unprocessable_entity
				end
			end
			def destroy
				contact=Contact.find(params[:id])
				contact.destroy
				render json: {status: 'DELETE SUCCESS', message:'Deleted contact', data:contact},status: :ok
			end
			def update
				contact=Contact.find(params[:id])
				if contact.update_attributes(add_contact)
					render json: {status: 'UPDATE SUCCESS', message:'Updated contact', data:contact},status: :ok
				else
					render json: {status: 'UPDATE UNSUCCESS', message:'Un-updated contact', data:contact.errors},status: :unprocessable_entity
				end
			end

			private
			def add_contact
				params.permit(:name, :number)
			end
		end
	end
end