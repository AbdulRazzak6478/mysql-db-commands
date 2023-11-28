Linux Fundamentals


```
    REPL ( Read , Evaluate, Print, Loop) Terminal work
    --help                      // Following with the command to know about the command uses
    pwd                         // present working directory
    ls                          // folders and content
    cd folder_name              // to go to directory
    cd ..                       // to get back side , one folder out
    cd ../..                    // two step back
    cd ~                        // to directly come back to home directory
    cd folder1/folder2/folder3  // to specific path relative 0r absolute path
    cd /                        // for root directory , c,d 
    clear
    ls -l
    ls -a                       // hidden folders
    ls -lh                      // size of the file with respect to files
    ls -l                      // size of the file with respect to files
    ls -lg                      // size of the file with respect to files
    ls -a .                    // also show folder staring from .
```

```
    mkdir folder                 // to create folder
    touch readme.md              // to create a blank file
    cat <fileName>              // to print the content of the file
    rm <fileName>              // to remove the file
    rmdir foldername              // to remove the directory , will not deleted it bcoz it is empty
    rm -r subfolder               // delete the folder
    rm -rf subfolder            // to get force fully delete
```


Vim Editor commands
in normal mode
```
    vim <fileName>                  // to create file
    vi <fileName>
    escape+(shift+:)+q!             // to exit without saving the changes
    escape + (shift + :) + wq       // to save and exit

    dd : in normal mode it will delete the line
    gg : cursor come to the start of the file
    G :  cursor come to the end of the file line
    2w or 3w or 4w : it will jump to that number of words
    d2w  : it will delete 2 words
    :s/present_word/updated_word ,ex: :s/why/how
    :%s/how/what   : for find and replace    

    yy : to copy a line
    v  : to paste
    yw : to copy a word
    p : for pasting in normal mode


    tail <fileName>
    tail -n 3 fileName   // last lines
    tail -f <fileName>
    head <fileName>
    head -n 10 <fileName>
    echo "message" => print message on terminal
    echo "message " > file_name

    ls > fileName
    ls | grep DSA  => to search folder
    ps aux  : all process running on the system
    ps aux | grep chrome 
    ps aux | grep mysql 



    // copy file
    cp file1  file2  // file1 copy in file2
    cat file2

    to move file into folder
    mv fileName   ../folder........file.txt
```

To zip and unzip
```
    ex : tar -cf "nameoffile.zip" file1 file2
    tar -cf archive.zip  file1 file2

    // to  unzip
    tar -xvzf archive.zip

    tar xf archive.zip -c extract   // to extract
```