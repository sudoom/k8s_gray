FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy csproj and restore as distinct layers
COPY ["Tailspin.SpaceGame.Web/Tailspin.SpaceGame.Web.csproj", "Tailspin.SpaceGame.Web/"]
RUN dotnet restore "Tailspin.SpaceGame.Web/Tailspin.SpaceGame.Web.csproj"

# Copy everything else and build
COPY . .
WORKDIR "/src/Tailspin.SpaceGame.Web"
RUN dotnet publish "Tailspin.SpaceGame.Web.csproj" -c Release -o /app/publish

# Final stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
EXPOSE 80
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "Tailspin.SpaceGame.Web.dll"]