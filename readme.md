pip install git+https://github.com/Glaysia/PeetsFEA.git@0.1.8#egg=PeetsFEA

pkill -9 -f 'run_1.sh|python|ansys|MAX|3d'

Get-CimInstance Win32_Process |
  Where-Object {
    $_.CommandLine -like '*run_1.bat*' -or
    $_.CommandLine -like '*python*'    -or
    $_.CommandLine -like '*ansys*'     -or
    $_.CommandLine -like '*MAX*'       -or
    $_.CommandLine -like '*3d*'
  } |
  ForEach-Object { Stop-Process -Id $_.ProcessId -Force }
