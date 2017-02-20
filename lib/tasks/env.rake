namespace :env do

  # Adds any missing keys that are in .env to the production (heroku) ENV,
  # if the key already exists it will overwrite the existing value. This
  # will not remove any missing keys, do that with `heroku config:unset KEY`
  task :set do
    confirm_token = "OVERWRITE"
    STDOUT.puts "This will either add or overwrite whatever keys are in .env to the production ENV. \n" +
      "If you're sure you want to do this then type #{confirm_token} to continue..."
    raise "Aborting. You entered #{input}" unless STDIN.gets.chomp.upcase == confirm_token

    `heroku config:add $(cat .env | xargs)`
  end

end
