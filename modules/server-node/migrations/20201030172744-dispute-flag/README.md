# Migration `20201030172744-dispute-flag`

This migration has been generated by LayneHaber at 10/30/2020, 11:27:44 AM.
You can check out the [state of the schema](./schema.prisma) after the migration.

## Database Steps

```sql
ALTER TABLE "public"."channel" ADD COLUMN "inDispute" boolean   NOT NULL

ALTER TABLE "public"."transfer" ADD COLUMN "inDispute" boolean   NOT NULL
```

## Changes

```diff
diff --git schema.prisma schema.prisma
migration 20201026173854-init..20201030172744-dispute-flag
--- datamodel.dml
+++ datamodel.dml
@@ -5,9 +5,9 @@
 }
 datasource db {
   provider = ["postgresql", "sqlite"]
-  url = "***"
+  url = "***"
 }
 model Balance {
   participant      String
@@ -39,8 +39,9 @@
   chainId                  Int
   providerUrl              String
   latestUpdate             Update
   defundNonce              String
+  inDispute                Boolean
   activeTransfers Transfer[]
   OnchainTransaction OnchainTransaction[]
@@ -104,8 +105,9 @@
 model Transfer {
   transferId String @id
   routingId  String
+  inDispute  Boolean
   createUpdate  Update? @relation(name: "CreatedTransfer", fields: [createUpdateChannelAddressId, createUpdateNonce], references: [channelAddressId, nonce])
   resolveUpdate Update? @relation(name: "ResolvedTransfer", fields: [resolveUpdateChannelAddressId, resolveUpdateNonce], references: [channelAddressId, nonce])
```


