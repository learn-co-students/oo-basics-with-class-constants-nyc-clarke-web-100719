require 'colorize'
# require 'awesome_print'
# require 'pry'
# require 'json'

# require 'neatjson'
# json = JSON.neat_generate( value, options )

$loop = 1
$temp_loop = 0
$debug_state = false
$msg_state = false

def debug_off
  $debug_state = true
end

def msg_off
  $msg_state = true
end

def init
  $all_state = true

  if $loop > $temp_loop
    header
    $temp_loop = $loop
  end
end

def debug(val, &b)

  if $debug_state || $all_state
    val_name = val
    new_val = eval(val.to_s, b.binding)
    val_class = new_val.class

    special = "?<>',?[]}{=-)(*&^%$#`~{}"
    regex = /[#{special.gsub(/./) { |char| "\\#{char}" }}]/

    if val_name == new_val || val_name =~ regex
      val_name = val_class
    end

    puts " " * 2 + "#{val_class}" + " " * 4 + "#{val_name} = #{new_val}"
    puts "\n"
  end

end

# def msg(string)
#   puts " " * 2 + "MSG" + " " * 5 + "#{string}"
# end
# end

def msg(string)
  if $debug_state || $all_state
    puts " " * 2 + "MSG" + " " * 5 + "#{string}"
  end
end

def anchor
  # puts "ANCHOR WAS CALLED"
  $loop += 1
end

def header
  space = $loop.to_s

  loop_num = ordinal($loop)

  puts "\n\n"
  puts ("/" + "*" * 79).colorize(:light_blue)
  puts "*".colorize(:light_blue) + " #{loop_num} LOOP " + "|".colorize(:light_blue)
  puts ("**********" + "*" * space.length + "/").colorize(:light_blue)
  puts "\n"

  puts " " * 2 + "Type" + " " * 4 + "Value"
  puts " " * 2 + "----" + " " * 4 + "-----"
  # puts "\n"
end

def footer
  puts "\n"
  puts "*" * 79 + "/"
  puts "\n"
end

def ordinal(n)
  ending = case n % 100
           when 11, 12, 13 then
             'th'
           else
             case n % 10
             when 1 then
               'ST'
             when 2 then
               'ND'
             when 3 then
               'RD'
             else
               'TH'
             end
           end

  "#{n}#{ending}"
end


# def debug(val, &b)
#
#     # if loop == 0
#     #   puts ("=" * 50 + '\n').colorize(:blue)
#     #   puts ("||| LOOP #{$loop} \n").colorize(:red)
#
#     header
#
#     # puts ("#{val_name} is #{val}").colorize(:yellow)
#
#     # puts ("#{val} is #{val}").colorize(:yellow)
#
#     # puts " " * 2 + "- #{val} = #{eval(val.to_s, b.binding)}"
#
#     val_name = val
#     val = eval(val.to_s, b.binding)
#
#
#
#     # final_val = pp temp_val
#
#     puts " " * 2 + "#{val.class} #{val_name} = #{val}"
#
#
#     footer
#     # puts ("=" * 50 + '\n').colorize(:green)
#     # end
#
# end
