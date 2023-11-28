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

Git start
```
    git init            // to initialized
    rm -rf .git         // to remove .git file
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

    git push -u origin master                  // to push changes to the connection
    git remote rm <nameOfOrigin>                // to delete a remote connection
    git remote rename <oldName> <newName>       // to change connection name


    git pull origin master                    // To revert back the changes from github to local

```

Git checkout
```
    git checkout <fileName>                     // match with last commit file and fit status clean
    git checkout -f                             // matching all previous commit file

    git diff                                    // it will compare working directory to staging area
    git rm --cached <filename>                  // remove from staging area
```

Git branch
```
    git branch                              // to check branches
    git branch -M feature1                      // to create branch
    git checkout feature1                       // to switch branch to feature1
    git merge feature1                          // to merge branch , go to the main branch and merge
    git checkout -b <branchName>                // to create and directly switch to that branch 
```

Git github commands
```
    git clone Github_URl                          // to clone the project 
```

Git starter
`git status`
Three areas
- Working area
- staged area
- repository area

Working area :
- It is not track by git
- untracked files
- there can be a bunch of files that are no currently handled by git.
- It means that changes done or to be done in those files are not managed by git yet.
- a file which is in working area is considered to be not in the staging area, when we do `git status` and we see a bunch of `untracked files`.


Stage Area :
- What all files are going to be part of the next version that will create
- this staging area is the place where git knows what changes will be done from the last version to the next version.
```
    git add <file_name>                     // to add file in stage area that to be commit or create new version
    git add .                                // for all files to stage area
    git rm --cached <fileName>              // to unstaged the file ( for new added file , not for committed file)
```


Repository Area :
- This area actually contains the details of all you previous registered version, and the files in this area.
- git already manages them and knows their version history.
- `commit ` : It is a particular version of the project, it captured a snapshot of the project's staged changes and creates a version out of it.

```
    git commit          // it opens Vim editor to write message -> press "i" to enable to write message , for save :[ escape ->:wq]
    git log             // to see all commits  , to exit log :press -> q
    git restore <fileName>  // it will discard everything that are in stagging area but not committed yet.
    git restore --staged <fileName>    // to unstage the files
    // in already committed file changes are there in working directory

    git add <fileName>          // to add in stagging area
    // the back on the stagging area
    // to get back on working directory   "git restore --staged <fileName>"
```


Between rm and restore
- If we want to move the whole file back to the untracked state .then we do `git rm <fileName>`.
- Otherwise if we just want the changes to be moved in working area or staging area then we `git restore <fileName>`.
- `git diff commit_id1 commit_id2 ` 


# How internally git works
hashing -> graph/tree data structure

- git is like key value pair
- `key`: hash of the data  (security hash algorithm) 
- `value`:data
- git uses a cryptographic hash function -> SHA1
-  for a given data it outputs 40 digits Hexadecimal number, the hash value is always same for same data.
- after prepared the hash , git compresses the data in a `blob` and stores some meta data about data.
- |blob   | <size>      |
- |\0     | delimeter   |
- |content|             |
```
    git init
    ls -a
    tree .git   (structure)
    find .git/objects               // to get details of the objects
    find .git/objects -type f
    echo 'test content' | git hash-object -w --stdin   // to get hash id

    git cat-file -p <hashId>
```