# frozen_string_literal: true

require "test_helper"

class TestStocksy < ActiveSupport::TestCase
  test "it has a version number" do
    refute_nil ::Stocksy::VERSION
  end

  test "it does something useful" do
    assert true
  end
end
