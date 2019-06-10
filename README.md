# 201-vm-log-analytics

## Creates a vm with log analytics and alerts enabled


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fshs110%2F201-vm-log-analytics%2Fmaster%2F201-vm-with-logAnalytics%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fshs110%2F201-vm-log-analytics%2Fmaster%2F201-vm-with-logAnalytics%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>


## Key Deployed Resources:

* Virtual Machine: Windows VM with nic containing a public IP for easy RDP. Also associates the nic to a newly created Vnet/subnet. The vm tag will be SampleData=*arm-deployment-name*,*guid-based-off-the-
current-arm-deployment-name-and-resourcegroup*. Note if this template is deployed via the portal, the default deployment name will be *Microsoft.Template*

* Log Analytics Workspace: The workspace which records the VM health heartbeats. First the workspace is created and then an extension is run on the VM to attach it to the deployed workspace. Note the name of the wokspace must be unique

* Action Group and Azure Monitor Alert rule: Creates a 'send email' action goup and then associates to a statically defined Alert rule. For testing purposes, this is set to trigger when the heartbeat count is less than 1 within a window of one minute. Note: it takes some time for the monitor to register the vm heartbeat. I tested it by leaving the vm one for 15 minutes before shutting it down. The user will receive a notification of being added to the action group once template has deployed

* DSC script to create text file: Runs a DSC configuration script to create a sampledata.txt file in the *C:/Windows/Temp* folder. The script can be viewed in the repository  
