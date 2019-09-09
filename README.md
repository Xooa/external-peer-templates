# external-peer-templates
Templates in this repository are required to host external peer on AWS, Azure, Google, or IBM

# External Peer
Blockchain data may be exported outside Xooa by deploying an External Peer. Once syncing is complete all your data will be available on the External Peer. You will have to create a new blockchain network because we do not export crypto material beyond what is is provided to download on the console for bootstrapping an External Peers to connect to Xooa network and sync your blockchain.

You can also download external peer for the ledger that has been shared with you. The peer will keep in sync with all the shared ledgers as well.

We provide a Docker Compose file. This file runs peer container in your local machine.

The downloaded peer is coupled with the External Ledger. It can be used to view transactions by visiting http://<peer ip>:8080/

Deleting a peer will revoke the access of external peer. It will no longer sync with Xooa. Access to already synced data will remain available with the external peer.

## Steps to create external peer
1. Go to https://xooa.com/blockchain/peers.
2. Follow steps on xooa console to deploy external peer on particular cloud platform.
