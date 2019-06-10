configuration createTextFile
{
   param
    (
        [Parameter(Mandatory)]
        [string]$vmTagValue
    )
    Import-DscResource –ModuleName 'PSDesiredStateConfiguration'
    
    Node localhost{

    
        File CreateFile {
            DestinationPath = 'C:\Windows\Temp\sampledata.txt'
            Ensure = "Present"
            Contents = $vmTagValue
        }
        Log AfterDirectoryCopy
        {
            # The message below gets written to the Microsoft-Windows-Desired State Configuration/Analytic log
            Message = "Finished running the file resource with ID CreateFile"
            DependsOn = "[File]CreateFile" # This means run "CreateFile" first.
        }


    
    }
}