def find_NPS args
  total = 0
  args.each{ |i|
    case i
    when 9..10
      total += 1
    when 7..8
      total += 0
    else
      total -= 1
    end
  }
  return (total / args.length) * 100
end

puts find_NPS [9]
