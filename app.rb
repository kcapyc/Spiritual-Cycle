# encoding: UTF-8
# Расчет благоприятного дня для магической работы

puts "\nВам нужно указать день, месяц и год вашего рождения."

print "\nВведите день: "
date3 = gets.to_i

print 'Введите месяц: '
date2 = gets.to_i
 
print 'Введите год: '
date1 = gets.to_i

print "\nВведите Y чтобы указать дату: "
param = gets.strip.capitalize

def add_one year, month, date
    return year, month, date+1 if(date < month_days(month,year))
    return year, month+1, 1 if month < 12
    return year+1, 1, 1		
end

def number_of_days y1, m1, d1, y2, m2, d2
    days = 0 
    until [y2, m2, d1] == [y1, m1, d2]
        days += 1
	    y1, m1, d1 = add_one y1, m1, d1
    end
    return days
end

def month_days month, year
    case month
	when 1, 3, 5, 7, 8, 11, 12
	return 31

	when 4, 6, 9, 10 
	return 30

	when 2
	    if is_leap_year year
	        return 29
	    else
	        return 28
	    end
    end
end

def is_leap_year year
    checker = year % 400
    return true if checker == 0
    if checker % 100 != 0 and checker % 4 == 0
        return true
    else
        return false
    end
end

if param == 'Y'

	print "\nВведите день: "
	day = gets.to_i

	print 'Введите месяц: '
	month = gets.to_i
	 
	print 'Введите год: '
	year = gets.to_i

	x = number_of_days date1, date2, date3, year, month, day

else

	require 'date'
	now = Time.now

	x = number_of_days date1, date2, date3, now.year, now.month, now.day

end

y = x - 18

while y > 18
	y = y - 18
end

print "\nСегодня #{y} день вашего духовного цикла."

if y >= 4 && y <= 6 # 4-5-6
	puts ' Это очень благоприятный день для магии.'
elsif y <= 3 # 1-2-3
	puts ' Это благоприятный день для магической работы.'
elsif y >= 7 && y <=8 # 7-8
	puts ' Это благоприятный день для магической работы.'
elsif y == 9 
	puts " Это благоприятный день для магической работы.\nСегодня произойдет переход. Вы можете испытывать некоторые затруднения."
elsif y >= 10 && y < 18
	puts " Это неблагоприятный день для магической работы."
elsif y == 18
	puts " Скоро произойдет переход в другой цикл.\nВы можете испытывать особенные затруднения в магической работе."
end

gets