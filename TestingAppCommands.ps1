 Login-AzureRmAccount
 $hostname = (Get-AzureRmWebApp -ResourceGroupName "dev-bcs-qmotion-shades-cloud" -Name "uat-bcs-qm-companyapp-app").DefaultHostName

 $url = 'https://'+$hostname
 Write-Output ($url)

 Try {
 [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
 $urlstatuscode = (Invoke-WebRequest -uri $url -UseBasicParsing -Method get).StatusCode
 Write-Output ($urlstatuscode)

 if($urlstatuscode -ne 200)
                {
                    Start-Sleep -Seconds 10
                    $urlstatuscode  = (Invoke-WebRequest -uri $url -UseBasicParsing -Method get -ErrorAction SilentlyContinue ).StatusCode
                }
    }
    catch [System.Net.WebException] {
            $Request = $_.Exception
            Write-host "Exception caught: $Request"
            #Write-Output -------------------------------------------------------------------------------
            
            $urlstatuscode = ($_.Exception.Response.StatusCode.value__ ).ToString().Trim()    
        }   