# MAUC
Modeling ALAE Using Copulas

Greg McNulty (FCAS),
an actuary at SCOR and a member of the 
CAS Open Source Software Committee,
wrote a paper posted as a blog
on that committee's wiki site
(http://opensourcesoftware.casact.org/blogs:2).
The purpose of this github site is to implement ways
to visualize Greg's concepts using 
the R environment.

How to utilize this site.

## Clone on your desktop

Clone this site on your desktop.
Easiest way?
Probably RStudio.
I predominently
use Github Desktop
because 

1. it implements the advanced git recommended below -- 
branching and pull requests, and
2. the maintainers have been
very responsive to my questions in the past.

Even if you don't "Participate"
you are encouraged to practice *safe branching*.
See below.

## Participate

Think of something to visualize.
Give it a name
and create a branch with that name on your desktop.
Move to that branch in Githup Desktop.
Submit a pull request.
If I accept, 
then people visiting this site will see that someone
is working on "EnhanceFigure1", for example.
If that person also wants to enhance Figure 1,
he/she should coordinate with you.

Play around with some code to create your visualization.
Submit more pull requests.
Keep submitting them until you are done.
This way, anyone who may want to jump in on the development
can stay up to speed.
Easiest way to stay up to speed?
Sync (Github Desktop) or Pull (Rstudio) often.

Or...

## Don't Participate

If you only want to use the code on this site for ideas,
no problem,
it's open source.
In that case,
clone to your desktop,
don't worry about branches if
you don't want to,
and enjoy.

Be courteous and give credit where credit is due.

This code is distributed under GPL 2.


#### Branches

Think of git (implemented, perhaps, by Github Desktop)
as a collection of lenses through which 
the programs on your PC
(RStudio, for example).
view the files on your PC
(your R code, for example).
A "branch" in git is just
a different lens.
You can switch lenses (branches)
to allow your PC's programs to see 
*different versions of your files!*
No versions are ever lost
when you switch from branch to branch.

This point bears repeating:
>A branch enables your PC's
programs to be aware of only the versions of your PC's files
that have been modified while that branch has been active.
The versions on all other branches remain in their current state.
If you switch branches you will only **lose sight of** 
the versions on the other branches,
not lose them entirely.
To see them again, switch back to that branch.

#### Commits

A "commit" tells git to save that version
of your files as a lens in its drawer of lenses.
Commit frequently because there's virtually no overhead --
all that's saved are your changes,
and actuaries know that 
storing two as-of versions versus
storing the first version as well as the changes
are equivalent.

>Commits,
like branches,
allow views to different versions of your PC's files.

## Submit a pull request

Assuming you are a participant and want 
people to see your code on this site,
submit a request for me to pull in your code.
I will be as responsive as possible.
The master branch will be considered
the version holding the "cleanest code."

#### Merge conflicts

Suppose the two participants
wanting to work on enhancing Figure 1
did not communicate.
If they happened to make similar but not the
same changes, 
then it's first come first served,
and it will be up to the second person
to resolve any potential conflicts.

I expect merge conflicts to be rare.
