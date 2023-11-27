Git Commands

Git configurations
```
    git --version  // to check version

    // To Set name or Email
    git config --global user.name "Your Name Here"
    git config --global user.email "Your email Here"


    // To Check name or Email
    git config --global user.name 
    git config --global user.email


    // To Change or Edit name or Email
    git config --global --edit 
    // then go to file and edit

    // To see the detail configurations
    git config --list
```

Git basic commands
```
    ls -a
    git status                          // it tells there are changes that are not currently present in the history of project
                                        // in order to store ,save, tracked files
    git add <fileName>                  // to update what will be committed
    git restore <fileName>              // to discard changes in working directory
    git commit -m "commit message"
    git log                             // to see the histoy of project
    rm -rf <fileName>                   // to delete the file
    git reset <commit_id>               // It will remove all the update or commits of above it
```

Git stash commands
```
    git stash <file>                    // to store files or changes in stage
    git stash pop                       // it will pop out the files from stash
    git stash clear                     // it will clear the file those are not committed are gone permanently
```

Git remote commands
```
    git remote                              // to check all origin URLs
    git remote add origin Github_URL        // to add Url Origin
    git remote remove <origin_name>         // to remove added origin from the folder
    git remote -v                            // it will show all the URL attached to the folder or connected to particular folder
    git remote set-url origin <updated_URL>     // to change URL

```

Git checkout
```
    git checkout <fileName>                     // match with last commit file and fit status clean
    git checkout -f                             // matching all previous commit file

    git diff                                    // it will compare working directory to staging area
    git rm --cached <filename>                  // remove from staging area
```

