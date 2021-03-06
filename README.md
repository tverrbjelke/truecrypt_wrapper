Truecrypt Wrapper Script
========================

This bash script
[truecrypt_wrapper.sh](https://github.com/tverrbjelke/truecrypt_wrapper) 
is a [workaround]((http://querbalken.net/workaround-truecrypt-leaking-containers-security-issue-en.html) for one major security issue with TrueCrypt on linux. 

Put it e.g. into your ` ~/bin/` folder and make it executable.
Then just use this wrapper-script instead of the normal TrueCrypt binary
(E.g. create a desktop icon or menu-entry linking to this script).

Optionally you may give your recently-used.xbel file as argument.

Also do not forget to establish this workflow:

1. Start truecrypt_wrapper.sh
2. Select and mount container files.
3. Work with container.
4. Unmount everything inside TrueCrypt.
5. Close TrueCrypt (and let the wrapper do the cleanup).

This all is published for no better reason under the GPL3, 
I think it should be adequate. 

This script was inspired by [How To: Cover you tracks with truecrypt in gnome](http://ubuntuforums.org/showthread.php?t=909772). 
I not only want to see it hide in a forum and age. 
Instead lets do a next step and make it an open source project so everyone can colaborate at this issue.


Spread the news!
===============

Please tell people of this security issue!
Don't leave people in the lurch 
when they already put effort using security tools
but with a false sense of their actual security situation!


How it works
============

This script just puts the official (clean) recently-used file outa line 
and after using TrueCrypt cleans up and moves it back in place.

It does these steps:

1. Backup official / clean recently-used file.
2. Launch TrueCrypt.
3. Wait for TrueCrypt to end.
4. Wipe the temporary / dirty recently-used file.
5. Restore official clean recently-used file.



Caveats
=======

While you work with your mounted container, 
you work with a temporary recently-used file, 
where the bookmarking is still done.
That will get wiped/deleted after you unmount containers and close TrueCrypt.

So keep in mind:

* Always remember: 
**This is not a fix, but only 
just a workaround a severe security issue with TrueCrypt!**

* Any new recently-used activity is lost after closing TrueCrypt.

* Do not log off, shutdown or poweroff (blackout/unplug/battery disconnect)
your computer without first properly closing TrueCrypt. 
If that happens the wrapper script is aborted and thus 
cannot do the cleanup.

So if shit happens: *manually* move the original and clean 
recently-used file-backup over the temporary one:

    $> mv $HOME/.local/share/recently-used.xbel.bak $HOME/.local/share/recently-used.xbel
 
I am thinking of integrating this feature into the script,
so next time you just have to start the wrapper and it does that for you.
But for those people that still have the (bad) habit of *just logging off* 
(and forget to manually quit TrueCrypt after each session)
they will still have the leaked bookmarks there,
and they even cannot see that, 
because on next start the script removes them...

So I ask you: What do you think, how to adress this - properly? 
For more details and maybe further disqussion see my blog article http://querbalken.net/workaround-truecrypt-leaking-containers-security-issue-en.html and https://github.com/tverrbjelke/truecrypt_wrapper

License
=======

Copyright (c) 2011-2013 tverrbjelke. See the LICENSE.txt file for license rights and limitations (GPL3).