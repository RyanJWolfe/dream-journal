# frozen_string_literal: true

# Application controller, sets time zone based on signed in user's timezone
class ApplicationController < ActionController::Base
  before_action :set_time_zone, if: :user_signed_in?

  private

  def set_time_zone
    # TODO: setup user model to store time zones
    # Time.zone = current_user.time_zone
  end
end
