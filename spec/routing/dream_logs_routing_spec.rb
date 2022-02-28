require "rails_helper"

RSpec.describe DreamLogsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/dream_logs").to route_to("dream_logs#index")
    end

    it "routes to #new" do
      expect(get: "/dream_logs/new").to route_to("dream_logs#new")
    end

    it "routes to #show" do
      expect(get: "/dream_logs/1").to route_to("dream_logs#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/dream_logs/1/edit").to route_to("dream_logs#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/dream_logs").to route_to("dream_logs#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/dream_logs/1").to route_to("dream_logs#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/dream_logs/1").to route_to("dream_logs#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/dream_logs/1").to route_to("dream_logs#destroy", id: "1")
    end
  end
end
