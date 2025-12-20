import { createPublicClient, http } from 'viem'
import { sepolia } from 'viem/chains'

const client = createPublicClient({
  chain: sepolia,
  transport: http(),
})

const tokenAddress = '0xYourERC20TokenAddress'

import { parseAbiItem } from 'viem'

const transferEvent = parseAbiItem(
  'event Transfer(address indexed from, address indexed to, uint256 value)'
)

const logs = await client.getLogs({
  address: tokenAddress,
  event: transferEvent,
  fromBlock: 5_000_000n,
  toBlock: 'latest',
})

console.log(logs)
