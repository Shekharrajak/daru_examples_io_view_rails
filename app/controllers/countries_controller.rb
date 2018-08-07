class CountriesController < ApplicationController
  def data_countries
    # getting data from url : http://countryapi.gear.host/v1/Country/getCountries
    url = 'http://countryapi.gear.host/v1/Country/getCountries'
    complex_read_instance = Daru::IO::Importers::JSON.read(url)
    @countries_df = complex_read_instance.call(
      Country: "$..Response..Name",
      NumericCode: "$..Response..NumericCode",
      Area: "$..Response..Area"
    )
  end
end
