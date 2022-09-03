# Write simple Hello World String to file from Ruby and make sure the file is closed.
begin
    file = File.open("/app/secret/HelloAgain.txt", "w")
    file.write("Hello SGX World from Ruby! \n") 
  rescue IOError => e
    puts "Error - hmr...  seems so I'm not allowd to wirte the file :-( ..."
  ensure
    file.close unless file.nil?
  end

  puts "Year I am done ... check the file ;-)"