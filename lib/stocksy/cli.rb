# frozen_string_literal: true

require "thor"

# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
class Stocksy::Cli < Thor
  package_name "Stocksy"

  desc "show [SYMBOL]", "Overview of an asset by symbol"
  def show(symbol)
    asset = Stocksy::Asset.new(symbol)

    if asset.name
      say "#{asset.name} (#{asset.symbol})"
      say "#{asset.asset_type} - #{asset.exchange} - #{asset.currency} - #{asset.country}"
      say "#{asset.sector}, #{asset.industry}"
      blank_line
      print_wrapped asset.description
      blank_line
      say "Dividend per share: #{asset.dividend_per_share} #{asset.currency}"
      say "Dividend yield: #{asset.dividend_yield.to_f * 100}%"
      say "Next dividend date: #{asset.dividend_date}"
      say "Previous dividend date: #{asset.ex_dividend_date}"
    else
      say asset.symbol
    end
    blank_line
    say "Profitabilities until #{asset.last_traded_date}:"
    asset.profitability_summary.each do |interval, profitability|
      say "#{interval}: #{profitability}%"
    end
  end

  desc "search [KEYWORDS]", "Search for assets by keywords"
  def search(keywords)
    search = Stocksy::Search.new(keywords)
    print_ordered_options_as_table(search.results, %i[name symbol type region currency])
  end

  desc "login [API KEY]", "Set AlphaVantage API key"
  def login(api_key)
    Stocksy::AlphaVantage::ApiKey.save(api_key)
    say "API key saved into #{Stocksy::AlphaVantage::ApiKey::FILE_PATH}"
  end

  desc "logout", "Delete AlphaVantage API key"
  def logout
    Stocksy::AlphaVantage::ApiKey.delete
    say "API key deleted from #{Stocksy::AlphaVantage::ApiKey::FILE_PATH}"
  end

  desc "version", "Show Stocksy version"
  def version
    say Stocksy::VERSION
  end

  private

  def blank_line
    say "\n"
  end

  def print_ordered_options_as_table(ordered_options, columns)
    table_data = [columns.map { |column| column.to_s.gsub("_", " ").capitalize }]
    ordered_options.each do |option|
      row = columns.map { |column| option[column] }
      table_data << row
    end
    print_table(table_data)
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
