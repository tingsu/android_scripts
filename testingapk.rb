#! /usr/bin/env ruby


   # compile all apps

    # precondition: all apps have been compiled with "ant debug/ant instrument"

    def compileApp(app_dir)

            

        apk_bin_dir = app_dir + "/bin/"

        if not File.exist?(apk_bin_dir)

            puts "E: the app bin directory does not exist: #{apk_bin_dir}"

        end

        entries = Dir.entries(apk_bin_dir)

        entry_activity = ""

        for entry in entries

            if entry.end_with?("-debug.apk") || entry.end_with?("-instrumented.apk")

                entry_activity = entry.split("-")[0]

                break

            end

        end

        #cmd1 = 'cd ..; '

        cmd2 = './bin/analyzeAndroidApk.sh compile ' + app_dir + ' ' + entry_activity

        #cmd = cmd1 + cmd2

        puts "$#{cmd2}"

        system(cmd2)

    end

    appsdir="/home/buka/android-testing/MyAndroidTest/src/AppRepo/dyno-droid-fse13-apps/"
    entries=Dir.entries(appsdir)
       for entry in entries
            # skip the dirs "." and ".."
            if (not entry.eql?(".")) && (not entry.eql?("..")) && (not entry.end_with?("-apks")&&(not entry.end_with?("DS_Store")))
                # get the absolute path of an app
                app_absolute_path = File.expand_path(entry,appsdir)
		
                puts "app_absolute_path: #{app_absolute_path}"
                compileApp(app_absolute_path)
            end
        end



    

   
        


