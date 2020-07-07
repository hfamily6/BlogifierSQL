FROM mcr.microsoft.com/dotnet/core/sdk:3.1 as build
WORKDIR /build
COPY . .
RUN dotnet restore
RUN dotnet publish -c Release -o /app

FROM mcr.microsoft.com/dotnet/core/sdk:3.1 as final
WORKDIR /app
COPY --from=build /app .
ENV ASPNETCORE_URLS=http://+:80
ENTRYPOINT ["dotnet", "Blogifier.dll"]
EXPOSE 80
