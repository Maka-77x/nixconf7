topLevel@{
  ...
}:
{
  unify.modules.dev.home = { config, ... }: {
    programs.git.enable = true;
    programs.git.userName = topLevel.config.flake.meta.users.${config.home.username}.name;
    programs.git.userEmail = topLevel.config.flake.meta.users.${config.home.username}.email;
    programs.git.ignores = [
      ".direnv"
    ];
    programs.git.aliases = {
      ll = "log --stat --abbrev-commit";
      co = "checkout";
      patch = "format-patch --stdout HEAD~1";
      rpatch = "reset --hard HEAD~1";
      lgg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
      lol = "log --graph --decorate --pretty=oneline --abbrev-commit";
      lola = "log --graph --decorate --pretty=oneline --abbrev-commit --all";
      clb = "!/home/user/bin/git-clean-local-branches";
      pf = "push --force-with-lease";
      rewrite = "rebase - x 'git commit - -amend - C HEAD - -date=\"$(date -R)\" && sleep 1.05'";
      # From https://gist.github.com/pksunkara/988716
      a = "add --all";
      ai = "add -i";
      #############
      ap = "apply";
      as = "apply --stat";
      ac = "apply --check";
      #############
      ama = "am --abort";
      amr = "am --resolved";
      ams = "am --skip";
      #############
      b = "branch";
      ba = "branch -a";
      bd = "branch -d";
      bdd = "branch -D";
      br = "branch -r";
      bc = "rev-parse --abbrev-ref HEAD";
      bu = ''!git rev-parse --abbrev-ref --symbolic-full-name "@{u}"'';
      recent-branches = "branch --sort=-committerdate";
      #############
      c = "commit";
      ca = "commit -a";
      cm = "commit -m";
      cam = "commit -am";
      cem = "commit --allow-empty -m";
      cd = "commit --amend";
      cad = "commit -a --amend";
      ced = "commit --allow-empty --amend";
      #############
      cl = "clone";
      cld = "clone --depth 1";
      clg = "!sh -c 'git clone git://github.com/$1 $(basename $1)' -";
      clgp = "!sh -c 'git clone git@github.com:$(git config --get user.username)/$1 $1' -";
      #############
      co-pr = "!sh -c 'git fetch origin refs/pull/$1/head:pull/$1 && git checkout pull/$1' -";
      cp = "cherry-pick";
      cpa = "cherry-pick --abort";
      cpc = "cherry-pick --continue";
      #############
      d = "diff";
      dp = "diff --patience";
      dc = "diff --cached";
      dk = "diff --check";
      dck = "diff --cached --check";
      dt = "difftool";
      dct = "difftool --cached";
      #############
      f = "fetch";
      fo = "fetch origin";
      fu = "fetch upstream";
      #############
      fp = "format-patch";
      #############
      fk = "fsck";
      #############
      g = "grep -p";
      #############
      l = "log --oneline";
      lg = "log --oneline --graph --decorate";
      #############
      ls = "ls-files";
      lsf = "!git ls-files | grep -i";
      #############
      m = "merge";
      ma = "merge --abort";
      mc = "merge --continue";
      ms = "merge --skip";
      #############
      o = "checkout";
      ob = "checkout -b";
      #############
      pr = "prune -v";
      #############
      ps = "push";
      psf = "push -f";
      psu = "push -u";
      pst = "push --tags";
      #############
      pso = "push origin";
      psao = "push --all origin";
      psfo = "push -f origin";
      psuo = "push -u origin";
      #############
      psom = "push origin master";
      psaom = "push --all origin master";
      psfom = "push -f origin master";
      psuom = "push -u origin master";
      psoc = "!git push origin $(git bc)";
      psaoc = "!git push --all origin $(git bc)";
      psfoc = "!git push -f origin $(git bc)";
      psuoc = "!git push -u origin $(git bc)";
      psdc = "!git push origin :$(git bc)";
      #############
      pl = "pull";
      pb = "pull --rebase";
      #############
      plo = "pull origin";
      pbo = "pull --rebase origin";
      plom = "pull origin master";
      ploc = "!git pull origin $(git bc)";
      pbom = "pull --rebase origin master";
      pboc = "!git pull --rebase origin $(git bc)";
      #############
      plu = "pull upstream";
      plum = "pull upstream master";
      pluc = "!git pull upstream $(git bc)";
      pbum = "pull --rebase upstream master";
      pbuc = "!git pull --rebase upstream $(git bc)";
      #############
      rb = "rebase";
      rba = "rebase --abort";
      rbc = "rebase --continue";
      rbi = "rebase --interactive";
      rbs = "rebase --skip";
      #############
      re = "reset";
      rh = "reset HEAD";
      reh = "reset --hard";
      rem = "reset --mixed";
      res = "reset --soft";
      rehh = "reset --hard HEAD";
      remh = "reset --mixed HEAD";
      resh = "reset --soft HEAD";
      #############
      r = "remote";
      ra = "remote add";
      rr = "remote rm";
      rv = "remote -v";
      rn = "remote rename";
      rp = "remote prune";
      rs = "remote show";
      rao = "remote add origin";
      rau = "remote add upstream";
      rro = "remote remove origin";
      rru = "remote remove upstream";
      rso = "remote show origin";
      rsu = "remote show upstream";
      rpo = "remote prune origin";
      rpu = "remote prune upstream";
      #############
      rmf = "rm -f";
      rmrf = "rm -r -f";
      #############
      s = "status";
      sb = "status -s -b";
      #############
      sa = "stash apply";
      sc = "stash clear";
      sd = "stash drop";
      sl = "stash list";
      sp = "stash pop";
      ss = "stash save";
      ssk = "stash save -k";
      sw = "stash show";
      st = "!git stash list | wc -l 2>/dev/null | grep -oEi '[0-9][0-9]*'";
      #############
      t = "tag";
      td = "tag -d";
      #############
      w = "show";
      wp = "show -p";
      wr = "show -p --no-color";
      #############
      subadd = "!sh -c 'git submodule add git://github.com/$1 $2/$(basename $1)' -";
      subup = "submodule update --init --recursive";
      subpull = "!git submodule foreach git pull --tags origin master";
      #############
      assume = "update-index --assume-unchanged";
      unassume = "update-index --no-assume-unchanged";
      assumed = "!git ls -v | grep ^h | cut -c 3-";
      unassumeall = "!git assumed | xargs git unassume";
      assumeall = "!git status -s | awk {'print $2'} | xargs git assume";
      #############
      bump = ''!sh -c 'git commit -am "Version bump v$1" && git psuoc && git release $1' -'';
      release = "!sh -c 'git tag v$1 && git pst' -";
      unrelease = "!sh -c 'git tag -d v$1 && git pso :v$1' -";
      merged = "!sh -c 'git o master && git plom && git bd $1 && git rpo' -";
      aliases = "!git config -l | grep alias | cut -c 7-";
      snap = "!git stash save 'snapshot = $(date)' && git stash apply 'stash@{0}'";
      bare = "!sh -c 'git symbolic-ref HEAD refs/heads/$1 && git rm --cached -r . && git clean -xfd' -";
      whois = ''!sh -c 'git log -i -1 --author="$1" --pretty="format:%an <%ae>"' -'';
      serve = "daemon --reuseaddr --verbose --base-path=. --export-all ./.git";
      #############
      behind = "!git rev-list --left-only --count $(git bu)...HEAD";
      ahead = "!git rev-list --right-only --count $(git bu)...HEAD";
      #############
      ours = "!f() { git checkout --ours $@ && git add $@; }; f";
      theirs = "!f() { git checkout --theirs $@ && git add $@; }; f";
      subrepo = "!sh -c 'git filter-branch --prune-empty --subdirectory-filter $1 master' -";
      human = "name-rev --name-only --refs=refs/heads/*";
    };
    programs.git.extraConfig.branch.autosetuprebase = "always";
    programs.git.extraConfig.color.ui = "auto";

    programs.git.extraConfig.core.autocrlf = "input";
    programs.git.extraConfig.core.editor = "micro";
    programs.git.extraConfig.core.safecrlf = "warn";
    programs.git.extraConfig.core.excludesfile = "~/.gitignore_global";

    programs.git.extraConfig.diff.mnemonicprefix = true;
    programs.git.extraConfig.include.path = "~/.gitconfig.local";

    programs.git.extraConfig.init.defaultBranch = "main";

    programs.git.extraConfig.merge.conflictstyle = "diff3";
    programs.git.extraConfig.merge.commit = "no";
    programs.git.extraConfig.merge.ff = "no";
    programs.git.extraConfig.merge.tool = "splice";

    programs.git.extraConfig.push.autoSetupRemote = true;
    programs.git.extraConfig.push.default = "current";

    programs.git.extraConfig.pull.default = "matching";
    programs.git.extraConfig.pull.rebase = true;

    programs.git.extraConfig.rebase.instructionFormat = "(%an <%ae>) %s";
    programs.git.extraConfig.rebase.updateRefs = true;

    programs.git.extraConfig.rerere.enabled = true;

    programs.git.extraConfig.sequence.editor = "code --wait";

    programs.git.extraConfig.signing.signByDefault = true;
    programs.git.extraConfig.signing.key = topLevel.config.flake.meta.users.${config.home.username}.key;
    programs.git.extraConfig.commit.gpgsign = true;

    };
}
