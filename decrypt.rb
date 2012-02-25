#coding : utf-8

def ecrypt(input)
output = ''
input.each_char{|ch|
code = ch.ord * 2
if code > 127
code -= 127
end
output += code.chr
}
output
end

def decrypt(input)
output = ''
input.each_char{|ch|
code = ch.ord
if code % 2 == 0
code = code / 2
else
code = (code + 127) / 2
end
output += code.chr
}
output
end

def get_the_file_name
puts 'please input the file name:'
file_name = gets.chomp
if (file_name.length <= 0)
file_name = get_the_file_name
end
file_name
end

def get_the_option
puts "please select:\n 1=ecrypt \n 2=decrypt"
option = gets.chomp
if(option != "1" and option != "2")
option = get_the_option
end
option
end


file_name = get_the_file_name
option = get_the_option


str = IO.read(file_name)

if(option == "1")
output = ecrypt(str)
else
output = decrypt(str)
end
now_string = Time.now.strftime("%Y%m%d%H%M%S")
output_file_name = file_name + "_#{now_string}_.xml"

f = File.new(output_file_name ,"w")
f.write(output)

puts "Complete! The new file name is '#{output_file_name}'"

