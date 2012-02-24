require 'spreadsheet'
require 'spreadsheet/font'
require 'stringio'

module TodosHelper
  def render_excel
    Spreadsheet.client_encoding = 'UTF-8'

    book = Spreadsheet::Workbook.new
    tada = book.create_worksheet :name => 'Ta Da'

    font_rows = Spreadsheet::Font.new("맑은 고딕", {:size=>9})
    font_head = Spreadsheet::Font.new("맑은 고딕", {:size=>9, :weight=>:bold})

    fmtopt_rows = { :border=>true, :border_color=>:grey, :font => font_rows }
    fmtopt_head = fmtopt_rows.merge({ :font=>font_head, :align => :center })
    fmtopt_date = fmtopt_rows.merge({ :number_format => "YYYY-MM-DD" })

    format_head = Spreadsheet::Format.new fmtopt_head
    format_rows = Spreadsheet::Format.new fmtopt_rows
    format_date = Spreadsheet::Format.new fmtopt_date

    tada.row(0).default_format = format_head
    tada.row(0).push "#", "분류", "내용",
      "요청팀", "요청자", "담당자",
      "상태", "시작일", "예정일", "종료일", "노트"

    i = 1
    @todos.each do |t|
      tada.row(i).default_format = format_rows
      tada.row(i).set_format(7,format_date)
      tada.row(i).set_format(8,format_date)
      tada.row(i).set_format(9,format_date)
      tada.row(i).push t.id, t.category, t.description,
        t.request_team, t.request_user, t.owner,
        t.status, t.started, t.due, t.finished, t.note
      i += 1
    end

    tada.column(0).width = 3
    tada.column(2).width = 35
    tada.column(10).width = 35
    tada.column(7).width = 12
    tada.column(8).width = 12
    tada.column(9).width = 12

    io = StringIO.new
    book.write(io)
    io.string
  end
end

# vim: set ts=2 sw=2 expandtab:
