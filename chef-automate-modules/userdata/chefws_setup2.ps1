param(
[string] $password = "$1"
)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned  -Force
cd C:\opscode\chefdk\bin
wusa /uninstall /kb:4025336 /quiet /norestart
netsh advfirewall firewall set rule name="Windows Remote Management (HTTP-In)" profile=public protocol=tcp localport=5985 remoteip=localsubnet new remoteip=any
netsh advfirewall firewall set rule name="Windows Remote Management (HTTP-In)" profile=public protocol=tcp localport=443 remoteip=localsubnet new remoteip=any
winrm quickconfig -q
chef generate app c:\users\chef-repo
git clone https://github.com/sysgain/ChefAutomateTD_Cookbooks.git c:/users/cookbookstore
echo c:\Users\chef-repo\.chef\knife.rb | knife configure --server-url https://10.0.0.3/organizations/orguser --validation-client-name orguser-validator --validation-key c:/Users/chef-repo/.chef/orguser-validator.pem --user delivery --repository c:/Users/chef-repo
echo n | & "C:\Program Files\PuTTY\pscp.exe"  -scp -pw Password@1234 ubuntu@10.0.0.3:/etc/opscode/delivery.pem C:\Users\chef-repo\.chef\delivery.pem
echo n | & "C:\Program Files\PuTTY\pscp.exe"  -scp -pw Password@1234 ubuntu@10.0.0.3:/etc/opscode/orguser-validator.pem C:\Users\chef-repo\.chef\orguser-validator.pem
cp -r C:\Users\cookbookstore\* C:\Users\chef-repo\cookbooks
mv C:\Users\chef-repo\cookbooks\roles C:\Users\chef-repo
cd C:\opscode\chefdk\bin\
knife ssl  fetch --config c:\Users\chef-repo\.chef\knife.rb
knife bootstrap windows winrm localhost --config c:\Users\chef-repo\.chef\knife.rb -x opc -P $password -N chefnode0
chef-client 
knife cookbook upload --config c:\Users\chef-repo\.chef\knife.rb compat_resource audit  ohai windows tissues  logrotate cron chef-client
knife role from file c:\users\chef-repo\roles\auditrun.json --config c:\Users\chef-repo\.chef\knife.rb 
knife node run_list set chefnode0 "role[auditrun]" --config c:\Users\chef-repo\.chef\knife.rb
chef-client
