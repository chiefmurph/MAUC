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

### To utilize this site

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
that is one of `git`'s strengths, and
2. its maintainers have been
very responsive to my questions in the past.

If you only use this site as a source for ideas,
no problem,
the code is open source.
In that case be courteous and give credit where credit is due
and enjoy.

Files on this site are being distributed under 
[GPL 2](http://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html).

------------------------------
## Git in short

Think of `git`
as a collection of "lenses" through which 
the programs on your computer --
such as `R` and `RStudio`,
and even `File Explorer` (Windows) and `Finder` (Apple) --
can "see" the R scripts and other files on your computer.
Indeed, rather than there being only one version of your files
to access and modify,
there can exist multiple versions 
corresponding to the multiple "lenses" you have created.
A "lens" is created by a `commit`.
To work with a particular "view" (version) of your files,
find the `commit` corresponding to that "lens"
and make it active.
`git` is the software invented by
the creator of 
[linux](https://www.linux.com), 
Linus Torvalds,
that makes all that happen.

### Commits

A `commit` tells git to save the current versions of your files
so they can be found again.
You can always go back and work with a previous version 
(commit) if you need to.

This important `commit` paradigm allows an analyst to 

* create an audit trail of changes to the analysis, and
* manage version control without the need for obtuse naming conventions
such as code\_v1.r, code\_v2.r, code\_AnalystA.r, and the like.

Commits have minimal overhead because in most cases
`git` only saves *the changes to your files.*
Therefore, as is recommended,
*commit early and commit often.*

### Branches

A `branch` holds the sequence of commits that reflect the work
to achieve some objective.
For example, before making changes to this `readme` file,
I started a branch called "temporary-branch".

Switch between branches to work on different aspects of your project.
For example, 
I simultaneously have another branch, "Tweak R code",
where I am working on a change to Greg's R script.

The usual practice is for a project to have a "definitive production" branch,
often called `master`,
which is the practice on this site.

This powerful `branching` paradigm allows collaborating analysts
to work on different 
aspects of a project without stepping on each other's toes.
This paradigm even extends to non-text files (like spreadsheets!)
with the caveat that git's attempt to automatically merge two people's changes 
to the same file
does not work as well with binary/non-text files such as spreadsheets.

Given actuaries' professional requirement to maintain
[appropriate documentation](http://actuarialstandardsboard.org/wp-content/uploads/2014/07/asop009_027.pdf),
`git` can be an effective technical tool that 

* Implements version control
* Manages the technical workflow on complex projects, 
even those that are 100% spreadsheet oriented
* Simplifies collaboration.

### Merges

A `merge` is git's way of blending two branches together. 
For example,
after saving the changes to this `readme` file I committed those changes
while on the `temporary-branch`.
Now I want to put those changes into production so they will appear on this site.
I do that by merging the `temporary-branch`
into the `master` branch.

To merge a `temporary-branch` into `master` using 
the `Github for Desktop` GUI, proceed as follows:

* Select `master` from the drop-down branch box at the top toward the left. 
This will "check out" `master`.
All changes in your `temporary-branch` should be `committed` before switching
branches.
* Click the `Compare` button and under "Recent branches" click 
the name of the `temporary-branch` you were working on.
* You should now see a button labeled `Update from temporary-branch`.
Click that and you're done.
Your `master` branch will now reflect all those `temporary-branch` changes.

`temporary-branch` is now obsolete.
You can remove its name from your list of branches as follows:

* Re-select the `temporary-branch` 
(again, from the drop-down box at the top toward the left).
* Click the "gear" again and you should see the option to 
`Delete temporary-branch`.
* Select that option
and `temporary-branch` will no longer clutter your list of branches.

You are ready to start the next phase of your analysis.

Bottom line,

* Don't Be Afraid to Commit
* Happy Branching!