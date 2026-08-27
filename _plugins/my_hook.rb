Jekyll::Hooks.register :site, :post_write do |site|
  file = "#{Dir.pwd}/release.txt"
  puts "from hook-script: the site has been built!"
  if File.exists? file 
    puts "release requested"
    File.unlink file
    cmd = "cd #{Dir.pwd};jekyll build --source ./ --destination ../prod/;cd -"
    `#{cmd}`
  end
end
