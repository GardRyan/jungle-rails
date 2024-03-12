class Admin::DashboardController < ApplicationController
  def show
    # Retrieve expected username and password from environment variables
    expected_username = ENV['EXPECTED_USERNAME']
    expected_password = ENV['EXPECTED_PASSWORD']

    # Check if the provided username and password match the expected values
    if params[:username] == expected_username && params[:password] == expected_password
      # Authentication successful, render the dashboard
      render 'show'
    else
      # Authentication failed, redirect to the login page with an alert
      redirect_to login_path, alert: "Please log in"
    end
  end
end
