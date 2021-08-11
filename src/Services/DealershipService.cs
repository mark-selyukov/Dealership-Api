using System;
using System.Threading.Tasks;
using dealership.Models;
using dealership.StartupConfiguration;
using Microsoft.Extensions.Options;
using MongoDB.Driver;

namespace dealership.Services
{
    public class DealershipService
    {
        private readonly IMongoCollection<Dealership> _mongoCollection;

        public DealershipService(IOptions<MongoSettings> options)
        {
            var client = new MongoClient(options.Value.URL);
            var database = client.GetDatabase(options.Value.CollectionName);
            _mongoCollection = database.GetCollection<Dealership>(nameof(Dealership));
        }

        public async Task Create(Dealership dealership)
        {
            await _mongoCollection.InsertOneAsync(dealership);
        }
    }
}
