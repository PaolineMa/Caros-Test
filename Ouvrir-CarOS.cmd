@echo off
setlocal
set "CAROS_PREVIEW_DIR=%~dp0"
title CarOS - Apercu local
if not exist "%CAROS_PREVIEW_DIR%index.html" (
  echo Extrayez tout le ZIP avant de lancer CarOS.
  pause
  exit /b 1
)
echo Ouverture de CarOS dans votre navigateur.
echo Gardez cette fenetre ouverte pendant la consultation.
echo Le code d'acces est indique dans la conversation.
powershell.exe -NoLogo -NoProfile -Command ^
 "$ErrorActionPreference='Stop'; $html=[IO.File]::ReadAllBytes((Join-Path $env:CAROS_PREVIEW_DIR 'index.html')); $server=$null; $port=8765;" ^
 "foreach($candidate in 8765..8775){try{$socket=[Net.Sockets.TcpListener]::new([Net.IPAddress]::Loopback,$candidate);$socket.Start();$server=$socket;$port=$candidate;break}catch{if($socket){$socket.Stop()}}}; if(-not $server){Write-Host 'Aucun port local disponible.';exit 1};" ^
 "$url='http://127.0.0.1:'+$port+'/'; Write-Host ('CarOS local : '+$url); Start-Process $url; $nl=[Environment]::NewLine;" ^
 "try{while($true){$client=$server.AcceptTcpClient();try{$client.ReceiveTimeout=5000;$client.SendTimeout=5000;$stream=$client.GetStream();$reader=[IO.StreamReader]::new($stream,[Text.Encoding]::ASCII,$false,1024,$true);$line=$reader.ReadLine();if(-not $line){continue};$request=$line.Split(' ');while($true){$header=$reader.ReadLine();if([string]::IsNullOrEmpty($header)){break}};if($request[0] -eq 'GET' -and ($request[1] -eq '/' -or $request[1] -eq '/index.html')){$status='200 OK';$data=$html}else{$status='404 Not Found';$data=[Text.Encoding]::UTF8.GetBytes('Introuvable')};$text='HTTP/1.1 '+$status+$nl+'Content-Type: text/html; charset=utf-8'+$nl+'Content-Length: '+$data.Length+$nl+'Cache-Control: no-store'+$nl+'Connection: close'+$nl+$nl;$headers=[Text.Encoding]::ASCII.GetBytes($text);$stream.Write($headers,0,$headers.Length);$stream.Write($data,0,$data.Length);$stream.Flush()}catch{Write-Host 'Connexion locale interrompue.'}finally{$client.Close()}}}finally{$server.Stop()}"
echo CarOS est ferme.
pause
