<# ADD USERS TO AD GROUP
1)- Type in your AD -SearchBase for users. Note the -Filter "*"
2)- Select which group you would like to add selected users (Add-ADGroupMember).
#>

Get-ADUser -SearchBase 'USER SEARCH GROUP GOES HERE' -Filter * | % {Add-ADGroupMember 'AD GROUP GOES HERE' -Members $_.DistinguishedName }