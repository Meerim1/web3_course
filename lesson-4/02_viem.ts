import { createPublicClient, http } from 'viem'
import { sepolia } from 'viem/chains'

const client = createPublicClient({
    chain: sepolia,
    transport: http(),
})


const balance = await client.getBalance({
    address: '0x742d35Cc6634C0532925a3b844Bc454e4438f44e',
})

console.log(balance)
