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

How to utilize this site

## Clone on your desktop

Clone this site on your desktop.
Easiest way?
Use RStudio.
I use that, but I predominently
use Github Desktop
because 
(1) the Windows and Mac UI's
are very nearly identical and 
(2)
their maintainers have been
*very* responsive when I've had questions in the past.

Even if you don't "Participate",
I encourage you to practice safe branching.
See below.

## Participate

Think of something to visualize.
Think of a name for that 
and create a branch on your desktop.
Move to that branch in Githup Desktop.
Submit a pull request.
If I accept, 
then people visiting this site will see that someone
is working on "EnhanceFigure1", for example.
If you also want to enhance Figure 1, 
then the two of you will have to duke it out!

Play around with some code to create your visualization.
Submit more pull requests.
Keep submitting them until you are done.
This way, anyone who may want to jump in to the development
stays up to speed.

On the other hand, 
if you prefer to work alone, no problem,
just keep working on your own and keep your fingers 
crossed that there will be no merge conflict.

Or never even submit a pull request,
that's fine too.
If you just want to use the code on this site for ideas,
no problem,
it's open source.
Folks authoring code on this site are willing participants
to this open-source arrangement.
It is appreciated throughout the OS community,
however,
that credit should be given where credit is due.
Authors on this site will expect 

#### Branches

Think of git (implemented, perhaps, by Github Desktop)
as a lens through which 
the programs on your PC
(RStudio, for example).
view the files on your PC.
A "branch" in git is just
a different lens.
You can switch lenses (branches)
to allow your PC's programs to see *different versions of files!*
No versions are ever lost.
The only way to lose a version 
would be to delete the branch that gave you
access to those versions.

This point bears repeating:
>A branch enables Windows Explorer, OS Finder, Rstudio, and other
programs to be aware of only the versions of your PC's files
that have existed or been changed while you were working
on them.
If you switch branches you will **lose sight of** 
the other branch's files.
To see them again, switch back to that branch.


## Submit a pull request

This will ask the repository maintainer (me)
to pull your branch up to this online site.
Then we discuss how to merge the changes on your branch
into the master branch.
The master branch will be considered
the version holding the "cleanest code."

#### Merge conflicts

Suppose two participants see a plot and want to
jazz it up a little bit:
better titles, colors, etc.
If their changes impact the same lines of code,
then -- believe it or not -- git will be smart enough to 
catch that. 
After participant A's changes get merged into
the master branch,
participant B's changes will "bounce"
until the conflicts are resolved.
That usually entails B looking at A's code 
and battling it out as to whose is better. :-)


Is it possible that two participants want to work on
enhancing the same 
