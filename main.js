
import {
  EthereumClient,
  w3mConnectors,
  w3mProvider,
  WagmiCore,
  WagmiCoreChains,
  WagmiCoreConnectors,
} from "https://unpkg.com/@web3modal/ethereum@2.6.2";

import { Web3Modal } from "https://unpkg.com/@web3modal/html@2.6.2";

// 0. Import wagmi dependencies
const { bsc } = WagmiCoreChains;
const { configureChains, createConfig, getAccount, readContract, writeContract, erc20ABI} = WagmiCore;

// 1. Define chains
const chains = [bsc];
const projectId = "a3ae9c210524d8c65a4419443d5380e5";

// 2. Configure wagmi client
const { publicClient } = configureChains(chains, [w3mProvider({ projectId })]);
const wagmiConfig = createConfig({
  autoConnect: true,
  connectors: [
    ...w3mConnectors({ chains, version: 2, projectId }),
    new WagmiCoreConnectors.CoinbaseWalletConnector({
      chains,
      options: {
        appName: "Metacces Referral Program",
        url: "https://metacces.com",
        icons: "https://metacces.com/litepaper/imgs/logo.png"
      },
    }),
  ],
  publicClient,
});

const account = getAccount();
console.log(account);
// get connected wallet address
let userAddress = account ? account.address : null;

// 3. Create ethereum and modal clients
const ethereumClient = new EthereumClient(wagmiConfig, chains);
export const web3Modal = new Web3Modal(
  {
    projectId,
    walletImages: {
      safe: "https://metacces.com/litepaper/imgs/logo.png",
    },
    cacheProvider: true,
  },
  ethereumClient
);

  // End of web3Modal


  async function setPaused(isPaused) {
  const data = await writeContract({
    address: '0x508e24dAF923782Ba8630D197C30F2d92b9CC130',
    abi: ABI,
    functionName: 'setPaused',
    args: [isPaused],
  });

  console.log(data);
}

async function changeOwner(newOwner) {
  const data = await writeContract({
    address: '0x508e24dAF923782Ba8630D197C30F2d92b9CC130',
    abi: ABI,
    functionName: 'changeOwner',
    args: [newOwner],
  });

  console.log(data);
}

async function setTokenAllowDisallow(paymentToken, state) {
  const data = await writeContract({
    address: '0x508e24dAF923782Ba8630D197C30F2d92b9CC130',
    abi: ABI,
    functionName: 'setTokenAllowDisallow',
    args: [paymentToken, state],
  });

  console.log(data);
}

async function changePrice(newPrice) {
  const data = await writeContract({
    address: '0x508e24dAF923782Ba8630D197C30F2d92b9CC130',
    abi: ABI,
    functionName: 'changePrice',
    args: [newPrice],
  });

  console.log(data);
}

async function setUSDT(USDT) {
  const data = await writeContract({
    address: '0x508e24dAF923782Ba8630D197C30F2d92b9CC130',
    abi: ABI,
    functionName: 'setUSDT',
    args: [USDT],
  });

  console.log(data);
}

async function setUSDC(USDC) {
  const data = await writeContract({
    address: '0x508e24dAF923782Ba8630D197C30F2d92b9CC130',
    abi: ABI,
    functionName: 'setUSDC',
    args: [USDC],
  });

  console.log(data);
}

async function setBUSD(BUSD) {
  const data = await writeContract({
    address: '0x508e24dAF923782Ba8630D197C30F2d92b9CC130',
    abi: ABI,
    functionName: 'setBUSD',
    args: [BUSD],
  });

  console.log(data);
}

async function setTUSD(TUSD) {
  const data = await writeContract({
    address: '0x508e24dAF923782Ba8630D197C30F2d92b9CC130',
    abi: ABI,
    functionName: 'setTUSD',
    args: [TUSD],
  });

  console.log(data);
}

async function setSaleReceiver(saleReceiver) {
  const data = await writeContract({
    address: '0x508e24dAF923782Ba8630D197C30F2d92b9CC130',
    abi: ABI,
    functionName: 'setSaleReceiver',
    args: [saleReceiver],
  });

  console.log(data);
}

async function setbigDaddy(bigDaddy) {
  const data = await writeContract({
    address: '0x508e24dAF923782Ba8630D197C30F2d92b9CC130',
    abi: ABI,
    functionName: 'setbigDaddy',
    args: [bigDaddy],
  });

  console.log(data);
}

