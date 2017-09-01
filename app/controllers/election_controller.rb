class ElectionController < ApplicationController

  layout :resolve_layout

  def data
    @elections = Daru::DataFrame
      .read_html('http://eciresults.nic.in/PartyWiseResult.htm').first
      .tap { |df| df.delete_row(-1) }
      .recode_vectors { |v| v.name == 'Party' ? v : v.recode(&:to_i) }
  end

  private

  def resolve_layout
   case action_name
     when 'data'
      # setting the library is not needed, if you are parsing the
      # `adapter` option in plot or table.
      # Daru::View.plotting_library = :highcharts
      "googlecharts_layout"
     # when "googlecharts"
     #  Daru::View.plotting_library = :googlecharts
     #  "googlecharts_layout"
     # when "datatables"
     #  "datatables_layout"
     else
      Daru::View.plotting_library = :nyaplot
      "application"
     end
  end
end
