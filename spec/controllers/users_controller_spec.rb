require 'spec_helper'

describe UsersController do
  render_views
 
  describe "creating a user" do

    describe "when input is valid" do
      before do
        request_payload = {
          user: {
            first_name: "Bruce",
            last_name: "Wayne",
            email: "notbatman@gotham.com",
            city: "Gotham",
            state: "Noidea",
            password: "foosbars",
            password_confirmation: "foosbars"
          }
        }

        post "create", request_payload
      end

      it "should return a failure message" do
        response.body.should include('true');
      end      
    end

    describe "when input is invalid" do
      before do
        request_payload = {
          user: {
            first_name: "Bruce",
            last_name: "Wayne",
            email: "notbatmangotham.com",
            city: "Gotham",
            state: "Noidea",
            password: "foosbars",
            password_confirmation: "foobars"
          }
        }

        post "create", request_payload
      end

      it "should return a failure message" do
        response.body.should include('false');
      end      
    end

  end  

end
