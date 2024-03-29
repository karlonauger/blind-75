# Enter your code here. Read input from STDIN. Print output to STDOUT

def time_array_to_mins(time_array)
  time_array[0] * 60 + time_array[1]
end

def find_time(intervals, time)
times = []
last_time_i = [00, 00] # Set to first interval start

intervals.each do |interval|
  last_time_s = time_array_to_mins(last_time_i)
  i_start = time_array_to_mins(interval[0])
  i_end = time_array_to_mins(interval[1])

  times << [last_time_i, interval[0]] if i_start - last_time_s > time
    
  last_time_i = interval[1]
end
  
times
end

n, durration = gets.split(" ").map(&:to_i)

intervals = []
n.times do
  intervals << gets.split(" ").map(&:to_i).each_slice(2).to_a
end

intervals.sort_by!{ |interval| time_array_to_mins(interval[0]) }
intervals << [[24, 00], [24, 00]]

times = find_time(intervals, durration)
times[-1][-1][0] = 00 if times[-1][-1][0] == 24
times.each do |interval|
  puts interval.flatten.map{ |num| format('%02d', num) }.join(' ')
end


## AI

def time_to_minutes(hour, minute)
  hour * 60 + minute
end

def minutes_to_time(minutes)
  hour = minutes / 60
  minute = minutes % 60
  hour = 0 if hour == 24  # Convert 24:00 to 00:00
  format('%02d %02d', hour, minute)
end

def find_gaps(slots, k)
  # Add the start of the day and end of the day as bounds
  sorted_slots = [[0, 0]] + slots.sort + [[24 * 60, 24 * 60]]
  available_times = []

  (0...sorted_slots.size - 1).each do |i|
    end_current = sorted_slots[i][1]
    start_next = sorted_slots[i + 1][0]

    if start_next - end_current >= k
      available_times << [minutes_to_time(end_current), minutes_to_time(start_next)]
    end
  end

  available_times
end

# Input
m, k = gets.split.map(&:to_i)
slots = m.times.map do
  start_hour, start_minute, end_hour, end_minute = gets.split.map(&:to_i)
  [time_to_minutes(start_hour, start_minute), time_to_minutes(end_hour, end_minute)]
end

# Find and print available time slots
find_gaps(slots, k).each do |start_time, end_time|
  puts "#{start_time} #{end_time}"
end