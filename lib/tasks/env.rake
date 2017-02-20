namespace :env do

  task :set do
    confirm_token = "OVERWRITE"
    STDOUT.puts "This will either add or overwrite whatever keys are in .env to the production ENV. \n" +
      "If you're sure you want to do this then type #{confirm_token} to continue..."
    input = STDIN.gets.chomp
    raise "Aborting. You entered #{input}" unless input == confirm_token

    `heroku config:add $(cat .env | xargs)`
  end

end
