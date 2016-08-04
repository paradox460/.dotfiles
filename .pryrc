begin
  require 'awesome_print' 
  Pry.config.print = proc { |output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output) }
rescue LoadError => err
  puts "no awesome_print :("
end


# Pry Config stuffs
Pry.config.coolline_paren_matching = true
Pry.config.coolline_matched_paren    = "\e[42m"
Pry.config.coolline_mismatched_paren = "\e[41m"
