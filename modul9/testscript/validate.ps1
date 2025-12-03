## Validate.ps1
# PowerShell script to validate Terraform code using multiple tools

Write-Host "🔍 Kjører Terraform validering..." -ForegroundColor Blue
Write-Host ""

# 1. Terraform Format
Write-Host "📝 Sjekker Terraform formattering..." -ForegroundColor Cyan
terraform fmt -check -recursive
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Kjør 'terraform fmt -recursive' for å fikse formattering" -ForegroundColor Red
}

# 2. Terraform Validate
Write-Host "`n✅ Kjører terraform validate..." -ForegroundColor Cyan
terraform validate

# 3. TFLint
Write-Host "`n🔎 Kjører TFLint..." -ForegroundColor Cyan
tflint --init
tflint

# 4. Checkov
Write-Host "`n🛡️  Kjører Checkov..." -ForegroundColor Cyan
checkov -d . --compact --skip-check CKV2_AZURE_1,CKV2_AZURE_21,CKV2_AZURE_33

Write-Host "`n✅ Validering utført!" -ForegroundColor Green