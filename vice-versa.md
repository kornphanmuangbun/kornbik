```sh
# Connectiong by SSH from Android Termux to Desktop and vice-versa.md
# Copyright (c) 2019 Evandro Coan
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
```


These are Android commands to run on Termux and setup a SSH client and server,
allowing to connect from your desktop to your Android and vice-versa.
Does not cover the SSH server and client set up on your desktop computer.

**Using the SSH server**
https://termux.com/ssh.html

    apt update
    apt upgrade
    apt install openssh

Here you can create a password for your keys and use it to connect to your computer, if you like
a password. Otherwise, leave them in blank and no passwords are required, other than your
DESKTOP user computer password.

**How can I set up password-less SSH login?**
https://askubuntu.com/questions/46930/how-can-i-set-up-password-less-ssh-login

    ssh-keygen -b 4096 -t rsa

This allows you to connect from your ANDROID to your DESKTOP by SSH connection without
your ANDROID user password (as passwords are not supported by termux sshd server)

**3 Steps to Perform SSH Login Without Password Using ssh-keygen & ssh-copy-id**
https://www.thegeekstuff.com/2008/11/3-steps-to-perform-ssh-login-without-password-using-ssh-keygen-ssh-copy-id

    ssh-copy-id -i ~/.ssh/id_rsa.pub your_desktop_ssh_user@YOUR.DESKTOP.IP.ADDRESS

This allows you to connect from your DESKTOP to your ANDROID by SSH connection without
your ANDROID user password (if you want to use your's computer user password, skip this command)

1. First Option
   **Accessing termux user environment from other consoles**
   https://android.stackexchange.com/questions/154756/accessing-termux-user-environment-from-other-consoles

        scp your_desktop_ssh_user@YOUR.DESKTOP.IP.ADDRESS:~/.ssh/id_rsa.pub ~/.ssh/authorized_keys

1. Second Option
   **How do I add SSH Keys to authorized_keys file?**
   https://askubuntu.com/questions/46424/how-do-i-add-ssh-keys-to-authorized-keys-file

        cat ~/.ssh/id_rsa.pub | ssh your_desktop_ssh_user@YOUR.DESKTOP.IP.ADDRESS "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"

**Scripts and notes for setting up and using SSHd on your Android device using Termux**
https://github.com/tomhiggins/TermuxSSHDsetup

    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

**ssh blank passphrase but still asking for it**
https://serverfault.com/questions/845623/ssh-blank-passphrase-but-still-asking-for-it

    chmod 700 ~/.ssh
    chmod 600 ~/.ssh/id_rsa
    chmod 600 ~/.ssh/id_rsa.pub
    chmod 600 ~/.ssh/known_hosts
    chmod 600 ~/.ssh/authorized_keys

Start the server by executing sshd (which will start it on the default port 8022)
and run `logcat -s 'syslog:*'` to view the log output from the server process.
Execute pkill sshd to stop the server.

    logcat -s 'syslog:*'
    pkill sshd
    sshd


___ 

Finally, connecting from one to another and vice-versa:

Connecting from your ANDROID to your DESKTOP (the usage of your DESKTOP user password can be optional)

    ssh your_desktop_ssh_user@YOUR.DESKTOP.IP.ADDRESS

Connecting from your DESKTOP to your ANDROID (must not to use your ANDROID user password)

**Since Termux is a single-user system you may connect as any user - regardless
of your specified username you will login as the only Termux user available.**

**The Termux sshd binary does not support password logins, so a key needs to be authorized in
`~/.ssh/authorized_keys` before connecting. Use ssh-keygen to generate a new one if desired.**

    ssh -p 8022 -i ~/.ssh/id_rsa IP.OF.YOUR.ANDROID

(ANDROID) **If you still have trouble logging on navigate to file and activate these two key pairs:**
`/data/data/com.termux/files/usr/etc/ssh/sshd_config`

    ChallengeResponseAuthentication no
    PubkeyAuthentication yes


___ 

Extra: Locking and unlocking the file system from read-only to read-write and vice-versa.

**How to copy files to an Android emulator’s data directory with ‘adb push’**
https://alvinalexander.com/android/how-copy-files-android-device-emulator-adb-push-read-only-error

    mount -o rw,remount rootfs /

Revert the changes back after finishing the changes!

    cat /proc/mounts
    mount -o ro,remount rootfs /

