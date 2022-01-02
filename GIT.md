### Setup

```

git config --global user.name "XXX"		# Full name

git config --global user.email "XXX"	# Email

git config --global github.user XXX		# Username

git config --global github.token XXX	# Token

```

### New rep

```

git init

touch README

git add README

git commit -m 'first commit'

git remote add origin git@github.com:XXX/YYY.git	# user / repo name

git push origin master

```

### Existing rep

```

git remote set-url origin git@github.com:XXX/YYY.git	# user / repo name

git push -u origin master

```

### Changes

```

git pull				# if it has been changed from other computer

git pull origin master 	# or this

git status				# View changes to commit

git add -A				# Add new files and remove removed files

git commit -a -m 'XXX'	# commit message, include -a if a file have been modified

git push				# upload/submit

```

### Conflict

```

git mergetool

```

### Branch

```

git branch 				# list all branch (local)

git branch -a 			# list all branch (remote and local)

git branch XXX			# create branch

git branch -d XXX		# delete local

git push origin :XXX	# delete remote

git checkout XXX		# switch branch

git checkout -b XXX YYY	# Download Remote (YYY) to local (XXX)

```

### Rename branch

```

git branch YYY/XXX	# new name (YYY), old name (XXX) 

git push origin YYY

git push origin :XXX

```

### Tags

```

git tag -a v1.0 -m 'message'

git push origin master --tags	# push tags

git tag -d v1.0					# delete local

git push origin :refs/tags/v1.0 # delete remote

```

### Fork

```

git clone git@github.com:XXX/YYY.git	# user / repo name

git push origin master

```

### Pull request (Complete)

```

git checkout -b XXX master	# Temp branch (XXX)

git pull YYY XXX 			# Temp branch (XXX), Remote address (YYY)

git checkout master

git merge XXX

git push origin master

```

### Pull request (Partial)

```

git remote add XXX YYY  # Temp name (XXX), Remote address (YYY)

git fetch XXX 			# Temp name (XXX)

# Delete any extra tag from git fetch

git log XXX/ZZZ 		# Temp name (XXX), Branch name (ZZZ)

git cherry-pick sha1 	# commit to merge (sha1)

git push

```

### Undo 'changed to be commited'

```

git reset	# (not pushed yet)

```

### Undo (pushed) commits

```

git reflog					# to see number

git reset --hard HEAD@{XXX}	# undo to XXX

git push -f					# (undo pushed) force revert in remote repo

```

### Stash

```

git stash save  # Complete stash

git stash --patch --no-keep-index # Partial stash

git stash list

git stash pop # Unstash

git stash clear # Remove all stash

```

### History

```

gitk

```

### Submodule

```

git submodule add git://github.com/XXX/YYY.git ZZZ	# Read-only repo (XXX/YYY) to path (ZZZ)

git submodule update --init							# Initialize

git submodule update								# reset changes made in submodule

git remote update									# (pwd submodule) - fetch latest update

git merge origin/master								# (pwd submodule) - merge latest update

git submodule status								# view changes of submodules

```

### Remove submodule

```

git config -f .git/config --remove-section submodule.XXX    # submodule path (XXX)

git config -f .gitmodules --remove-section submodule.XXX    # submodule path (XXX)

git rm --cached XXX 										# submodule path (XXX)

```

### GH pages

```

git checkout --orphan gh-pages

```
