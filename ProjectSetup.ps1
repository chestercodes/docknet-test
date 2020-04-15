mkdir src

mkdir src/MyProject
dotnet new console -o src/MyProject

mkdir src/MyProject.Domain
dotnet new classlib -o src/MyProject.Domain

mkdir src/MyProject.Services
dotnet new classlib -o src/MyProject.Services

mkdir src/MyProject.Domain.Tests
dotnet new nunit -lang "f#" -o src/MyProject.Domain.Tests

mkdir src/MyProject.Services.Tests
dotnet new nunit -lang "f#" -o src/MyProject.Services.Tests 

dotnet add .\src\MyProject.Services\MyProject.Services.csproj reference .\src\MyProject.Domain\MyProject.Domain.fsproj
dotnet add .\src\MyProject.Domain.Tests\MyProject.Domain.Tests.fsproj reference .\src\MyProject.Domain\MyProject.Domain.fsproj
dotnet add .\src\MyProject.Services.Tests\MyProject.Services.Tests.fsproj reference .\src\MyProject.Domain\MyProject.Domain.fsproj
dotnet add .\src\MyProject.Services.Tests\MyProject.Services.Tests.fsproj reference .\src\MyProject.Services\MyProject.Services.csproj
