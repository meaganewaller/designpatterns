require './report'

require './html_formatter'
require './plain_text_formatter'

report = Report.new(HTMLFormatter.new)
report.output_report

# Change the formatter at runtime
report.formatter = PlainTextFormatter.new
report.output_report
