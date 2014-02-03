# ------------------------------------------------------
# Naive implementation

# require './enhanced_writer

# writer = EnhancedWriter.new('out.txt')

# writer.write_line('A plain line')

# writer.checksumming_write_line('A line with checksum')
# puts("Checksum is #{writer.check_sum}")

# writer.timestamping_write_line('with time stamp')
# writer.numbering_write_line('with line number')

# ------------------------------------------------------
# Implementation using the Decorator design pattern

require './simple_writer'
require './writer_decorator'
require './numbering_writer'
require './check_summing_writer'
require './time_stamping_writer'

# writer = NumberingWriter.new(SimpleWriter.new('final.txt'))
# writer.write_line('Hello out there')

writer = CheckSummingWriter.new(TimeStampingWriter.new(NumberingWriter.new(SimpleWriter.new('final.txt'))))
writer.write_line('Hey how are you')
puts("checksum: #{writer.check_sum}")
