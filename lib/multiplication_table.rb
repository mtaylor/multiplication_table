class MultiplicationTable
  attr_accessor :row_values, :column_values

  def initialize(row_values, column_values)
    self.row_values = row_values
    self.column_values = column_values
  end

  # Sort the row and column array, simply for making the table more readible 
  # and to simplify printing
  def row_values=(row_values)
    @row_values = row_values.sort
  end

  def column_values=(column_values)
    @column_values = column_values.sort
  end
  
  # Calculates the multiplication table
  def calculate_table
    @column_values.collect {|y| calculate_table_row(y)}
  end

  # Calculates a table row multiplied against a single value
  def calculate_table_row(value)
    @row_values.collect {|x| x * value}
  end

  # pretty print the table
  def print
    table = calculate_table

    # A few vars for pretty printing
    cell_width = 5 + (table.last.last.to_s.length)
    row_width = cell_width * (@row_values.length + 1)

    # Print the first cell
    print_cell("x |", cell_width)

    # Print the Column Headings
    @row_values.each { |x| print_cell(x, cell_width) }
    puts "\n" + ("-" * row_width)
    
    # Print Rows
    table.each_index do |i|
      # Row Heading
      print_cell("#{@column_values[i]} |", cell_width)

      # Row Content
      table[i].each { |x| print_cell(x, cell_width) }
      puts "\n"
    end
  end

  private

  # Prints value in a table cell with a given width
  def print_cell(value, width)
    printf("%-#{width}s", value)
  end
end
