class ApplicationController < ActionController::Base

  def hello
    render html: "Whorup mehn!"
  end
end
