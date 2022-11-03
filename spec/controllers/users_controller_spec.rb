# require 'rails_helper'

# RSpec.describe 'UsersController', type: :controller do
#   # describe "GET /index" do
#   #   pending "add some examples (or delete) #{__FILE__}"
#   # end
#   let(:attributes) do
#     {
#       email: 'test@example.com',
#       password: 'test',
#       first_name: 'Test',
#       last_name: 'TestLast'
#     }
#   end
#   let(:missing_first_name) { attributes.except(:first_name) }
#   let(:invalid_email) { attributes.merge(email: 'wrong.email.example.com') }

#   it 'renders successfully signed up page' do
#     new_user = User.create!(attributes)
#     get :show, id: new_user.id
#     expect(response).to render_template(:show)
#   end

#   describe 'creation' do
#     before { post :create, new_user: attributes }
#     let(:new_user) { User.find_by(first_name: 'Test') }

#     it 'creates a new user' do
#       expect(new_user).to_not be_nil
#     end

#     it "redirects to the new user's show page" do
#       expect(response).to redirect_to(user_path(new_user))
#     end
#   end
# end
