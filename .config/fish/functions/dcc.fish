function dcc --description "Run docker-compose commands for informed"
  command docker-compose -f ~/Developer/informed/docker/docker-compose.yml $argv
end
