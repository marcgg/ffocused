require "spec_helper"

describe UserSession do
  specify { UserSession.should be < Authlogic::Session::Base }
end
