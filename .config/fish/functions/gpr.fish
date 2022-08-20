# Open the Pull Request URL for your current directory's branch (base branch defaults to main)
function openpr
  set github_url (git remote -v | awk '/fetch/{print $argv[2]}' | sed -Ee 's#(git@|git://)#https://#' -e 's@com:@com/@' -e 's%\.git$%%' | awk '/github/')
  set branch_name (git symbolic-ref HEAD | cut -d"/" -f 3,4)
  set pr_url $github_url"/compare/main..."$branch_name
  open $pr_url
end
 
# Run git push and then immediately open the Pull Request URL
function gpr
  git push origin HEAD
 
  if $status -eq 0
    openpr
  else
    echo 'failed to push commits and open a pull request.'
end
