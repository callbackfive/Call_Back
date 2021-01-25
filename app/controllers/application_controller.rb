require 'action_text'

class ApplicationController < ActionController::Base
  helper ActionText::Engine.helpers

  ...
end