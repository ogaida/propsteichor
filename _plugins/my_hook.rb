Jekyll::Hooks.register :site, :post_write do |site|
  file = "#{Dir.pwd}/release.txt"
  puts "from hook-script: the site has been built!"
  if File.exists? file 
    puts "release requested"
    File.unlink file
    cmd = "cd #{Dir.pwd};jekyll build --source ./ --destination ../prod/"
    `#{cmd}`
    puts "update git repository"
    cmd = "git add *; git commit -m 'release #{Time.now.strftime("%Y-%m-%d-%T")}'; git push origin main; cd -"
    `#{cmd}`
  end
end
