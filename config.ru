require File.join(File.dirname(__FILE__), 'app')
puts $asset

map "/assets" do
  run $assets
end

map "/" do
  run lambda {|env| 
    [
      200,
      {
        'Content-type' => 'text/html',
        'Cache-Control' => 'public, max-age=86400'
      },
      File.open(File.join(File.dirname(__FILE__), 'development', 'popup.html'), File::RDONLY)
    ]
  }
end
