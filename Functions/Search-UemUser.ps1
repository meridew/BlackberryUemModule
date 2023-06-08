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

    Get the first 50 users that have a display name that starts with "M", sorted by username in descending order. If 50 users are returned, 
    there may be more matches that weren't returned. You can get the next "page" of users by sending the same request but also specifying offset=50. 
    If 50 users are returned again, you can get the third "page" of users by modifying the request again and specifying offset=100, and so on.
#>

function Search-UemUser
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)][ValidateSet('EMEA', 'APAC', 'AMER')][string]$Region,
        [Parameter(Mandatory = $true)][ValidateSet('guid', 'displayName', 'firstName', 'lastName', 'emailAddress', 'username', 'groupGuid')][string]$SearchField,
        [Parameter(Mandatory = $true)][string]$SearchString
    )

    $functionConfig = Get-UemApiFunctionConfig $MyInvocation.MyCommand.Name $Region

    $functionConfig.Uri = $functionConfig.Uri -replace '{searchField}', $SearchField
    $functionConfig.Uri = $functionConfig.Uri -replace '{searchString}', $SearchString
    $functionConfig.Uri = $functionConfig.Uri -replace '{pageSize}', $PageSize
    
    return Invoke-UemApiCall @functionConfig
}