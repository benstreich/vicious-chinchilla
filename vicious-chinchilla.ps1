    
    function vc
    {
    param([string]$inputhash, [int]$method, [string]$path)
        
   
    $file = Get-Item -Path $path
    $estTimeSek = (($file.Length / 1KB) / 0.0068) / 34841.176

    Write-host "`n"

    if($estTimeSek -gt 60 -and $estTimeSek -lt 3600)
    {
        $estTimeMin = $estTimeSek / 60
         Write-host "Estimated Time: " -NoNewline
         Write-host "${estTimeMin}m" "`n" -ForegroundColor Green
    }

    elseif($estTimeSek -gt 3600 -and $estTimeSek -lt 86400)
    {
        $estTimeHour = $estTimeSek / 3600
         Write-host "Estimated Time: " -NoNewline
         Write-host "${estTimeHour}h" "`n" -ForegroundColor Green
    }
    elseif($estTimeSek -gt 86400)
    {
        $estTimeDays = $estTimeSek / 86400
        Write-host "Estimated Time: " -NoNewline
        Write-host "${estTimeDays}d" "`n" -ForegroundColor Green
    }

    else
    {
        Write-host "Estimated Time: " -NoNewline
        Write-host "${estTimeSek}s" "`n" -ForegroundColor Green
    }


    $reader = [System.IO.StreamReader]::new($path)

    while ($line = $reader.ReadLine()) {
        $content = ($line -split '\s+' | Where-Object { $_ -ne '' })
    }
    
    $reader.Close()

       switch($method)
       {
        0
        {  
            foreach($c in $content)
            {
            
             $byteArray = [System.Text.Encoding]::UTF8.GetBytes($c)
             $md5 = [System.Security.Cryptography.MD5]::Create()
             $hash = $md5.ComputeHash($byteArray)
             $hashString = [BitConverter]::ToString($hash) -replace '-', ''
             
                if($inputhash -eq $hashString)
                {
                    Write-host "{$inputhash}:" -NoNewline
                    Write-host $c -ForegroundColor DarkGreen
                    Start-Sleep -Seconds 60
                    break
                }

            } 
        }

        1
        {  
            foreach($c in $content)
            {
            
             $byteArray = [System.Text.Encoding]::UTF8.GetBytes($c)
             $sha1 = [System.Security.Cryptography.SHA1]::Create()
             $hash = $sha1.ComputeHash($byteArray)
             $hashString = [BitConverter]::ToString($hash) -replace '-', ''
             
                if($inputhash -eq $hashString)
                {
                   Write-host "{$inputhash}:" -NoNewline
                    Write-host $c -ForegroundColor DarkGreen
                    Start-Sleep -Seconds 60
                    break
                }

            } 
        }

        2
        {  
            foreach($c in $content)
            {
            
             $byteArray = [System.Text.Encoding]::UTF8.GetBytes($c)
             $sha256 = [System.Security.Cryptography.SHA256]::Create()
             $hash = $sha256.ComputeHash($byteArray)
             $hashString = [BitConverter]::ToString($hash) -replace '-', ''
             
                if($inputhash -eq $hashString)
                {
                    Write-host "{$inputhash}:" -NoNewline
                    Write-host $c -ForegroundColor DarkGreen
                    Start-Sleep -Seconds 60
                    break
                }

            } 
        }
       
        3
        {  
            foreach($c in $content)
            {
            
             $byteArray = [System.Text.Encoding]::UTF8.GetBytes($c)
             $sha384 = [System.Security.Cryptography.SHA384]::Create()
             $hash = $sha384.ComputeHash($byteArray)
             $hashString = [BitConverter]::ToString($hash) -replace '-', ''
             
                if($inputhash -eq $hashString)
                {
                    Write-host "{$inputhash}:" -NoNewline
                    Write-host $c -ForegroundColor DarkGreen
                    Start-Sleep -Seconds 60
                    break
                }

            } 
        }

        4
        {  
            foreach($c in $content)
            {
            
             $byteArray = [System.Text.Encoding]::UTF8.GetBytes($c)
             $sha512 = [System.Security.Cryptography.SHA512]::Create()
             $hash = $sha512.ComputeHash($byteArray)
             $hashString = [BitConverter]::ToString($hash) -replace '-', ''
             
                if($inputhash -eq $hashString)
                {
                    Write-host "{$inputhash}:$c"
                    Start-Sleep -Seconds 60
                    break
                }

            } 
        }


       }


    }
    
    $name = 'vicious-chinchilla.'
    $char = $name.ToCharArray()

    foreach($c in $char)
    {
        Write-host $c -NoNewline -ForegroundColor Darkblue
        Start-Sleep -Milliseconds 40
    }

    Write-host ""
    Start-Sleep -Seconds 1
    
    for($i = 0; $i -le 4; $i++)
    {
        switch($i)
        {
           
            1
            {
                Write-host $name -ForegroundColor Blue
                Start-Sleep -Milliseconds 100
            }
    
            2
            {
                Write-host $name -ForegroundColor Green
                Start-Sleep -Milliseconds 100
            }
            3
            {
                Write-host $name -ForegroundColor Yellow
                Start-Sleep -Milliseconds 100
            }
            4
            {
                Write-host $name -ForegroundColor Red
                Start-Sleep -Milliseconds 100
            }
        }
    }
    
    Write-host "`n"
    
    
    


    [string]$cmd = Read-Host "~$"
    
       if($cmd -match '-h' -or $cmd -match '--help')
        {
            Write-host "vicious chinchilla Input format:
            ---------------------------------------------

            hash;        | Your Hash;
            [-p[string]] | Path to your Wordlist;
            [-e[int]]    | Encryption method;

            ---------------------------------------------

            List of encryption methods;
            0            | MD5;
            1            | SHA1;
            2            | SHA256;
            3            | SHA384;
            4            | SHA512; 
            "
        }


    if($cmd -like "*;*" -and $cmd -like "*-*")
    {
        if($cmd -notlike '*-e*' -or $cmd -notlike '*-p*')
        {
            Write-host "Please provide the encryption method and the path of your wordlist"
            break
        }

     


        $parts = $cmd -split(';')
        $hash = $parts[0].Trim()

        if($cmd -match '-e(\d+)')
        {
            $encMethod = $Matches[1]
        }
        if($cmd -match '-p(\S+)')
        {
            $path = $Matches[1]
        }

       Measure-Command{
       vc $hash $encMethod $path
       }
    }

    else 
    {
        Write-host "Wrong input format"
    }


