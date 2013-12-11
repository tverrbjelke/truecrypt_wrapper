Truecrypt Wrapper Script
========================

This bash script [truecrypt_wrapper.sh](https://github.com/tverrbjelke) 
is a workaround for truecrypt on linux,
helping against the following serious security problem of truecrypt:

**using truecrypt your system leaks and bookmarks 
your recently used containers!**

The bookmarking happens normally inside this xml file:

    $HOME/.local/share/recently-used.xbel

An attacker with access to your home folder (physically or via network) 
could use the recently-used file to easily **see where your
truecrypt containers are**, and thus you
    
1. **spoil any plausible deniability**

2. **present where your precioius encrypted containers are**

I saw many workaround-suggestions that just won't work but 
just give false sense of security. 
Truecrypt on many linux distributions 
**runs as root** (via sudo or special bit set), 
so **locking the recently-used file just not works**. 
Truecrypt running as root will override such efforts 
and still create it's bookmarks of your containers.


Usage
======

Start this script instead of the normal truecrypt binary.
(E.g. put a desktop icon and menu-entry linking to this wrapper-script).

Optionally you may give your recently-used.xbel file as argument.

Establish a workflow to 

1. Start truecrypt_wrapper.sh
2. Mount container files.
3. Work with container.
4. Unmount everything inside truecrypt.
5. Close truecrypt (and let the wrapper do the cleanup).


How it works
============

This script just puts the official (clean) recently-used file outa sight 
and after using truecrypt moves it back in place.

It does these steps:

1. Backup official / clean recently-used file.
2. Launch truecrypt.
3. Wait for truecrypt to end.
4. Wipe the temporary / dirty recently-used file.
5. Restore official clean recently-used file.


Caveats
=======

While you work with your mounted container, 
you work with a temporary recently-used file.
That will get wiped/deleted after you close truecrypt.

So keep in mind:

* Always remember: 
**This is not a fix, but only 
just a workaround a severe security issue with truecrypt!**

* Any new recently-used activity is lost after closing truecrypt.

* Do not log off, shutdown or poweroff (blackout/unplug/battery disconnect)
your computer without first properly closing truecrypt,
the wrapper script is canceled and thus 
cannot do the cleanup.

So if that still happens: *manually* move the original and clean 
recently-used file-backup over the temporary one:

    $> mv $HOME/.local/share/recently-used.xbel.bak $HOME/.local/share/recently-used.xbel
 
I am thinking of integrating this feature into the script,
so next time you just have to start the wrapper and it does that for you.
But for those people that still have the habit of *just logging off* 
(and forget to manually quit truecrypt after each session)
they will still have the leaked bookmarks there,
and they even cannot see that, 
because on next start the script removes them...
So what you think: how to adress this - properly? 


Spread the news!
===============

Tell people of this security issue!
Don't leave people in the lurch 
when they already put effort using security tools
but with a false sense of their actual security situation!

