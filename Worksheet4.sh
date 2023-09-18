Finding defects in linux

1) adduser adams -then cat /etc/passwd
lab1 - sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/sbin/nologin
cwk2- sshd:x:74:74:Privilege-separated SSH:/var/empty/sshd:/bin/sh

2) adduser adams -then cat /etc/passwd
lab1 - adams:x:1000:1000::/home/adams:/bin/bash
cwk2- adams:x:1006:1006::/home/adams:/bin/bash

3) cat /etc/shadow
lab1 - no additional users such as susan, dirk, reg, svlad, gordon, noel and tss.
cwk2 - all of those added
cwk2 - susan::18559:0:99999:7:::
dirk:$1$qhgsQ0D1$uiQHhHqiYXHfJcWDh.Iu2.:18559:0:99999:7:::
reg:$1$tfSYgAeL$7a.AC6/6/nvLTV7StvEXo/:18560:0:99999:7:::
svlad:$1$KhE9M0.C$ZChvhqbWfAMnZ8cCkqFlg/:18560:0:99999:7:::
gordon:$1$EPpMO9Om$2qtz0oYa4C7JMGFdrQyLV.:18560:0:99999:7:::
noel:!!:18560:0:99999:7:::
adams:$1$hsIf0G0r$3fxPPfGTSuQL27zY14O3P/:19321:0:99999:7:::
tss:!!:18560::::::
 lab1- adams:$6$Lf1kkm6s$YjyOWPSocYc3iaRmGZBSLsD7TKxymjan396OiOsa7EEp1N.eQRmGzuu8VcOXDsz61WM.PlGAiFENIHB7yi2ah/:19321:0:99999:7:::

4) No firewall in cwk2 image- cmd- ps auxf
lab1- root       492  0.0 12.2 358992 29452 ?        Ssl  11:07   0:00 /usr/bin/python2 -Es /usr/sbin/firewalld -
cwk2- no such command exists 

5) command- ps auxf - found anacron in cwk2
"Anacron is used to run commands periodically with a frequency defined in days. It works a little different from cron; 
assumes that a machine will not be powered on all the time."- could be used inappropriately. 
lab1-no such thing in lab1
cwk2- root      1017  0.0  0.4 125484  1116 ?        Ss   11:01   0:00 /usr/sbin/anacron -s

6) no firewalld in cwk2 command-top
lab1-   492 root      20   0  358992  29452   7044 S  0.0 12.2   0:00.42 firewalld  
cwk2- no such thing exists

7) command-top anacron running in cwk2
lab1-
cwk2-  1017 root      20   0  125484   1116    872 S  0.0  0.5   0:00.00 anacron  


8) cd /etc. ls -l to check the permissions of the shadow file
details- only root should be able to see the shadow file since it contains the hash.
lab1 permission for it in lab1
-----------. 1 root root      585 Oct  2  2020 shadow
cwk2- -rw-rw----. 1 root root      955 Oct 25  2020 shadow
here in cw2 user and group have the permission to read and write. only root should have it. unsafe they can see hash.


9) inside of the shadow file. cd /etc cat shadow. What I expect if its safe- not to use MD5. it is unsafe. It doesnt use $1$ in shadow.
lab1 -- root:$6$B9xO4.HlJkweBXBx$fTITPxQilovPH4kHn7YaNAYze3G3XCGHTyaUVB.PevmIY4aFLNcyvBEB.jZD/vB7/ujH09cedkk/OQcD7s.M70::0:99999:7:::
bin:*:18353:0:99999:7:::
daemon:*:18353:0:99999:7:::
adm:*:18353:0:99999:7:::
lp:*:18353:0:99999:7:::
sync:*:18353:0:99999:7:::
shutdown:*:18353:0:99999:7:::
halt:*:18353:0:99999:7:::
mail:*:18353:0:99999:7:::
operator:*:18353:0:99999:7:::
games:*:18353:0:99999:7:::
ftp:*:18353:0:99999:7:::
nobody:*:18353:0:99999:7:::
systemd-network:!!:18537::::::
dbus:!!:18537::::::
polkitd:!!:18537::::::
sshd:!!:18537::::::
postfix:!!:18537::::::
chrony:!!:18537::::::
here root has $6$- uses sha256 or sha512, which is safe.

