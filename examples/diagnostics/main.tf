module "cosmosdb" {
  source = "../../"

  name                = "cosmosdb"
  resource_group_name = "cosmosdb-rg"
  location            = "westeurope"

  ip_range_filter = ["10.221.100.10", "10.221.101.0/24"]

  databases = {
    mydb1 = {
      throughput     = 400
      max_throughput = null
      collections = [
        { name = "col0", shard_key = "somekey_0", throughput = 1000, max_throughput = null },
        { name = "col1", shard_key = "somekey_1", throughput = null, max_throughput = null }
      ]
    }
    mydb2 = {
      throughput     = 600
      max_throughput = null
      collections    = [{ name = "mycol2", shard_key = "someother_key", throughput = null, max_throughput = null }]
    }
  }

  tags = {
    tag1 = "value1"
  }

  diagnostics = {
    destination   = "test"
    eventhub_name = "diagnostics",
    logs          = ["all"],
    metrics       = ["all"],
  }

}
