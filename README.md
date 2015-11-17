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

The eventual outcome could be an R package of 
tools for working with Greg's concepts.

This site could be considered a working experiment in actuarial collaboration.

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

This pull request step is optional but helps
avoid merge conflicts. 
See below.

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

#### Branches

Think of `git` (implemented, perhaps, by Github Desktop)
as a collection of lenses through which 
the programs on your PC
(RStudio, for example)
view the files on your PC
(your R code, for example).
A `branch` is just
a different lens.
You can switch lenses (branches)
to allow your PC's programs to 
*see different versions of your files!*
No versions are ever lost
when you switch branches.

This point bears repeating:
>A `branch` of a git repository 
is a set of versions of the files in that repository
reflecting all changes that have been made to those
files **while that branch is active.**
The versions of your files on all other branches 
remain in their existing states at the time you left the branch.
Switching branches causes you to only **loses sight of** 
the versions on the other branches,
not lose them entirely.
To see those versions again, switch back to that branch.

#### Commits

A `commit` tells git to save that version
of your files as a lens in its drawer of lenses.
Commits have virtually no overhead --
all that's saved are your changes --
so commit early and commit often.
You can always go back to a previous version 
(commit) if you need to.

>A `branch` is made up of a sequence of `commit`s.
When you switch to a branch you are placed at the last `commit`.

After making a `commit` 
you will be able to see all the changes you made to the files.
If you don't like the changes you can always go back
("revert your commit" in Github Desktop).

## Submit a pull request

If you are a participant and want 
people to see your code here,
submit a request for me to pull in your code.
I will be as responsive as possible.
The `master` branch should always be considered
as holding the "cleanest versions."

#### Merge conflicts

Suppose two participants
plot a loss density but
are unaware of each other.
Then priority goes to the first pull request.
If the second person's changes conflict with 
the previous person's,
I will get a "merge conflict" when I try to merge,
and will inform the second participant.
I expect merge conflicts to be rare.
