# frozen_string_literal: true

module Stocksy::Asset::Overview
  extend ActiveSupport::Concern

  included do
    delegate :name, :asset_type, :description, :exchange, :currency, :country, :sector, :industry,
             :dividend_per_share, :dividend_yield, :dividend_date, :ex_dividend_date, to: :overview
  end

  def overview
    @overview ||= Stocksy::AlphaVantage.overview(symbol)
  end
end
