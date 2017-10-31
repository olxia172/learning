def queue_time(clients_queue, num_of_cash_registers)
  time = 0
  cash_registers = []
  cash_registers_index = 0

  while cash_registers_index < num_of_cash_registers
    cash_registers << clients_queue.shift
    cash_registers_index += 1
  end

  until cash_registers.empty?
    until cash_registers.include?(0)
      cash_registers.map! { |elem| elem - 1}
      time += 1
    end

    cash_registers.reject! { |elem| elem == 0 }

    unless clients_queue.empty?
      cash_registers << clients_queue.shift
    end
  end

  time
end


puts queue_time([5, 3, 4], 1)
puts queue_time([10, 2, 3, 3], 2)
puts queue_time([2, 3, 10], 2)
puts queue_time([7, 4, 5, 8, 2, 4], 3)
puts queue_time([7, 4, 5, 8, 2, 4], 4)
