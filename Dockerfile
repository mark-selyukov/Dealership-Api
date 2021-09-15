# https://hub.docker.com/_/microsoft-dotnet
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /source

# copy and publish app and libraries
COPY . .
RUN dotnet restore
RUN dotnet publish -c release -o /app

FROM migrate/migrate AS migration
COPY ./migrations /migrations

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:5.0
COPY --from=migration . .
WORKDIR /app
COPY --from=build /app .
EXPOSE 80
ENTRYPOINT ["dotnet", "/app/dealership.dll"]
