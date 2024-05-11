import CryptoPoops from 0x09
import NonFungibleToken from 0x09

pub fun main(acc:Address):[UInt64] {
 let reff= getAccount(acc).getCapability(/public/Collection)
           .borrow<&CryptoPoops.Collection{CryptoPoops.MyCollectionPublic}>()
           ??panic("this acc has no collection")


return reff.getIDs()
}