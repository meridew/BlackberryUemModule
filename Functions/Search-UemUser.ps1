function Search-UemUser
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)][ValidateSet('EMEA', 'APAC', 'AMER')][string]$Region,
        [Parameter(Mandatory = $true)][string]$SearchString,
        [Parameter(Mandatory = $true)][string]$SearchField
    )

    $functionConfig = Get-UemApiFunctionConfig $MyInvocation.MyCommand.Name $Region

    $functionConfig.Uri = $functionConfig.Uri -replace '{searchString}', $SearchString
    $functionConfig.Uri = $functionConfig.Uri -replace '{searchField}', $SearchField
}

    <#  Search-UemUser
        Field	                Type	Description	Supports prefix matching	Supports contains matching
        appConfigGuid	        string	GUID of an application configuration of directly-assigned application.	No	No
        directoryId	            string	Unique identifier of the user in a company directory.	No	No
        displayName	            string	Display name of the user.	Yes	Yes
        firstName	            string	First name of the user.	Yes	Yes
        lastName	            string	Last name of the user.	Yes	Yes
        dynamicsContainerId	    string	GUID of a Dynamics container. If field is specified then any other query fields are ignored.	No	No
        ecoid	                string	Eco id of the user.	No	No
        effectiveAppConfigGuid	string	GUID of an effective application configuration of directly or indirectly assigned application.	No	No
        emailAddress	        string	Email address of the user.	Yes	Yes
        groupGuid	            string	GUID of a directly-assigned group.	No	No
        guid	                string	GUID of the user.	No	No
        isAdmin	                boolean	Filter based on whether user is admin or not. If field is not specified then all the users will be returned	No	No
        profileGuid	            string	GUID of a directly-assigned profile.	No	No
        username	            string	Username of the user.	Yes	No
    #>