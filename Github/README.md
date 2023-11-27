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
    git status  // it tells there are changes that are not currently present in the history of project
    // in order to store ,save, tracked files
    git add <fileName>  // to update what will be committed
    git restore <fileName>
    git commit -m "commit message"
    git log  // to see the histoy of project
```