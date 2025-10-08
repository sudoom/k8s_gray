FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /src

# Copy csproj and restore as distinct layers
COPY ["Tailspin.SpaceGame.LeaderboardContainer/Tailspin.SpaceGame.LeaderboardContainer.csproj", "Tailspin.SpaceGame.LeaderboardContainer/"]
RUN dotnet restore "Tailspin.SpaceGame.LeaderboardContainer/Tailspin.SpaceGame.LeaderboardContainer.csproj"

# Copy everything else and build
COPY . .
WORKDIR "/src/Tailspin.SpaceGame.LeaderboardContainer"
RUN dotnet publish "Tailspin.SpaceGame.LeaderboardContainer.csproj" -c Release -o /app/publish

# Final stage
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
EXPOSE 80

# Create a non-root user and group
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
# Copy files and set permissions
COPY --from=build /app/publish .
RUN chown -R appuser:appgroup .
USER appuser

ENTRYPOINT ["dotnet", "Tailspin.SpaceGame.LeaderboardContainer.dll"]