cwk2- root:$6$B9xO4.HlJkweBXBx$fTITPxQilovPH4kHn7YaNAYze3G3XCGHTyaUVB.PevmIY4aFLNcyvBEB.jZD/vB7/ujH09cedkk/OQcD7s.M70::0:99999:7:::
bin:*:18353:0:99999:7:::
daemon:*:18353:0:99999:7:::
adm:*:18353:0:99999:7:::
lp:*:18353:0:99999:7:::
sync:*:18353:0:99999:7:::
shutdown:*:18353:0:99999:7:::
halt:*:18353:0:99999:7:::
mail:*:18353:0:99999:7:::
operator:*:18353:0:99999:7:::
games:*:18353:0:99999:7:::
ftp:*:18353:0:99999:7:::
nobody:*:18353:0:99999:7:::
systemd-network:!!:18537::::::
dbus:!!:18537::::::
polkitd:!!:18537::::::
sshd:!!:18537::::::
postfix:!!:18537::::::
chrony:!!:18537::::::
susan::18559:0:99999:7:::
dirk:$1$qhgsQ0D1$uiQHhHqiYXHfJcWDh.Iu2.:18559:0:99999:7:::
reg:$1$tfSYgAeL$7a.AC6/6/nvLTV7StvEXo/:18560:0:99999:7:::
svlad:$1$KhE9M0.C$ZChvhqbWfAMnZ8cCkqFlg/:18560:0:99999:7:::
gordon:$1$EPpMO9Om$2qtz0oYa4C7JMGFdrQyLV.:18560:0:99999:7:::
noel:!!:18560:0:99999:7:::
adams:$1$FuOCXkvl$wddqJ4NYvCyYs1FiqS8lN/:18560:0:99999:7:::
tss:!!:18560::::::
here dirk, reg, eyc has $1$ unsafe because its MD5. inappropriately setting.

10) only need to work through week6 access control ppt, everything else checked. iF insufficient defects found
revisit linux basics and access control ppt- that what ligang hinted at. All worksheets checked.- Worksheet 3 irrelevant.
revisit more linux basics ppt- most defects associated with that. Check access control- some defects associated
with that.
Check system setting files to see if there are
inappropriate settings
 check everything in the etc directory before moving on. to get the lab 1 img
 second cmd- /usr/libexec/qemu-kvm -m 256 -netdev user,id=n0,hostfwd=tcp::2223-:22 -device e1000,netdev=n0 lab1.cow
 use a differnt port so whe you run ssh local root thing use ssh root@localhost -p 2223 for lab 1 and everythign same as usual for cwk2

10)cd /etc/sysconfig cat selinux
lab1-selinux state is enforcing. It enforces security policy of selinux. If the attacker does launch malicious sofwtare, it will not allow it.
cwk2- permissive. It just prints warnings rather than enforcing them. attacker can release malware. It will only print warnings
and will allow the attacker to continue.

11)cd / then ls -l then cd root
issue- john-1.9.0.tar.gz is a password cracker when I searched for it online which can crack hashed passwords. it is in root dircetory (hidden) in cwk2. No such thing in lab1 image.

12) cd / - this is the starting directiory. type sudo. then it will say /etc/sudoers.d is world writable. which it shoulnt be.
cwk2 - [root@cs140cwk2a /]# sudo
sudo: /etc/sudoers.d is world writable
usage: sudo -h | -K | -k | -V
usage: sudo -v [-AknS] [-g group] [-h host] [-p prompt] [-u user]
usage: sudo -l [-AknS] [-g group] [-h host] [-p prompt] [-U user] [-u user] [command]
usage: sudo [-AbEHknPS] [-r role] [-t type] [-C num] [-g group] [-h host] [-p prompt] [-T timeout] [-u user] [VAR=value]
            [-i|-s] [<command>]
usage: sudo -e [-AknS] [-r role] [-t type] [-C num] [-g group] [-h host] [-p prompt] [-T timeout] [-u user] file ...
in lab1- only root can write and (just others not group)others dont have any permissions.- cd/etc ls-l drwxr-x---. 1 root root        0 Apr  1  2020 sudoers.d
cwk2- drwxrwxrwx. 1 root root        0 Apr  1  2020 sudoers.d
general-write permission must be restricted to root.
