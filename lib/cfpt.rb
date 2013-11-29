# dependencies
require 'highline/import'
require 'roo'

class CFPT

  def initialize

  end

  def start
    # prompt for and validate input spreadsheet file
    spreadsheet = self.cli.ask("What file do you want to validate? ").strip
    spreadsheet.delete!('\\')
    if !File.file?(spreadsheet)
      puts "Sorry, the input spreadsheet does not exist."
      exit(1)
    end

    # prompt for and validate input directory
    directory = self.cli.ask("What directory do you want to validate? ").strip
    directory.delete!('\\')
    if !File.directory?(directory)
      puts "Sorry, the input directory does not exist."
      exit(1)
    end

    # open and validate the spreadsheet file
    excel = Roo::Spreadsheet.open(spreadsheet) rescue nil
    if excel.nil?
      puts "Sorry, the input spreadsheet could not be read."
      exit(1)
    end

    # pull all the picture values from given spreadsheet
    values = []
    columns = ['V','W','X','Y','Z','AA']
    # TODO - limit to 2-13
    columns.each do |column|
      values.concat(excel.column(column))
    end
    values -= columns

    # iterate matches by +1 for every file that is mentioned in the spreadsheet
    matches = {}
    values.each do |value|
      matches[value] = 1
    end

    # iterate matches by +2 for every file that exists in the directory
    entries = Dir.entries(directory).select{|f| f != "Extras" && !f[/^\..*/]}
    entries.each do |entry|
      value = entry.gsub(/\..*$/,'')
      matches[value] = matches[value].to_i + 2
    end

    #
    # Match Results:
    #   1 - exists in spreadsheet, but not in directory
    #   2 - exists in directory, but not in spreadsheet
    #   3 - successfully matched
    #
    results = {
      directory_extra: [],
      directory_miss:  [],
      matched:         []
    }
    matches.each do |file, result|
      case result
      when 1
        results[:directory_miss] << file
      when 2
        results[:directory_extra] << file
      when 3
        results[:matched] << file
      end
    end

    # output results
    puts "\nResults:"
    puts "#{results[:matched].count} files were properly matched"

    # missing results
    if results[:directory_miss].count > 0
      puts "#{results[:directory_miss].count} files were missing from"\
          " the directory:"
      puts results[:directory_miss].join(", ")
    end

    # extras results
    if results[:directory_extra].count > 0
      puts "#{results[:directory_extra].count} extra files were found in"\
          " the directory:"
      puts results[:directory_extra].join(", ")
      puts "Note: These extra files were moved to an 'Extras' subdirectory."

      extras_path = directory + "/Extras"
      Dir.mkdir(extras_path) rescue nil
      contents = Dir.glob(directory+"/*")
      results[:directory_extra].each do |extra|
        source = contents.select{|f| !!f[Regexp.new(extra)]}.first
        File.rename(source, source.gsub(directory,extras_path))
      end
    end

  end

  protected

    def cli
      @cli ||= ::HighLine.new
    end

end
