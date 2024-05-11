import CryptoPoops from 0x09
import NonFungibleToken from 0x09

transaction (recp:Address){

  prepare(acct: AuthAccount) {

  let nft= acct.borrow<&CryptoPoops.NFTMinter>(from: /storage/Minter)!
  let ref=getAccount(recp).getCapability(/public/Collection)
           .borrow<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic}>()
           ??panic("No collection present ")

  ref.deposit(token: <-nft.createNFT(name: "Antony2", favouriteFood: "Biryani1", luckyNumber:14))
 
    }

  execute {
 log("new token deposited")
}
}