Script started on Thu 27 Nov 2014 06:45:05 AM EST
]0;smurdock@bintapp3: ~/rails_projects/agnu_appsmurdock@bintapp3:~/rails_projects/agnu_app$ exitssh -i farral0n.pem ubuntu@54.69.186.29cd garage[Kat awsgo[5Pexitssh -i farral0n.pem ubuntu@54.69.186.29cd garage[K[K[K[K[K[K[K[K[K[K[K]0;smurdock@bintapp3: ~/rails_projects/agnu_appsmurdock@bintapp3:~/rails_projects/agnu_app$ [K]0;smurdock@bintapp3: ~/rails_projects/agnu_appsmurdock@bintapp3:~/rails_projects/agnu_app$ cap production deply[Koy -- trace
[0;34;49mINFO[0m[[0;32;49m24d60d58[0m] Running [0;33;49m/usr/bin/env mkdir -p /tmp/AgnuApp/[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m24d60d58[0m] Command: [0;34;49m/usr/bin/env mkdir -p /tmp/AgnuApp/[0m
[0;34;49mINFO[0m[[0;32;49m24d60d58[0m] Finished in 1.792 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;30;49mDEBUG[0mUploading /tmp/AgnuApp/git-ssh.sh 0.0%
[0;34;49mINFO[0mUploading /tmp/AgnuApp/git-ssh.sh 100.0%
[0;34;49mINFO[0m[[0;32;49m4479795c[0m] Running [0;33;49m/usr/bin/env chmod +x /tmp/AgnuApp/git-ssh.sh[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m4479795c[0m] Command: [0;34;49m/usr/bin/env chmod +x /tmp/AgnuApp/git-ssh.sh[0m
[0;34;49mINFO[0m[[0;32;49m4479795c[0m] Finished in 0.233 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;30;49mDEBUG[0m[[0;32;49mb0c5c040[0m] Running [0;33;49m/usr/bin/env git ls-remote -h git@github.com:FeetyPelk/agnu_app.git[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49mb0c5c040[0m] Command: [0;34;49m( GIT_ASKPASS=/bin/echo GIT_SSH=/tmp/AgnuApp/git-ssh.sh /usr/bin/env git ls-remote -h git@github.com:FeetyPelk/agnu_app.git )[0m
[0;30;49mDEBUG[0m[[0;32;49mb0c5c040[0m] [0;32;49m	0c4e5d7c14572a24530a7bb4e2e083e6d7dfc107	refs/heads/master
[0m[0;30;49mDEBUG[0m[[0;32;49mb0c5c040[0m] Finished in 1.380 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;34;49mINFO[0m[[0;32;49m83888e19[0m] Running [0;33;49m/usr/bin/env mkdir -pv /var/www/AgnuApp/shared /var/www/AgnuApp/releases[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m83888e19[0m] Command: [0;34;49m/usr/bin/env mkdir -pv /var/www/AgnuApp/shared /var/www/AgnuApp/releases[0m
[0;34;49mINFO[0m[[0;32;49m83888e19[0m] Finished in 0.229 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;30;49mDEBUG[0m[[0;32;49m1d7ee45a[0m] Running [0;33;49m/usr/bin/env [ -f /var/www/AgnuApp/current/REVISION ][0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m1d7ee45a[0m] Command: [0;34;49m[ -f /var/www/AgnuApp/current/REVISION ][0m
[0;30;49mDEBUG[0m[[0;32;49m1d7ee45a[0m] Finished in 0.232 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;30;49mDEBUG[0m[[0;32;49m4a5bfa24[0m] Running [0;33;49m/usr/bin/env cat /var/www/AgnuApp/current/REVISION 2>/dev/null[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m4a5bfa24[0m] Command: [0;34;49m/usr/bin/env cat /var/www/AgnuApp/current/REVISION 2>/dev/null[0m
[0;30;49mDEBUG[0m[[0;32;49m4a5bfa24[0m] [0;32;49m	0c4e5d7
[0m[0;30;49mDEBUG[0m[[0;32;49m4a5bfa24[0m] Finished in 0.230 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;30;49mDEBUG[0m[[0;32;49me739d597[0m] Running [0;33;49m/usr/bin/env [ -f /var/www/AgnuApp/repo/HEAD ][0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49me739d597[0m] Command: [0;34;49m[ -f /var/www/AgnuApp/repo/HEAD ][0m
[0;30;49mDEBUG[0m[[0;32;49me739d597[0m] Finished in 0.230 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;34;49mINFO[0mThe repository mirror is at /var/www/AgnuApp/repo
[0;30;49mDEBUG[0m[[0;32;49me0ab28d5[0m] Running [0;33;49m/usr/bin/env if test ! -d /var/www/AgnuApp/repo; then echo "Directory does not exist '/var/www/AgnuApp/repo'" 1>&2; false; fi[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49me0ab28d5[0m] Command: [0;34;49mif test ! -d /var/www/AgnuApp/repo; then echo "Directory does not exist '/var/www/AgnuApp/repo'" 1>&2; false; fi[0m
[0;30;49mDEBUG[0m[[0;32;49me0ab28d5[0m] Finished in 0.233 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;34;49mINFO[0m[[0;32;49m105ea7e1[0m] Running [0;33;49m/usr/bin/env git remote update[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m105ea7e1[0m] Command: [0;34;49mcd /var/www/AgnuApp/repo && ( GIT_ASKPASS=/bin/echo GIT_SSH=/tmp/AgnuApp/git-ssh.sh /usr/bin/env git remote update )[0m
[0;30;49mDEBUG[0m[[0;32;49m105ea7e1[0m] [0;32;49m	Fetching origin
[0m[0;34;49mINFO[0m[[0;32;49m105ea7e1[0m] Finished in 1.381 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;30;49mDEBUG[0m[[0;32;49m467f2174[0m] Running [0;33;49m/usr/bin/env if test ! -d /var/www/AgnuApp/repo; then echo "Directory does not exist '/var/www/AgnuApp/repo'" 1>&2; false; fi[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m467f2174[0m] Command: [0;34;49mif test ! -d /var/www/AgnuApp/repo; then echo "Directory does not exist '/var/www/AgnuApp/repo'" 1>&2; false; fi[0m
[0;30;49mDEBUG[0m[[0;32;49m467f2174[0m] Finished in 0.231 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;34;49mINFO[0m[[0;32;49m9aa6143f[0m] Running [0;33;49m/usr/bin/env mkdir -p /var/www/AgnuApp/releases/20141127114554[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m9aa6143f[0m] Command: [0;34;49mcd /var/www/AgnuApp/repo && ( GIT_ASKPASS=/bin/echo GIT_SSH=/tmp/AgnuApp/git-ssh.sh /usr/bin/env mkdir -p /var/www/AgnuApp/releases/20141127114554 )[0m
[0;34;49mINFO[0m[[0;32;49m9aa6143f[0m] Finished in 0.280 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;34;49mINFO[0m[[0;32;49m46a6935b[0m] Running [0;33;49m/usr/bin/env git archive master | tar -x -C /var/www/AgnuApp/releases/20141127114554[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m46a6935b[0m] Command: [0;34;49mcd /var/www/AgnuApp/repo && ( GIT_ASKPASS=/bin/echo GIT_SSH=/tmp/AgnuApp/git-ssh.sh /usr/bin/env git archive master | tar -x -C /var/www/AgnuApp/releases/20141127114554 )[0m
[0;34;49mINFO[0m[[0;32;49m46a6935b[0m] Finished in 0.262 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;30;49mDEBUG[0m[[0;32;49m4afcf4e9[0m] Running [0;33;49m/usr/bin/env if test ! -d /var/www/AgnuApp/repo; then echo "Directory does not exist '/var/www/AgnuApp/repo'" 1>&2; false; fi[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m4afcf4e9[0m] Command: [0;34;49mif test ! -d /var/www/AgnuApp/repo; then echo "Directory does not exist '/var/www/AgnuApp/repo'" 1>&2; false; fi[0m
[0;30;49mDEBUG[0m[[0;32;49m4afcf4e9[0m] Finished in 0.233 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;30;49mDEBUG[0m[[0;32;49m98795341[0m] Running [0;33;49m/usr/bin/env git rev-parse --short master[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m98795341[0m] Command: [0;34;49mcd /var/www/AgnuApp/repo && ( GIT_ASKPASS=/bin/echo GIT_SSH=/tmp/AgnuApp/git-ssh.sh /usr/bin/env git rev-parse --short master )[0m
[0;30;49mDEBUG[0m[[0;32;49m98795341[0m] [0;32;49m	0c4e5d7
[0m[0;30;49mDEBUG[0m[[0;32;49m98795341[0m] Finished in 0.236 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;30;49mDEBUG[0m[[0;32;49m5cbbd68d[0m] Running [0;33;49m/usr/bin/env if test ! -d /var/www/AgnuApp/releases/20141127114554; then echo "Directory does not exist '/var/www/AgnuApp/releases/20141127114554'" 1>&2; false; fi[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m5cbbd68d[0m] Command: [0;34;49mif test ! -d /var/www/AgnuApp/releases/20141127114554; then echo "Directory does not exist '/var/www/AgnuApp/releases/20141127114554'" 1>&2; false; fi[0m
[0;30;49mDEBUG[0m[[0;32;49m5cbbd68d[0m] Finished in 0.231 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;34;49mINFO[0m[[0;32;49m962f565a[0m] Running [0;33;49m/usr/bin/env echo "0c4e5d7" >> REVISION[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m962f565a[0m] Command: [0;34;49mcd /var/www/AgnuApp/releases/20141127114554 && /usr/bin/env echo "0c4e5d7" >> REVISION[0m
[0;34;49mINFO[0m[[0;32;49m962f565a[0m] Finished in 0.234 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;34;49mINFO[0m[[0;32;49m1ef108ac[0m] Running [0;33;49m/usr/bin/env rm -rf /var/www/AgnuApp/current[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m1ef108ac[0m] Command: [0;34;49m/usr/bin/env rm -rf /var/www/AgnuApp/current[0m
[0;34;49mINFO[0m[[0;32;49m1ef108ac[0m] Finished in 0.231 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;34;49mINFO[0m[[0;32;49md5e796c0[0m] Running [0;33;49m/usr/bin/env ln -s /var/www/AgnuApp/releases/20141127114554 /var/www/AgnuApp/current[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49md5e796c0[0m] Command: [0;34;49m/usr/bin/env ln -s /var/www/AgnuApp/releases/20141127114554 /var/www/AgnuApp/current[0m
[0;34;49mINFO[0m[[0;32;49md5e796c0[0m] Finished in 0.234 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;30;49mDEBUG[0m[[0;32;49m35b06a56[0m] Running [0;33;49m/usr/bin/env ls -x /var/www/AgnuApp/releases[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m35b06a56[0m] Command: [0;34;49m/usr/bin/env ls -x /var/www/AgnuApp/releases[0m
[0;30;49mDEBUG[0m[[0;32;49m35b06a56[0m] [0;32;49m	20141126141115	20141126141155	20141127112927	20141127114554
[0m[0;30;49mDEBUG[0m[[0;32;49m35b06a56[0m] Finished in 0.266 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;30;49mDEBUG[0m[[0;32;49m8f101553[0m] Running [0;33;49m/usr/bin/env if test ! -d /var/www/AgnuApp/releases; then echo "Directory does not exist '/var/www/AgnuApp/releases'" 1>&2; false; fi[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m8f101553[0m] Command: [0;34;49mif test ! -d /var/www/AgnuApp/releases; then echo "Directory does not exist '/var/www/AgnuApp/releases'" 1>&2; false; fi[0m
[0;30;49mDEBUG[0m[[0;32;49m8f101553[0m] Finished in 0.234 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;34;49mINFO[0m[[0;32;49m0c92c11d[0m] Running [0;33;49m/usr/bin/env echo "Branch master (at 0c4e5d7) deployed as release 20141127114554 by smurdock" >> /var/www/AgnuApp/revisions.log[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m0c92c11d[0m] Command: [0;34;49mecho "Branch master (at 0c4e5d7) deployed as release 20141127114554 by smurdock" >> /var/www/AgnuApp/revisions.log[0m
[0;34;49mINFO[0m[[0;32;49m0c92c11d[0m] Finished in 0.233 seconds with exit status 0 ([0;32;49msuccessful[0m).
cap aborted!
Don't know how to build task 'trace'
/home/smurdock/.rvm/gems/ruby-1.9.2-p320@rails3tutorial/gems/capistrano-3.2.1/lib/capistrano/application.rb:15:in `run'
/home/smurdock/.rvm/gems/ruby-1.9.2-p320@rails3tutorial/gems/capistrano-3.2.1/bin/cap:3:in `<top (required)>'
/home/smurdock/.rvm/gems/ruby-1.9.2-p320@rails3tutorial/bin/cap:19:in `load'
/home/smurdock/.rvm/gems/ruby-1.9.2-p320@rails3tutorial/bin/cap:19:in `<main>'
/home/smurdock/.rvm/gems/ruby-1.9.2-p320@rails3tutorial/bin/ruby_noexec_wrapper:14:in `eval'
/home/smurdock/.rvm/gems/ruby-1.9.2-p320@rails3tutorial/bin/ruby_noexec_wrapper:14:in `<main>'
(See full trace by running task with --trace)
The deploy has failed with an error: #<RuntimeError: Don't know how to build task 'trace'>
]0;smurdock@bintapp3: ~/rails_projects/agnu_appsmurdock@bintapp3:~/rails_projects/agnu_app$ cap production deploy -- trace[K[K[K[K[K[Ktrace
** Invoke production (first_time)
** Execute production
** Invoke load:defaults (first_time)
** Execute load:defaults
** Invoke deploy (first_time)
** Execute deploy
** Invoke deploy:starting (first_time)
** Execute deploy:starting
** Invoke deploy:check (first_time)
** Execute deploy:check
** Invoke git:check (first_time)
** Invoke git:wrapper (first_time)
** Execute git:wrapper
[0;34;49mINFO[0m[[0;32;49mc901e33a[0m] Running [0;33;49m/usr/bin/env mkdir -p /tmp/AgnuApp/[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49mc901e33a[0m] Command: [0;34;49m/usr/bin/env mkdir -p /tmp/AgnuApp/[0m
[0;34;49mINFO[0m[[0;32;49mc901e33a[0m] Finished in 1.765 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;30;49mDEBUG[0mUploading /tmp/AgnuApp/git-ssh.sh 0.0%
[0;34;49mINFO[0mUploading /tmp/AgnuApp/git-ssh.sh 100.0%
[0;34;49mINFO[0m[[0;32;49m9004106d[0m] Running [0;33;49m/usr/bin/env chmod +x /tmp/AgnuApp/git-ssh.sh[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m9004106d[0m] Command: [0;34;49m/usr/bin/env chmod +x /tmp/AgnuApp/git-ssh.sh[0m
[0;34;49mINFO[0m[[0;32;49m9004106d[0m] Finished in 0.233 seconds with exit status 0 ([0;32;49msuccessful[0m).
** Execute git:check
[0;30;49mDEBUG[0m[[0;32;49mfe4e21d1[0m] Running [0;33;49m/usr/bin/env git ls-remote -h git@github.com:FeetyPelk/agnu_app.git[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49mfe4e21d1[0m] Command: [0;34;49m( GIT_ASKPASS=/bin/echo GIT_SSH=/tmp/AgnuApp/git-ssh.sh /usr/bin/env git ls-remote -h git@github.com:FeetyPelk/agnu_app.git )[0m
[0;30;49mDEBUG[0m[[0;32;49mfe4e21d1[0m] [0;32;49m	0c4e5d7c14572a24530a7bb4e2e083e6d7dfc107	refs/heads/master
[0m[0;30;49mDEBUG[0m[[0;32;49mfe4e21d1[0m] Finished in 1.365 seconds with exit status 0 ([0;32;49msuccessful[0m).
** Invoke deploy:check:directories (first_time)
** Execute deploy:check:directories
[0;34;49mINFO[0m[[0;32;49mf634e960[0m] Running [0;33;49m/usr/bin/env mkdir -pv /var/www/AgnuApp/shared /var/www/AgnuApp/releases[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49mf634e960[0m] Command: [0;34;49m/usr/bin/env mkdir -pv /var/www/AgnuApp/shared /var/www/AgnuApp/releases[0m
[0;34;49mINFO[0m[[0;32;49mf634e960[0m] Finished in 0.229 seconds with exit status 0 ([0;32;49msuccessful[0m).
** Invoke deploy:check:linked_dirs (first_time)
** Execute deploy:check:linked_dirs
** Invoke deploy:check:make_linked_dirs (first_time)
** Execute deploy:check:make_linked_dirs
** Invoke deploy:check:linked_files (first_time)
** Execute deploy:check:linked_files
** Invoke deploy:set_previous_revision (first_time)
** Execute deploy:set_previous_revision
[0;30;49mDEBUG[0m[[0;32;49m6a6978f2[0m] Running [0;33;49m/usr/bin/env [ -f /var/www/AgnuApp/current/REVISION ][0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m6a6978f2[0m] Command: [0;34;49m[ -f /var/www/AgnuApp/current/REVISION ][0m
[0;30;49mDEBUG[0m[[0;32;49m6a6978f2[0m] Finished in 0.229 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;30;49mDEBUG[0m[[0;32;49m48cc67d9[0m] Running [0;33;49m/usr/bin/env cat /var/www/AgnuApp/current/REVISION 2>/dev/null[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m48cc67d9[0m] Command: [0;34;49m/usr/bin/env cat /var/www/AgnuApp/current/REVISION 2>/dev/null[0m
[0;30;49mDEBUG[0m[[0;32;49m48cc67d9[0m] [0;32;49m	0c4e5d7
[0m[0;30;49mDEBUG[0m[[0;32;49m48cc67d9[0m] Finished in 0.230 seconds with exit status 0 ([0;32;49msuccessful[0m).
** Invoke deploy:started (first_time)
** Execute deploy:started
** Invoke deploy:updating (first_time)
** Invoke deploy:new_release_path (first_time)
** Execute deploy:new_release_path
** Execute deploy:updating
** Invoke git:create_release (first_time)
** Invoke git:update (first_time)
** Invoke git:clone (first_time)
** Invoke git:wrapper 
** Execute git:clone
[0;30;49mDEBUG[0m[[0;32;49m7d630e3f[0m] Running [0;33;49m/usr/bin/env [ -f /var/www/AgnuApp/repo/HEAD ][0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m7d630e3f[0m] Command: [0;34;49m[ -f /var/www/AgnuApp/repo/HEAD ][0m
[0;30;49mDEBUG[0m[[0;32;49m7d630e3f[0m] Finished in 0.234 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;34;49mINFO[0mThe repository mirror is at /var/www/AgnuApp/repo
** Execute git:update
[0;30;49mDEBUG[0m[[0;32;49me18d1355[0m] Running [0;33;49m/usr/bin/env if test ! -d /var/www/AgnuApp/repo; then echo "Directory does not exist '/var/www/AgnuApp/repo'" 1>&2; false; fi[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49me18d1355[0m] Command: [0;34;49mif test ! -d /var/www/AgnuApp/repo; then echo "Directory does not exist '/var/www/AgnuApp/repo'" 1>&2; false; fi[0m
[0;30;49mDEBUG[0m[[0;32;49me18d1355[0m] Finished in 0.233 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;34;49mINFO[0m[[0;32;49m447a18b5[0m] Running [0;33;49m/usr/bin/env git remote update[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m447a18b5[0m] Command: [0;34;49mcd /var/www/AgnuApp/repo && ( GIT_ASKPASS=/bin/echo GIT_SSH=/tmp/AgnuApp/git-ssh.sh /usr/bin/env git remote update )[0m
[0;30;49mDEBUG[0m[[0;32;49m447a18b5[0m] [0;32;49m	Fetching origin
[0m[0;34;49mINFO[0m[[0;32;49m447a18b5[0m] Finished in 1.377 seconds with exit status 0 ([0;32;49msuccessful[0m).
** Execute git:create_release
[0;30;49mDEBUG[0m[[0;32;49m712bc5a9[0m] Running [0;33;49m/usr/bin/env if test ! -d /var/www/AgnuApp/repo; then echo "Directory does not exist '/var/www/AgnuApp/repo'" 1>&2; false; fi[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m712bc5a9[0m] Command: [0;34;49mif test ! -d /var/www/AgnuApp/repo; then echo "Directory does not exist '/var/www/AgnuApp/repo'" 1>&2; false; fi[0m
[0;30;49mDEBUG[0m[[0;32;49m712bc5a9[0m] Finished in 0.226 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;34;49mINFO[0m[[0;32;49m2fb2f6a4[0m] Running [0;33;49m/usr/bin/env mkdir -p /var/www/AgnuApp/releases/20141127114627[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m2fb2f6a4[0m] Command: [0;34;49mcd /var/www/AgnuApp/repo && ( GIT_ASKPASS=/bin/echo GIT_SSH=/tmp/AgnuApp/git-ssh.sh /usr/bin/env mkdir -p /var/www/AgnuApp/releases/20141127114627 )[0m
[0;34;49mINFO[0m[[0;32;49m2fb2f6a4[0m] Finished in 0.234 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;34;49mINFO[0m[[0;32;49m0d5f392c[0m] Running [0;33;49m/usr/bin/env git archive master | tar -x -C /var/www/AgnuApp/releases/20141127114627[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m0d5f392c[0m] Command: [0;34;49mcd /var/www/AgnuApp/repo && ( GIT_ASKPASS=/bin/echo GIT_SSH=/tmp/AgnuApp/git-ssh.sh /usr/bin/env git archive master | tar -x -C /var/www/AgnuApp/releases/20141127114627 )[0m
[0;34;49mINFO[0m[[0;32;49m0d5f392c[0m] Finished in 0.260 seconds with exit status 0 ([0;32;49msuccessful[0m).
** Invoke deploy:set_current_revision (first_time)
** Execute deploy:set_current_revision
** Invoke git:set_current_revision (first_time)
** Execute git:set_current_revision
[0;30;49mDEBUG[0m[[0;32;49m4a6914de[0m] Running [0;33;49m/usr/bin/env if test ! -d /var/www/AgnuApp/repo; then echo "Directory does not exist '/var/www/AgnuApp/repo'" 1>&2; false; fi[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m4a6914de[0m] Command: [0;34;49mif test ! -d /var/www/AgnuApp/repo; then echo "Directory does not exist '/var/www/AgnuApp/repo'" 1>&2; false; fi[0m
[0;30;49mDEBUG[0m[[0;32;49m4a6914de[0m] Finished in 0.229 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;30;49mDEBUG[0m[[0;32;49m189a20ee[0m] Running [0;33;49m/usr/bin/env git rev-parse --short master[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m189a20ee[0m] Command: [0;34;49mcd /var/www/AgnuApp/repo && ( GIT_ASKPASS=/bin/echo GIT_SSH=/tmp/AgnuApp/git-ssh.sh /usr/bin/env git rev-parse --short master )[0m
[0;30;49mDEBUG[0m[[0;32;49m189a20ee[0m] [0;32;49m	0c4e5d7
[0m[0;30;49mDEBUG[0m[[0;32;49m189a20ee[0m] Finished in 0.234 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;30;49mDEBUG[0m[[0;32;49m38a2dca1[0m] Running [0;33;49m/usr/bin/env if test ! -d /var/www/AgnuApp/releases/20141127114627; then echo "Directory does not exist '/var/www/AgnuApp/releases/20141127114627'" 1>&2; false; fi[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m38a2dca1[0m] Command: [0;34;49mif test ! -d /var/www/AgnuApp/releases/20141127114627; then echo "Directory does not exist '/var/www/AgnuApp/releases/20141127114627'" 1>&2; false; fi[0m
[0;30;49mDEBUG[0m[[0;32;49m38a2dca1[0m] Finished in 0.231 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;34;49mINFO[0m[[0;32;49m580b6498[0m] Running [0;33;49m/usr/bin/env echo "0c4e5d7" >> REVISION[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m580b6498[0m] Command: [0;34;49mcd /var/www/AgnuApp/releases/20141127114627 && /usr/bin/env echo "0c4e5d7" >> REVISION[0m
[0;34;49mINFO[0m[[0;32;49m580b6498[0m] Finished in 0.233 seconds with exit status 0 ([0;32;49msuccessful[0m).
** Invoke deploy:symlink:shared (first_time)
** Execute deploy:symlink:shared
** Invoke deploy:symlink:linked_files (first_time)
** Execute deploy:symlink:linked_files
** Invoke deploy:symlink:linked_dirs (first_time)
** Execute deploy:symlink:linked_dirs
** Invoke deploy:updated (first_time)
** Execute deploy:updated
** Invoke deploy:publishing (first_time)
** Execute deploy:publishing
** Invoke deploy:symlink:release (first_time)
** Execute deploy:symlink:release
[0;34;49mINFO[0m[[0;32;49m8ff0bcce[0m] Running [0;33;49m/usr/bin/env rm -rf /var/www/AgnuApp/current[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m8ff0bcce[0m] Command: [0;34;49m/usr/bin/env rm -rf /var/www/AgnuApp/current[0m
[0;34;49mINFO[0m[[0;32;49m8ff0bcce[0m] Finished in 0.230 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;34;49mINFO[0m[[0;32;49m1182f1b1[0m] Running [0;33;49m/usr/bin/env ln -s /var/www/AgnuApp/releases/20141127114627 /var/www/AgnuApp/current[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m1182f1b1[0m] Command: [0;34;49m/usr/bin/env ln -s /var/www/AgnuApp/releases/20141127114627 /var/www/AgnuApp/current[0m
[0;34;49mINFO[0m[[0;32;49m1182f1b1[0m] Finished in 0.229 seconds with exit status 0 ([0;32;49msuccessful[0m).
** Invoke deploy:restart (first_time)
** Execute deploy:restart
** Invoke deploy:clear_cache (first_time)
** Execute deploy:clear_cache
** Invoke deploy:published (first_time)
** Execute deploy:published
** Invoke deploy:finishing (first_time)
** Execute deploy:finishing
** Invoke deploy:cleanup (first_time)
** Execute deploy:cleanup
[0;30;49mDEBUG[0m[[0;32;49m244c609c[0m] Running [0;33;49m/usr/bin/env ls -x /var/www/AgnuApp/releases[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m244c609c[0m] Command: [0;34;49m/usr/bin/env ls -x /var/www/AgnuApp/releases[0m
[0;30;49mDEBUG[0m[[0;32;49m244c609c[0m] [0;32;49m	20141126141115	20141126141155	20141127112927	20141127114554	20141127114627
[0m[0;30;49mDEBUG[0m[[0;32;49m244c609c[0m] Finished in 0.237 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;34;49mINFO[0mKeeping 5 of 5 deployed releases on 54.69.186.29
[0;34;49mINFO[0mNo old releases (keeping newest 5) on 54.69.186.29
** Invoke deploy:finished (first_time)
** Execute deploy:finished
** Invoke deploy:log_revision (first_time)
** Execute deploy:log_revision
[0;30;49mDEBUG[0m[[0;32;49m8eb2b038[0m] Running [0;33;49m/usr/bin/env if test ! -d /var/www/AgnuApp/releases; then echo "Directory does not exist '/var/www/AgnuApp/releases'" 1>&2; false; fi[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m8eb2b038[0m] Command: [0;34;49mif test ! -d /var/www/AgnuApp/releases; then echo "Directory does not exist '/var/www/AgnuApp/releases'" 1>&2; false; fi[0m
[0;30;49mDEBUG[0m[[0;32;49m8eb2b038[0m] Finished in 0.229 seconds with exit status 0 ([0;32;49msuccessful[0m).
[0;34;49mINFO[0m[[0;32;49m739ef464[0m] Running [0;33;49m/usr/bin/env echo "Branch master (at 0c4e5d7) deployed as release 20141127114627 by smurdock" >> /var/www/AgnuApp/revisions.log[0m on [0;34;49m54.69.186.29[0m
[0;30;49mDEBUG[0m[[0;32;49m739ef464[0m] Command: [0;34;49mecho "Branch master (at 0c4e5d7) deployed as release 20141127114627 by smurdock" >> /var/www/AgnuApp/revisions.log[0m
[0;34;49mINFO[0m[[0;32;49m739ef464[0m] Finished in 0.232 seconds with exit status 0 ([0;32;49msuccessful[0m).
]0;smurdock@bintapp3: ~/rails_projects/agnu_appsmurdock@bintapp3:~/rails_projects/agnu_app$ cap production deploy --trace[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[K[Kexit
exit

Script done on Thu 27 Nov 2014 06:58:50 AM EST
