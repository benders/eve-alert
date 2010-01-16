class SecureController < ApplicationController
  before_filter :login_required
end