async function changeNormalPercentage(newPercentage) {
  const data = await writeContract({
    address: '0x508e24dAF923782Ba8630D197C30F2d92b9CC130',
    abi: ABI,
    functionName: 'changeNormalPercentage',
    args: [newPercentage],
  });

  console.log(data);
}

async function buyWithReferral(referrer, paymentToken, amount) {
  const data = await writeContract({
    address: '0x508e24dAF923782Ba8630D197C30F2d92b9CC130',
    abi: ABI,
    functionName: 'buyWithReferral',
    args: [referrer, paymentToken, amount],
  });

  console.log(data);
}

async function generateReferralLinkSpecial(referrer, percentage) {
  const data = await writeContract({
    address: '0x508e24dAF923782Ba8630D197C30F2d92b9CC130',
    abi: ABI,
    functionName: 'generateReferralLinkSpecial',
    args: [referrer, percentage],
  });

  console.log(data);
}

async function changeReferrerPercentage(referrer, newPercentage) {
  const data = await writeContract({
    address: '0x508e24dAF923782Ba8630D197C30F2d92b9CC130',
    abi: ABI,
    functionName: 'changeReferrerPercentage',
    args: [referrer, newPercentage],
  });

  console.log(data);
}

async function getReferrersWithPercentage() {
  const data = await readContract({
    address: '0x508e24dAF923782Ba8630D197C30F2d92b9CC130',
    abi: ABI,
    functionName: 'getReferrersWithPercentage',
    args: [],
  });

  console.log(data);
}

async function getAllBuyers(fromIndex, toIndex) {
  const data = await readContract({
    address: '0x508e24dAF923782Ba8630D197C30F2d92b9CC130',
    abi: ABI,
    functionName: 'getAllBuyers',
    args: [fromIndex, toIndex],
  });

  console.log(data);
}

async function _buyersCount() {
  const data = await readContract({
    address: '0x508e24dAF923782Ba8630D197C30F2d92b9CC130',
    abi: ABI,
    functionName: '_buyersCount',
    args: [],
  });

  console.log(data);
}

async function getReferralTree(_address, _depth) {
  const data = await readContract({
    address: '0x508e24dAF923782Ba8630D197C30F2d92b9CC130',
    abi: ABI,
    functionName: 'getReferralTree',
    args: [_address, _depth],
  });

  console.log(data);
}

async function getReferrerInfo(_referrer) {
  const data = await readContract({
    address: '0x508e24dAF923782Ba8630D197C30F2d92b9CC130',
    abi: ABI,
    functionName: 'getReferrerInfo',
    args: [_referrer],
  });

  console.log(data);
}

async function _getBuyersAmounts(_referrer, buyersList) {
  const data = await readContract({
    address: '0x508e24dAF923782Ba8630D197C30F2d92b9CC130',
    abi: ABI,
    functionName: '_getBuyersAmounts',
    args: [_referrer, buyersList],
  });

  console.log(data);
}

async function _getBuyerRewards(_referrer, buyersList) {
  const data = await readContract({
    address: '0x508e24dAF923782Ba8630D197C30F2d92b9CC130',
    abi: ABI,
    functionName: '_getBuyerRewards',
    args: [_referrer, buyersList],
  });

  console.log(data);
}

async function getBuyerInfo(_buyer) {
  const data = await readContract({
    address: '0x508e24dAF923782Ba8630D197C30F2d92b9CC130',
    abi: ABI,
    functionName: 'getBuyerInfo',
    args: [_buyer],
  });

  console.log(data);
}

async function getBuyerInfoForReferrer(_referrer, _buyer) {
  const data = await readContract({
    address: '0x508e24dAF923782Ba8630D197C30F2d92b9CC130',
    abi: ABI,
    functionName: 'getBuyerInfoForReferrer',
    args: [_referrer, _buyer],
  });

  console.log(data);
}

async function changeReferrer(oldReferrer, newReferrer) {
  const data = await writeContract({
    address: '0x508e24dAF923782Ba8630D197C30F2d92b9CC130',
    abi: ABI,
    functionName: 'changeReferrer',
    args: [oldReferrer, newReferrer],
  });

  console.log(data);
}

async function withdrawTokens(_token, _to, _amount) {
  const data = await writeContract({
    address: '0x508e24dAF923782Ba8630D197C30F2d92b9CC130',
    abi: ABI,
    functionName: 'withdrawTokens',
    args: [_token, _to, _amount],
  });

  console.log(data);
}
