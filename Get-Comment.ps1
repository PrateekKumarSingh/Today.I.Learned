Function Get-Comment
{
    If($Host.name -like "*ISE*")
    {
        ([System.Management.Automation.PSParser]::Tokenize($psISE.CurrentFile.Editor.Text, [ref]$null) | `
        ?{$_.type -like "*comment*"}).content
    }
    else 
    {
        Write-Host "Works only in ISE host!"
    }
}
