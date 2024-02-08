    
    function vc
    {
    param([string]$inputhash, [int]$method, [string]$path)
        
       Get-Content -Path $path | ForEach-Object{
            $content = $_ -split '\s+' | Where-Object { $_ -ne '' }
       }

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
                    Write-host "{$inputhash}:$c"
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
                    Write-host "{$inputhash}:$c"
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
                    Write-host "{$inputhash}:$c"
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
                    Write-host "{$inputhash}:$c"
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
                    break
                }

            } 
        }


       }





      

    }
    
    
    
    Write-host "         _________ _______ _________ _______           _______    _______          _________ _        _______          _________ _        _        _______ "
    Write-host "|\     /|\__   __/(  ____ \\__   __/(  ___  )|\     /|(  ____ \  (  ____ \|\     /|\__   __/( (    /|(  ____ \|\     /|\__   __/( \      ( \      (  ___  )"
    Write-host "| )   ( |   ) (   | (    \/   ) (   | (   ) || )   ( || (    \/  | (    \/| )   ( |   ) (   |  \  ( || (    \/| )   ( |   ) (   | (      | (      | (   ) |"
    Write-host "| |   | |   | |   | |         | |   | |   | || |   | || (_____   | |      | (___) |   | |   |   \ | || |      | (___) |   | |   | |      | |      | (___) |"
    Write-host "( (   ) )   | |   | |         | |   | |   | || |   | |(_____  )  | |      |  ___  |   | |   | (\ \) || |      |  ___  |   | |   | |      | |      |  ___  |"
    Write-host " \ \_/ /    | |   | |         | |   | |   | || |   | |      ) |  | |      | (   ) |   | |   | | \   || |      | (   ) |   | |   | |      | |      | (   ) |"
    Write-host "  \   /  ___) (___| (____/\___) (___| (___) || (___) |/\____) |  | (____/\| )   ( |___) (___| )  \  || (____/\| )   ( |___) (___| (____/\| (____/\| )   ( |"
    Write-host "   \_/   \_______/(_______/\_______/(_______)(_______)\_______)  (_______/|/     \|\_______/|/    )_)(_______/|/     \|\_______/(_______/(_______/|/     \|"
    Write-host "                                                                                                                                                           "

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

       
       vc $hash $encMethod $path

    }
    else 
    {
        Write-host "Wrong input format"
    }


