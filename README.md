# bash-tools
Scripts to automate some frequent, fiddly bash tasks.

`clean.sh` deals with the case where there are corrupt git tree objects. If you don't care about saving stashes or records of unpushed commits, this script automates the make temp directory / move non-git files / delete repo / reclone process. Run with `./clean -u GIT_SOURCE_USER -r GIT_REPO`. The script assumes the repo has the same name as its source.

`log_bleu.pl` extracts output from Moses' multi-bleu.pl script from a larger log file, and outputs the data only, in a format more convenient for later processing.
