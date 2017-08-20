class ElectionController < ApplicationController

  layout :resolve_layout

  def data
    @df_stock = Daru::DataFrame.from_html('http://eciresults.nic.in/PartyWiseResult.htm').first
    @df_stock.delete_row(-1)
    data = @df_stock.map_vectors { |x| [x.name, x.to_a.map { |y| y.to_i.to_s==y ? y.to_i : y } ] }.to_h
    new_df = Daru::DataFrame.new('Party' => data['Party'], 'Won' => data['Won'])
    opts = {
      adapter: :googlecharts,
      height: 500,
      width: 1000
    }
    table_opts = {
      adapter: :googlecharts, pageSize: 10,
      height: 300, width: 400
    }
    @df_stock_table     = Daru::View::Table.new(@df_stock, table_opts)
    @df_stock_pie_chart = Daru::View::Plot.new(new_df, type: :pie, **opts)
    @df_stock_col_chart = Daru::View::Plot.new(new_df, type: :histogram, **opts)
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
