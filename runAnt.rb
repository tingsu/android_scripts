#! /usr/bin/env ruby


def quickScan(apps_dir)
    
    
    entries = Dir.entries(apps_dir)
    for entry in entries
        # skip the dirs "." and ".."
        if (not entry.eql?(".")) && (not entry.eql?("..")) && (not entry.end_with?("-apks"))
            # get the absolute path of an app
            app_absolute_path = File.expand_path(entry, apps_dir)
            cmd1 = "cd #{app_absolute_path}; "
            cmd2 = "android update project -t android-16 -p .; "
            cmd3 = "ant clean; ant debug; "
            cmd4 = "ant instrument "
            cmd = cmd1 + cmd2 + cmd3 + cmd4
            puts "$#{cmd}"
            puts "compiling app: #{app_absolute_path}"
            system(cmd)
            
            debug_apk_file = app_absolute_path + "/bin/"
            flag = 0
            if File.exist?(debug_apk_file) then
                files = Dir.entries(debug_apk_file)
                for file in files
                    if file.end_with?("-debug.apk") then
                        flag = flag + 1
                    elsif file.end_with?("-instrumented.apk") then
                        flag = flag + 1
                    end
                end
                if flag == 2 then
                    cmd = "echo #{app_absolute_path} \"debug & instrument is OK\" >> compile.log "
                    system(cmd)
                else
                    cmd = "echo #{app_absolute_path} \"debug & instrument is FAIL\" >> compile.log "
                    system(cmd)
                end
            else
                cmd = "echo #{app_absolute_path} \"debug & instrument is FAIL\" >> compile.log "
                system(cmd)
            end
        end
    end


end

main_apps_dir = ARGV[0]
quickScan(main_apps_dir)
