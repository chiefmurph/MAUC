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
to learn about and work with
the ideas actualized through Greg's code.
The primary outcome will be a 
[shiny app](http://shiny.rstudio.com/)
that "serves up" Greg's algorithms.

To utilize this site,
clone it on your desktop.
Perhaps the easiest way to do that is via 
[RStudio](https://www.rstudio.com/), 
a third-party interface to R.
However, for 
[git](https://git-scm.com) I predominently
use [Github Desktop](https://desktop.github.com/)
because 

1. it implements an important and powerful workflow,
[branching](https://git-scm.com/about/branching-and-merging), 
that is one of `git`'s strengths, and
2. its maintainers have been
very responsive to my questions in the past.

If you only use this site as a source for ideas,
no problem,
the code is open source.
In that case

* clone to your desktop
* do not worry about 
[branching](https://git-scm.com/about/branching-and-merging)
if you don't want to
* be courteous and give credit where credit is due
* enjoy!

This code on this site is being distributed under GPL 2.

------------------------------
## Git in short

Think of `git` (implemented, perhaps, by Github Desktop)
as a collection of "lenses" through which 
the programs on your computer
(such as `R` and `RStudio`,
and even
Windows' `File Explorer` and
Apple's `Finder`)
can "see" the files on your computer
(such as R scripts).
Indeed, rather than there being only one version of your files
to access and modify,
there can exists multiple versions 
corresponding to the multiple "lenses" you have created.
A "lens" is created by a `commit`.
To work with a particular "view" (version) of your files,
find the `commit` corresponding to that "lens"
and make it active.
`git` is the software invented by
the creator of linux, Linus Torvalds,
that makes this all happen.

### Commits

A `commit` tells git to save the current versions of your files
so they can be found again.
You can always go back and work with a previous version 
(commit) if you need to.
Commits have minimal overhead because in most cases
all that is saved are your file changes.
Therefore, as is recommended,
"commit early and commit often."

### Branches

A `branch` holds the sequence of `commit`s that reflect the work
taking place to achieve some objective.
For example, before making changes to this `readme` file,
I started a branch called "Tweak Readme".

Switch branches to work on different aspects of your project.
For example, 
I could simultaneously have another branch, say "Tweak R code",
where I am working on a change to Greg's R script.

This powerful `branching` paradigm allows different people to work on different 
aspects of a project without stepping on each other's toes
and without having to utilize "version names" in different copies
of the same file 
("code v1.r", "code v2.r", "code dmm.r", and the like).

The usual practice is for a project to have a "definitive production" branch,
often called `master`,
which is the practice on this site.

### Merges

A `merge` is git's way of blending two branches together. 
For example,
after saving the changes to this `readme` file I committed those changes
to the "Tweak Readme" branch and then merged that branch into the master branch.
There are two ways to do this in `Github for Desktop`:

1. In the "Git Shell" available via the "gear" in the upper right corner:  
git checkout master  
git merge style

2. Select the `master` branch from the drop-down box at the top towrd the left.
