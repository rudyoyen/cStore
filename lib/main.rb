require_relative 'config'
require_relative 'app'

app = App.new(Config::INPUT_FILE_NAME, Config::OUTPUT_FILE_NAME)

app.start