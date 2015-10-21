#! /usr/bin/env ruby


   # compile all apps

    # precondition: all apps have been compiled with "ant debug/ant instrument"

    def runApp(appsapkdir)

 
        entries = Dir.entries(appsapkdir)


        for entry in entries

            if entry.end_with?("-instrumented.apk")

                instrumented_apk_absolute_path = File.expand_path(entry,appsapkdir)
		
                puts "instrumented_apk_absolute_path: #{instrumented_apk_absolute_path}"

                break

            end

        end


        #cmd1 = 'ruby ./bin/rec.rb '

        cmd2 = 'ruby ./bin/rec.rb '+instrumented_apk_absolute_path+' --avd testAVD_1 --dev 7C5919B06880 --no-rec -loop --mode Monkey'

        #cmd = cmd1 + cmd2

        puts "$#{cmd2}"

        system(cmd2)
	
	count=0
	
	while (not File.exist?("coverage.txt"))&&count<=10 do
		system(cmd2)
		count=count+1
		
	end
	if not File.exist?("coverage.txt") then
		File.open("dumpcovfail.log",'w')do |f|
                f.puts instrumented_apk_absolute_path
            end	
	end


    end

    appsdir="/home/buka/android-testing/MyAndroidTest/src/AppRepo/dyno-droid-fse13-apps/"
    entries=Dir.entries(appsdir)
       for entry in entries
            # skip the dirs "." and ".."
            if (not entry.eql?(".")) && (not entry.eql?("..")) && (entry.end_with?("-apks")&&(not entry.end_with?("DS_Store")))
                # get the absolute path of an app
                app_absolute_path = File.expand_path(entry,appsdir)
		
                puts "app_absolute_path: #{app_absolute_path}"
                runApp(app_absolute_path)
            end
        end



    

   
        


