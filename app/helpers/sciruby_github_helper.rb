module ScirubyGithubHelper
  def export(dataframe)
    respond_to do |format|
      format.html
      format.csv  { send_data(dataframe.to_csv_string)                         }
      format.xls  { send_data(dataframe.to_excel_string)                       }
      format.json { send_data(dataframe.to_json_string(pretty: true))          }
      # format.rds  { send_data(dataframe.to_rds_string('downloaded.dataframe')) }
    end
  end
end
