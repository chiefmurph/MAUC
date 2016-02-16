# mauc

**Modeling ALAE Using Copulas**

Greg McNulty (FCAS),
a member of the 
[CAS Open Source Software Committee](http://opensourcesoftware.casact.org/),
wrote the paper
[Modeling ALAE Using Copulas](http://opensourcesoftware.casact.org/blogs:2)
on that committee's 
[blog site](http://opensourcesoftware.casact.org/).
With McNulty's generous consent,
the R code included with his paper has been uploaded to this github site.
The goal is to facilitate ways for actuaries 
to work with the concepts actualized through Greg's code.
The primary outcome will be a 
[shiny app](http://shiny.rstudio.com/)
that "serves up"" Greg's algorithms.

To utilize this site,
clone it on your desktop.
Perhaps the easiest way to do that is via the 
[RStudio](https://www.rstudio.com/) interface to R.
However, for 
[git](https://git-scm.com) I predominently
use [Github Desktop](https://desktop.github.com/)
because 

1. it implements
[branching](https://git-scm.com/about/branching-and-merging), 
a powerful workflow and one of `git`'s strengths, and
2. its maintainers have been
very responsive to my questions in the past.

If you only use this site as a source for ideas,
no problem,
the code is open source.
In that case

* clone to your desktop
* don't worry about branches if you don't want to
* be courteous and give credit where credit is due
* enjoy!

This code on this site is being distributed under GPL 2.

------------------------------
### Git Details

Think of `git` (implemented, perhaps, by Github Desktop)
as a collection of lenses through which 
the programs on your PC
(such as `R` and `RStudio`,
and even
Windows' `File Explorer` and
Apple's `Finder`)
view the files on your PC
(such as R scripts).
Each lens "sees" different versions of your files, 
but only one "lens" can be "active" at a time.
A "lens" is created by a `commit`.

#### Commits

A `commit` tells git to save the current versions of your files
so they can be found again.
You can always go back and work with a previous version 
(commit) if you need to.
Commits have minimal overhead because in most cases
all that is saved are your file changes.
Therefore, as is recommended,
"commit early and commit often."

#### Branches

A `branch` holds the sequence of `commit`s that reflect the work
taking place to achieve some objective. 
Switch branches to work on different aspects of project.
To avoid conflicts between versions of a file on different branches
it is advisable to work on different files on different branches.

To repeat:

>A `branch` of a git repository 
is a set of versions of the files in that repository
reflecting all changes that have been made to those
files **whenever that branch is the active branch.**
The versions of your files on all other branches 
remain in their existing states at the time you left the branch.
Switching branches causes you to only **loses sight of** 
the versions on the other branches,
not lose them entirely.
To see those versions again, switch back to that branch.

It is expected that all branches On this project will
"grow out of" the `master` branch.

> The last `commit` on the `master` branch holds the 
production/definitive versions of the project's files.

#### Merges

A `merge` is git's way of blending the last `commit` 
on a `branch` back into the `master` branch.
The site maintainer (me) is responsible for merging.
Just let me know when you are ready.
If everything goes smoothly the `master` branch
will now hold all the changes from the merged `branch`.
But if the changes to a file on a branch no longer begin 
from the original starting point on `master`,
`git` will say a "merge conflict" exists and
not allow the merge to occur.
The best way to avoid your work causing a "merge conflict"
is to make sure other people are not working on the same files
you are.
The site maintainer can help with that.

I expect merge conflicts to be rare.
