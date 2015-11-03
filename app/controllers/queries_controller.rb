class QueriesController < ApplicationController
  def index
    if @query = params[:query]
      @results = olap_connection.execute(@query)
    end
  end

  private

  def olap_connection
    @olap ||= Rails.application.config.olap_connection.call
  end
end
