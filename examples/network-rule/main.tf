module "cosmosdb" {
  source = "../../"

  name                = "cosmosdb"
  resource_group_name = "cosmosdb-rg"
  location            = "westeurope"

  ip_range_filter                   = "10.221.100.10,10.221.101.0/24"
  is_virtual_network_filter_enabled = true
  virtual_network_rules = [
    "/subscriptions/..../subnets/subnet1",
    "/subscriptions/..../subnets/subnet2",
  ]

  databases = {
    mydb1 = {
      throughput  = 400
      collections = [{ name = "mycol1", shard_key = "somekey" }]
    }
    mydb2 = {
      throughput  = 600
      collections = [{ name = "mycol2", shard_key = "someother_key" }]
    }
  }

  tags = {
    tag1 = "value1"
  }

}