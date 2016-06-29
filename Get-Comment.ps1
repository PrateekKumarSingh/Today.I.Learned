Function Get-Comment
{
Param([Parameter(Position=0)] [String] $FilePath,[Switch] $FromClipBoard)

    If($FilePath)
    {
        $Content = Get-Content $FilePath 
    }
    elseif($FromClipBoard)
    {
        $Content = [Windows.clipboard]::GetText()
    }
    else
    {
        Write-Host "Please provide a file/content to look for comments."
    }

    ([System.Management.Automation.PSParser]::Tokenize($Content, [ref]$null) | `
        Where-Object{$_.type -like "*comment*"}).content
}
