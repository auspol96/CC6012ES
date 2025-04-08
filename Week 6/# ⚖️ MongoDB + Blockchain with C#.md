# ⚖️ MongoDB + Blockchain with C# — Week 6 Project

Welcome to your hands-on mini project combining **MongoDB** and **Blockchain** concepts using **C#**! 🚀 This project will help you learn how data immutability and transactions work by simulating a blockchain stored in a MongoDB database.

---

## 📚 Learning Objectives
- Understand how blockchain works (blocks, hashes, links)
- Use MongoDB to store structured documents (blocks)
- Build a blockchain using C# classes
- Validate the chain for data integrity

---

## 🌐 Prerequisites
- MongoDB installed locally (or MongoDB Atlas)
- MongoDB C# Driver installed
- .NET environment ready (e.g., Visual Studio, VS Code)

Install MongoDB driver via NuGet:
```powershell
Install-Package MongoDB.Driver
```

---

## 🔹 Project Structure
Create a new Console App project and add these files:

```
/BlockchainMongoDB
├── Program.cs
├── Block.cs
├── Blockchain.cs
└── README.md
```

---

## 📂 File: Block.cs
```csharp
using System;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

public class Block
{
    [BsonId] // 👈 This tells MongoDB to expect the _id field
    public ObjectId Id { get; set; }

    [BsonElement("Index")]
    public int Index { get; set; }

    [BsonElement("Timestamp")]
    public long Timestamp { get; set; }

    [BsonElement("PreviousHash")]
    public string PreviousHash { get; set; }

    [BsonElement("Data")]
    public BsonDocument Data { get; set; }

    [BsonElement("Hash")]
    public string Hash { get; set; }
}

```

---

## 📂 File: Blockchain.cs
```csharp
using MongoDB.Bson;
using MongoDB.Driver;
using System.Security.Cryptography;
using System.Text;

public class Blockchain
{
    private List<Block> chain;
    private IMongoCollection<Block> blocksCollection;

    public Blockchain()
    {
        var mongoClient = new MongoClient("mongodb+srv://yourUsername:yourPassword@ptucluster0.xxxxx.mongodb.net/?        retryWrites=true&w=majority");
        var database = mongoClient.GetDatabase("BlockchainDB");
        blocksCollection = database.GetCollection<Block>("Blocks");

        chain = blocksCollection.Find(_ => true).ToList();

        if (!chain.Any())
        {
            var genesisData = new BsonDocument { { "message", "Genesis Block" } };
            var genesisBlock = new Block
            {
                Index = 0,
                PreviousHash = "0",
                Timestamp = DateTimeOffset.Now.ToUnixTimeSeconds(),
                Data = genesisData,
                Hash = CalculateHash("0" + genesisData.ToString())
            };
            chain.Add(genesisBlock);
            blocksCollection.InsertOne(genesisBlock);
        }
    }

    public void AddBlock(BsonDocument data)
    {
        Block previousBlock = chain.Last();
        var newBlock = new Block
        {
            Index = previousBlock.Index + 1,
            PreviousHash = previousBlock.Hash,
            Timestamp = DateTimeOffset.Now.ToUnixTimeSeconds(),
            Data = data,
            Hash = CalculateHash(previousBlock.Hash + data.ToString())
        };
        chain.Add(newBlock);
        blocksCollection.InsertOne(newBlock);
    }

    public bool IsChainValid()
    {
        for (int i = 1; i < chain.Count; i++)
        {
            Block currentBlock = chain[i];
            Block previousBlock = chain[i - 1];

            if (currentBlock.Hash != CalculateHash(previousBlock.Hash + currentBlock.Data.ToString()))
                return false;
        }
        return true;
    }

    private string CalculateHash(string input)
    {
        using (var sha256 = SHA256.Create())
        {
            var bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(input));
            return BitConverter.ToString(bytes).Replace("-", "").ToLower();
        }
    }
}
```

---

## 📂 File: Program.cs
```csharp
using MongoDB.Bson;

class Program
{
    static void Main(string[] args)
    {
        var blockchain = new Blockchain();

        var transaction1 = new BsonDocument
        {
            { "from", "Alice" },
            { "to", "Bob" },
            { "amount", 100 }
        };

        var transaction2 = new BsonDocument
        {
            { "from", "Bob" },
            { "to", "Charlie" },
            { "amount", 50 }
        };

        blockchain.AddBlock(transaction1);
        blockchain.AddBlock(transaction2);

        Console.WriteLine("Is blockchain valid? " + blockchain.IsChainValid());
    }
}
```

---

## 📢 Outputs
- Console will print: `Is blockchain valid? True`
- MongoDB Compass will show:
  - Database: `BlockchainDB`
  - Collection: `Blocks`
  - Each document as a block with `Index`, `Hash`, and `Data`

---

## 🚀 Challenge for Students
- Try modifying a block manually in Compass. Rerun the validation. Does it still say "valid"?
- Add timestamps to `Data`
- Expand block structure with transaction IDs, fees, or signatures

---

Let the chain begin — have fun! 🚩
