require ::File.expand_path('../spam',  __FILE__)
run Spam::App.freeze.app

unless ENV['RACK_ENV'] == 'development'
  require 'tilt/sass' unless File.exist?(File.expand_path('../compiled_assets.json', __FILE__))
  Tilt.finalize!

  begin
    require 'refrigerator'
  rescue LoadError
  else
    Refrigerator.freeze_core
  end
end
