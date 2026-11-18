# Initialize Local Database for CampusExam
$ErrorActionPreference = 'Continue'

$possiblePaths = @(
    "C:\Program Files\PostgreSQL\16\bin",
    "C:\Program Files\PostgreSQL\17\bin",
    "C:\Program Files\PostgreSQL\15\bin"
)

$binPath = $null
foreach ($p in $possiblePaths) {
    if (Test-Path "$p\psql.exe") {
        $binPath = $p
        break
    }
}

if (-not $binPath) {
    Write-Host "PostgreSQL bin directory not found. Please verify PostgreSQL is installed." -ForegroundColor Red
    exit 1
}

Write-Host "Found PostgreSQL at: $binPath" -ForegroundColor Green
$env:PGPASSWORD = "password"

Write-Host "Creating user 'campusexam'..." -ForegroundColor Yellow
& "$binPath\psql.exe" -U postgres -p 5432 -c "DO \`$do\`$ BEGIN IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'campusexam') THEN CREATE ROLE campusexam WITH LOGIN SUPERUSER PASSWORD 'password'; END IF; END \`$do\`$;"

Write-Host "Creating database 'campusexam'..." -ForegroundColor Yellow
& "$binPath\psql.exe" -U postgres -p 5432 -c "SELECT 'CREATE DATABASE campusexam OWNER campusexam' WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'campusexam')\gexec"

Write-Host "Applying database dump / schema..." -ForegroundColor Yellow
$dumpFile = "$PSScriptRoot\database_dump.sql"
if (-not (Test-Path $dumpFile)) { $dumpFile = "$PSScriptRoot\CampusExam\database_dump.sql" }
if (Test-Path $dumpFile) {
    Write-Host "Restoring complete database state from database_dump.sql..." -ForegroundColor Cyan
    & "$binPath\psql.exe" -U campusexam -d campusexam -p 5432 -f $dumpFile
    Write-Host "Database successfully restored into 'campusexam'!" -ForegroundColor Green
} else {
    $schemaFile = "$PSScriptRoot\CampusExam\schema.sql"
    if (Test-Path $schemaFile) {
        & "$binPath\psql.exe" -U campusexam -d campusexam -p 5432 -f $schemaFile
        Write-Host "Schema successfully loaded into 'campusexam'!" -ForegroundColor Green
    }
}

# Update or reset CampusExam/.env to local
$envFile = "$PSScriptRoot\CampusExam\.env"
$localEnv = @"
# Local Development Database Configuration
DB_URL=jdbc:postgresql://localhost:5432/campusexam
DB_USER=campusexam
DB_PASSWORD=password
BOOTSTRAP_USER=admin
BOOTSTRAP_PASSWORD=password1234
"@
Set-Content -Path $envFile -Value $localEnv -Encoding UTF8
Write-Host "CampusExam\.env configured for local development." -ForegroundColor Green
Write-Host "`nYou are ready! You can now run 'start-campusexam.bat' to launch the entire platform." -ForegroundColor Cyan
