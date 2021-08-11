using System;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace dealership.Models
{
    public class Dealership
    {
        [BsonRepresentation(BsonType.ObjectId)]
        [BsonId]
        public string Id { get; set; }

        public string Name { get; set; }
    }
}
