@{

    'Get-UemAuthToken'   = @{
        'Uri'     = '/api/v1/util/authorization'
        'Method'  = 'POST'
        'Headers' = @{
            'Content-Type' = 'application/vnd.blackberry.authorizationrequest-v1+json'
        }
        'Body'    = @{
            'provider' = 'LOCAL'
            'username' = ''
            'password' = ''
        }
    }

    'Ping-UemHost'       = @{
        'Uri'     = '/api/v1/util/ping'
        'Method'  = 'GET'
        'Headers' = @{
            'ContentType'   = 'application/vnd.blackberry.pingrequest-v1+json'
            'authorization' = ''
        }
    }

    'Ping-UemHostSecure' = @{
        'Uri'     = '/api/v1/ping'
        'Method'  = 'GET'
        'Headers' = @{
            'content-type'  = 'application/vnd.blackberry.pingrequest-v1+json'
            'authorization' = ''
        }
    }

    'Get-UemUserDevices' = @{
        'Uri'     = '/api/v1/users/{userGuid}/userDevices'
        'Method'  = 'GET'
        'Headers' = @{
            'content-type'  = 'application/vnd.blackberry.userdevices-v1+json'
            'authorization' = ''
        }
    }

    'Search-UemUser'     = @{
        'Uri'     = '/api/v1/users?query={searchField}={searchString}'
        'Method'  = 'GET'
        'Headers' = @{
            'content-type'  = 'application/vnd.blackberry.users-v1+json'
            'authorization' = ''
        }
    }      

    'Search-UemAppGroup' = @{
        'Uri'     = '/api/v1/applicationGroups?query=name={$name}'
        'Method'  = 'GET'
        'Headers' = @{
            'content-type'  = 'application/vnd.blackberry.applicationgroups-v1+json'
            'authorization' = ''
        }
    }

    'Send-UemUserDeviceCommand' = @{
        'Uri'     = '/api/v1/users/{userGuid}/userDevices/{userDeviceGuid}/commands'
        'Method'  = 'POST'
        'Headers' = @{
            'content-type'  = 'application/vnd.blackberry.command-v1+json'
            'authorization' = ''
        }
    }

    'Get-UemUserDeviceCommandStatus' = @{
        'Uri'     = '/api/v1/users/{userGuid}/userDevices/{userDeviceGuid}/commands/{commandGuid}'
        'Method'  = 'GET'
        'Headers' = @{
            'content-type'  = 'application/vnd.blackberry.command-v1+json'
            'authorization' = ''
        }
    }
}