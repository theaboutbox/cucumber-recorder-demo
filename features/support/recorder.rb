Capybara.default_wait_time = 15
require 'headless'

Before do
  if Capybara.current_driver == :selenium
    # Make sure to specify log file paths so we can get error messages in case something goes wrong
    @headless = Headless.new(log_file_path: '/tmp/headless.log', video: {log_file_path: '/tmp/headless_video.log'})
    @headless.start
    @headless.video.start_capture
  end
end

After do |scenario|
  if Capybara.current_driver == :selenium
    if scenario.failed?
      video_dir = ENV['CC_BUILD_ARTIFACTS'] || 'tmp'
      video_file = File.expand_path(File.join(video_dir,scenario.name.split.join('_') + '.mov'))
      @headless.video.stop_and_save(video_file)
    else
      @headless.video.stop_and_discard
    end
  end
end

