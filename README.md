# MAUC

**Modeling ALAE Using Copulas**

Greg McNulty (FCAS),
an actuary at SCOR and a member of the 
CAS Open Source Software Committee,
wrote a paper posted as a 
[blog](http://opensourcesoftware.casact.org/blogs:2)
on that committee's wiki site.
The purpose of this github site is to implement ways
to work with Greg's concepts in 
the [R environment](https://www.r-project.org/).

The eventual outcome has yet to be determined,
but could a collection of scripts or perhaps a full R package
for working with Greg's blog.

This site might be considered a working experiment in actuarial collaboration.

How to utilize this site.

## Clone on your desktop

Clone this site on your desktop.
Easiest way?
Probably [RStudio](https://www.rstudio.com/).
I predominently
use [Github Desktop](https://desktop.github.com/)
because 

1. it implements the advanced git recommended below -- 
branching and pull requests, and
2. the maintainers have been
very responsive to my questions in the past.

## Participate

Think of something to implement in R with respect to Greg's paper.
Suppose you want to draw a density function for loss.
Create a branch named `PlotLossDensity`, say, using Github Desktop.
Move to that branch.
Do something and commit your changes.
Submit a pull request.
If I accept, 
then people visiting this site will see that someone
on the `PlotLossDensity` branch is probably working on
plotting a loss density function.
If another person also wants to plot a loss density function,
he/she will see your branch (hopefully) and coordinate with you.

## ... or Don't Participate

If you only want to use the code on this site for ideas,
no problem,
it's open source.
In that case

* clone to your desktop
* don't worry about branches if you don't want to
* be courteous and give credit where credit is due
* enjoy!

This code on this site is being distributed under GPL 2.

## Pull request

If you are a participant and want 
people to see your code here,
start a `branch` and 
submit a `pull request` for me to pull your branch
to the online repository.
When your 
I will be as responsive as possible.

------------------------------
### Git Details

Think of `git` (implemented, perhaps, by Github Desktop)
as a collection of lenses through which 
the programs on your PC
(RStudio, for example)
view the files on your PC
(your R code, for example).
Each lens "sees" different versions of your files.
A lens is created by a `commit`.

#### Commits

A `commit` tells git to save the current versions of your files
so they can be found again.
You can always go back to a previous version 
(commit) if you need to.
Commits have virtually no overhead --
all that's saved are your changes --
so there is negligent storage penalty for committing often.

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

On this project it is expected that all branches will
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
