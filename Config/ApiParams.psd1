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
        'Uri'     = '/api/v1/users?searchString={searchString}&searchField={searchField}'
        'Method'  = 'GET'
        'Headers' = @{
            'content-type'  = 'application/vnd.blackberry.users-v1+json'
            'authorization' = ''
        }

    }
}