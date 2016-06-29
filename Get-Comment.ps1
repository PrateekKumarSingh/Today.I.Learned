Function Get-Comment
{
#-----BEGIN-----#
    # Condition to check ISE host
    If($Host.name -like "*ISE*")
    {
        # Tokenizing content of the current file
        ([System.Management.Automation.PSParser]::Tokenize($psISE.CurrentFile.Editor.Text, [ref]$null) | `
        # Filtering comments only from other tokens
        ?{$_.type -like "*comment*"}).content
    }
    else # In case ISE is not the Host
    {
        Write-Host "Works only in ISE host!"
    }
#------END------#
}
