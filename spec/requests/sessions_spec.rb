require 'spec_helper'

describe "Sessions: " do

  before do
    @user = User.new(first_name: "Bruce", last_name: "Wayne", email: "notbatman@gotham.com", city: "Gotham", state: "Noidea", password: "foosbars", password_confirmation: "foosbars")
    @user.save
  end  

  describe "creating a session" do
    
    describe "when input is invalid" do
      before do
        request_payload = {
          session: {
            email: " ",
            password: " "
          }
        }

        post "/signin", request_payload
      end

      it "should return a failure message" do
        response.body.should include('false');
      end       
    end

    describe "when input is valid" do
      before do
        request_payload = {
          session: {
            email: "notbatman@gotham.com",
            password: "foosbars"
          }
        }

        post "/signin", request_payload
      end  

      it "should return user data" do
        response.body.should include('Bruce');
        response.body.should include('Wayne');
        response.body.should include('notbatman@gotham.com');
      end 

      describe "during sign out" do
        
        describe "with valid remember token" do
          before do
            request_payload = {
              session: {
                remember_token: @user.remember_token
              }
            }
 
            delete "/signout", request_payload
          end

          it "should allow sign out" do
            response.body.should include("true")
          end
        end

        describe "with invalid remember token" do
          before do
            request_payload = {
              session: {
                remember_token: " "
              }
            }
 
            delete "/signout", request_payload
          end

          it "should allow not sign out" do
            response.body.should include("false")
          end
        end

      end    
    
    end
  end

end
