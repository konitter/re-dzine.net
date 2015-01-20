http_path = "../"
css_dir = "static/css"
sass_dir = "sass"
images_dir = "static/img"
javascripts_dir = "static/js"

line_comments = false
cache = false

preferred_syntax = :sass
asset_cache_buster :none

# sass_options = { :debug_info => true }
# environment = :development
# output_style = (environment == :production) ? :compressed : :expanded

output_style = :expanded
on_stylesheet_saved do |filename|
	if File.exists?(filename)
		minifyFile = filename.gsub('.css', '.min.css')
		FileUtils.cp filename, minifyFile
		file = File.read minifyFile
		colon = ':'
		semicolon = ';'
		comma = ','
		open_brace = ' {'
		close_brace = '}'
		file.gsub!(/\n/,' ')
		file.gsub!(/\/\*.*?\*\//m,'')
		file.gsub!(/\s*:\s*/,colon)
		file.gsub!(/\s*;\s*/,semicolon)
		file.gsub!(/\s*,\s*/,comma)
		file.gsub!(/\s*\{\s*/,open_brace)
		file.gsub!(/\s*\}\s*/,close_brace)
		file.gsub!(/\s\s+/,' ')
		File.open(minifyFile, 'w+') do |f|
			f << file
		end
	end
end
