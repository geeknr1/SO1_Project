echo "Advanced Backup For Files"
echo "-------------------------- Menu --------------------------"
echo "1)    Find all of the files that are older than a specified calenderistic date (in other words, introduced from STDIN)"
echo "2)    Moving files, either locally or in cloud"
echo "3)    Deleting files periodically (the ones older than 60 days, every monday, at 8:00 PM, from a selected path)"
echo "4)    Configuration options: deleting files, renaming files, editing files, adding 4 more options (to be updated), adding options for '--help', '--usage', 'debugging mode'"
echo "-----------------------------------------------------------"

select option in "Find old files" "Moving files locally" "Moving files in cloud" "Deleting certain files" "Delete selected file" "Rename selected file" "Edit files from a selected folder" "Configuration options"; do
    case $option in
        "Find old files")
            echo "1) To be updated"
            ;;

        "Moving files locally")
            read -rp "Source path: " src;
            read -rp "Destination path: " destination;
            
            if [[ -z "$src" || -z "$destination" ]]; then
                echo "Error [Path doesn't exist]" 2> error.txt
            fi

            mv $src $destination
            ;;

        "Moving files in cloud")
            read -rp "Source path: " src2;
            if [-z "$src2"]; then
                echo "Error [Path doesn't exist]" 2> error.txt
            fi

            git add $src2
            git commit -m "File moved in cloud"
            git push -u origin main
            ;;

        "Deleting certain files")
            read -rp "Selected path: " path
            find $path -type f -mtime +60 -exec rm -f {} \;
            ;;

        "Delete selected file")
            echo "To be updated"
            ;;

        "Rename selected file")
            read -rp "Selected path: " path2
            for file in "$path2"/*; do
                mv $file "$file".old
            done 
            ;;

        "Edit files from a selected folder")
            read -rp "Selected path: " path2
            for file in "$path2"/*; do
                echo "####Deprecated####" > $file
            done 
            ;;

        "Configuration options")
            echo "4) To be updated"
            ;;

        *)
            echo "Invalid option"
            break;
            ;;
    esac
done