# frozen_string_literal: true

module Stocksy::AlphaVantage::ApiKey
  extend self
  FILE_PATH = File.join(Dir.home, ".stocksy")

  def fetch
    api_key = ENV.fetch("ALPHA_VANTAGE_API_KEY") do
      ENV["ALPHA_VANTAGE_API_KEY"] = retrieve_api_key_from_file
    end
    api_key || raise(Stocksy::Error, "No API key found")
  end

  def save(api_key)
    File.write(FILE_PATH, api_key)
  end

  def delete
    return unless File.exist?(FILE_PATH)

    File.delete(FILE_PATH)
  end

  private

  def retrieve_api_key_from_file
    return unless File.exist? FILE_PATH

    api_key = File.read(FILE_PATH).strip
    return api_key unless api_key.empty?
  end
end
