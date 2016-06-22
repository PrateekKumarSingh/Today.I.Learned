Function Get-Vars
{
    Param(
            [Switch] $AllTabs
    )
    
    Begin
    {
        If($AllTabs)
        {$Files = $psise.CurrentPowerShellTab.Files}
        else
        {$Files = $psISE.CurrentFile}
    }
    Process
    {
        $Files | %{ 
        $pv = $_
        [System.Management.Automation.PSParser]::Tokenize($PV.Editor.Text, [ref]$null)|`
        Where-Object {$_.Type -eq 'Variable'} |`
        select @{n='VariableName';e={'$'+$_.content}},@{n='FileName';e={$PV.DisplayName}}, @{n='Line';e={$_.startline}},@{n='Column';e={$_.StartColumn}}
        }
    }
    End
    {}

}
