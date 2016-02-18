---
output: html_document
---
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
The idea is to help actuaries
learn about and work with
the ideas actualized through Greg's code.

The first goal: create a 
[shiny app](http://shiny.rstudio.com/)
that runs McNulty's algorithms and reproduces his results.

## To utilize this site

Clone this repository on your local computer.
Perhaps the easiest way to do that is via 
[RStudio](https://www.rstudio.com/), 
a third-party interface to R.
However, for 
[git](https://git-scm.com) I predominently
use [Github Desktop](https://desktop.github.com/)
because 

1. it implements an important and powerful workflow,
[branching](https://git-scm.com/about/branching-and-merging), 
one of `git`'s strengths, and
2. its maintainers have been
very responsive to my questions in the past.

If you only use this site as a source for ideas,
no problem,
the code is open source.
In that case be courteous and give credit where credit is due,
and enjoy.

Files on this site are being distributed under 
[GPL 2](http://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html).

------------------------------
------------------------------
## Git guidance for *dmm*

**This is a "notes" section for *dmm* for finding for later. 
All others may kindly ignore. :-)**

`git`
as a collection of "lenses" through which 
the programs on *dmm*'s computer --
such as `R` and `RStudio`,
and even `File Explorer` (Windows) and `Finder` (Apple) --
can "see" the R scripts and other files on his computer.
Indeed, rather than there being only one version of *dmm*'s files
to access and modify,
there exist multiple versions 
corresponding to the multiple "lenses" he has created.

A "lens" is created by a `commit`.

`git` is the software invented by
the creator of 
[linux](https://www.linux.com), 
Linus Torvalds,
that makes all that happen.

### Commits

A `commit` tells git to save the current versions of *dmm*'s files
so their currently-existing states can be found again.

This important `commit` paradigm enables *dmm* to 

* create an audit trail of changes to his analyses, and
* manage version control without the need for obtuse naming conventions
such as analysis\_v1, analysis\_v2, analysis\_dmm, and the like.

Commits have minimal overhead because in most cases
`git` only saves *the changes to the files.*
Therefore, as is recommended,
*commit early and commit often!*

### Branches

A `branch` holds the sequence of commits that reflect the worksteps required
to achieve some objective.
For example,
before changing this `readme.md` file that appears as the face of this site,
*dmm* created another branch, `temporary-branch`,
and switched to that branch before making his changes.

The usual practice is for a project to have a "definitive production" branch,
often called `master`.
That practice is adopted for this site.

This powerful `branching` paradigm allows collaborating actuaries
to work on different 
aspects of a project without stepping on each other's toes.
This paradigm even extends to non-text files (like spreadsheets, a necessary evil)
with the caveat that git's attempt to detect changes 
automatically
does not work as well with binary/non-text files.

Given *dmm*'s professional requirement to maintain
[appropriate documentation](http://actuarialstandardsboard.org/wp-content/uploads/2014/07/asop009_027.pdf),
`git` can be an effective technical tool to 

* Implement seemless version control
* Manage the technical workflow of complex projects, 
even those that are 100% spreadsheet oriented
* Simplify coordination with collaborators.

### Merges

**Note: This section is included for completeness
for maintaining the repositories of *dmm*'s own projects.**

A `merge` is git's way of blending two branches together. 
For example,
after saving the changes to this `readme` file *dmm* committed those changes
while on the `temporary-branch`.
For those changes to appear on this site, 
*dmm* merged the `temporary-branch`
into the `master` branch
via 
the `Github for Desktop` GUI as follows:

* Select `master` from the drop-down branch box at the top toward the left. 
This will "check out" `master`.
(All changes in *dmm*'s `temporary-branch` were `committed` before he switched
branches.)
* Click the `Compare` button and under "Recent branches" click 
the name of the `temporary-branch`.
* You should now see a button labeled `Update from temporary-branch`.
Click that and you're done.
Your `master` branch will now reflect all those `temporary-branch` changes.
* Since `temporary-branch` is now obsolete,
you can remove its name from your list of branches as follows:
    * Re-select the `temporary-branch` 
(again, from the drop-down box at the top toward the left).
    * Click the "gear" again and you should see the option to 
`Delete temporary-branch`.
    * Select that option
and `temporary-branch` will no longer clutter your list of branches.

### Checking out previous versions

**Not fully tested for all conceivable situations!**

With Github Desktop (GHDT) click "History" and find the commit
of the state of the project you want to resurrect.
Note: you may have to switch to `master`.
Click the commit's *SHA-1 hash*,
the first seven alphanumeric characters of which appear under the 
title of the commit.
Using the gear again, `Open in Git Shell`.
At the prompt, type

    git checkout Ctrl-v [Enter]  
Your files and folders will magically appear in the state they existed
when you made that commit.

#### Oops! Undo.

Sometimes you make a complicated change to a file that you want to 
completely ignore but, unfortunately,
you accidentally saved your changes.
You would like to go back to the version just before the save.
No problem!
Using the gear again, `Open in Git Shell`.
At the prompt, type

    git checkout `filename` [Enter]  
Your file is restored.
