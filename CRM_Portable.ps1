# Function to create the folders and open them
function Create-CRMFolder {
    $documentsPath = [Environment]::GetFolderPath('MyDocuments')
    $folderPathCRMPortable = Join-Path -Path $documentsPath -ChildPath "CRM PORTABLE"
    $folderPathCRM = Join-Path -Path $folderPathCRMPortable -ChildPath "CRMPH"
    $folderPathERP = Join-Path -Path $folderPathCRMPortable -ChildPath "ERP-PH"

    # Create folders if they don't exist
    if (-not (Test-Path -Path $folderPathCRMPortable)) {
        New-Item -ItemType Directory -Path $folderPathCRMPortable | Out-Null
    }

    if (-not (Test-Path -Path $folderPathCRM)) {
        New-Item -ItemType Directory -Path $folderPathCRM | Out-Null
    }

    if (-not (Test-Path -Path $folderPathERP)) {
        New-Item -ItemType Directory -Path $folderPathERP | Out-Null
    }

    # Open the folders
    Start-Process "explorer.exe" $folderPathCRMPortable
    Start-Process "explorer.exe" $folderPathCRM
    Start-Process "explorer.exe" $folderPathERP

    # Add a green checkmark to the button without replacing the existing text
    $button.Content = "$($button.Content) ✔"
    $button.Foreground = 'Green'
}

# Create a simple UI
$window = New-Object -TypeName System.Windows.Window
$window.Title = "Crear Carpetas Apps"
$window.Width = 300
$window.Height = 150

$button = New-Object -TypeName System.Windows.Controls.Button
$button.Content = "Crear Carpetas"
$button.Width = 180
$button.Height = 50
$button.Margin = "50,30,50,30"
$button.Add_Click({ Create-CRMFolder })

$window.Content = $button
$window.WindowStartupLocation = 'CenterScreen'
$window.ShowDialog()
