import Int "mo:base/Int";
import Nat "mo:base/Nat";
import Stack "mo:base/Stack";
import Time "mo:base/Time";

import Text "mo:base/Text";

actor {
  let specification = "
    <div class=\"hero\">
        <h1>Internet Computer: The Complete Guide</h1>
        <p>Understanding ICP, Neurons, Tokenomics, and Tax Implications</p>
    </div>

    <h2>1. What is the Internet Computer?</h2>
    
    <div class=\"info-box\">
        The Internet Computer is a blockchain network that extends the public internet with computational capabilities, enabling smart contracts (called canisters) to serve web content and run applications at web speed.
    </div>

    <div id=\"architecture-diagram\"></div>

    <h3>1.1 Core Components</h3>
    
    <div class=\"grid\">
        <div class=\"card\">
            <h4>Subnet Blockchains</h4>
            <div class=\"technical-box\">
Key Properties:
- Block Time: ~1 second
- Finality: 2-4 seconds
- Nodes per Subnet: 13-28
- Consensus: Threshold Relay
- Chain-Key Cryptography
            </div>
        </div>
        
        <div class=\"card\">
            <h4>Canister Smart Contracts</h4>
            <div class=\"technical-box\">
Features:
- WebAssembly Runtime
- Orthogonal Persistence
- HTTP Outcalls
- Inter-Canister Calls
- Autonomous Updates
            </div>
        </div>
    </div>

    <h2>2. Tokenomics Deep Dive</h2>
    
    <div class=\"info-box\">
        ICP implements a dual-purpose token model serving both as a utility token for computation and a governance token through the neuron staking mechanism.
    </div>

    <div id=\"tokenomics-flow\"></div>

    <h3>2.1 Token Utility</h3>
    
    <div class=\"technical-box\">
Token Mechanisms:

1. Cycles Conversion
   - ICP → Cycles for computation
   - Dynamic conversion rate
   - SDR-pegged pricing model

2. Governance Staking
   - Neuron creation
   - Voting power calculation
   - Reward distribution
   - Dissolve delay mechanics
    </div>

    <h3>2.2 Neuron Mathematics</h3>
    
    <div class=\"technical-box\">
Neuron Formulas:

1. Voting Power = Stake × (1 + DissolveDelay/360) × AgingMultiplier
   where AgingMultiplier = min(1.25, 1 + age/4years)

2. Rewards = BaseReward × Stake × DissolveMultiplier × VotingMultiplier
   where DissolveMultiplier = 1 + (DissolveDelay/MaxDelay)
   and VotingMultiplier = VotingActivity/TotalProposals
    </div>

    <h2>3. Tax Implications & Reporting</h2>

    <h3>3.1 ICP Token Events</h3>
    
    <div class=\"tax-box\">
        <h4>Taxable Events:</h4>
        <ul>
            <li>Token Sale Participation (Cost Basis)</li>
            <li>Converting ICP to Cycles (Disposition)</li>
            <li>Trading ICP on Exchanges</li>
            <li>Receiving Staking Rewards</li>
            <li>Neuron Maturity Redemption</li>
        </ul>
    </div>

    <div class=\"grid\">
        <div class=\"card\">
            <h4>Cost Basis Calculation</h4>
            <div class=\"technical-box\">
Methods:
1. FIFO (First In, First Out)
2. LIFO (Last In, First Out)
3. Specific Identification

Example:
Purchase 1: 100 ICP @ $50
Purchase 2: 200 ICP @ $40
Sale: 150 ICP @ $60

FIFO Cost Basis:
(100 × $50) + (50 × $40) = $7,000
            </div>
        </div>
        
        <div class=\"card\">
            <h4>Staking Rewards</h4>
            <div class=\"technical-box\">
Tax Treatment:
1. Income Recognition
   - Recognized when rewards distributed
   - Valued at fair market price
   - Reported as ordinary income

2. Cost Basis Tracking
   - New cost basis = FMV at distribution
   - Holding period starts at distribution
            </div>
        </div>
    </div>

    <h3>3.2 Record Keeping Requirements</h3>
    
    <div class=\"tax-box\">
        <h4>Essential Records:</h4>
        <table>
            <tr>
                <th>Transaction Type</th>
                <th>Required Information</th>
                <th>Documentation</th>
            </tr>
            <tr>
                <td>Purchases</td>
                <td>Date, Amount, Price, Fees</td>
                <td>Exchange statements, Bank transfers</td>
            </tr>
            <tr>
                <td>Sales</td>
                <td>Date, Amount, Price, Fees</td>
                <td>Exchange statements, Blockchain records</td>
            </tr>
            <tr>
                <td>Staking Rewards</td>
                <td>Distribution dates, Amounts, FMV</td>
                <td>Network records, Price data</td>
            </tr>
            <tr>
                <td>Cycle Conversions</td>
                <td>Conversion rate, Amount, Date</td>
                <td>Canister records, SDR rates</td>
            </tr>
        </table>
    </div>

    <h2>4. Technical Implementation</h2>

    <div id=\"implementation-flow\"></div>

    <h3>4.1 Network Protocol</h3>
    
    <div class=\"technical-box\">
Protocol Stack:

1. Application Layer
   - HTTP/HTTPS Gateway
   - Asset Certification
   - Query/Update Segregation

2. Consensus Layer
   - Block Production
   - Notarization
   - State Certification

3. Network Layer
   - P2P Communication
   - Flow Control
   - Peer Discovery

4. Transport Layer
   - UDP/TCP
   - Connection Management
   - Reliability
    </div>

    <h3>4.2 Smart Contract Development</h3>
    
    <div class=\"technical-box\">
Canister Development:

1. Languages
   - Motoko (Native)
   - Rust
   - JavaScript/TypeScript
   - C/C++

2. Development Stack
   - dfx CLI
   - Candid Interface
   - Vessel Package Manager
   - Unit Testing Framework

3. Deployment
   - Network Deployment
   - Upgrade Preservation
   - State Management
    </div>

    <div class=\"card\">
        <h4>Example Motoko Code</h4>
        <div class=\"technical-box\">
actor {
    // State
    private stable var count : Nat = 0;
    
    // Update call
    public func increment() : async Nat {
        count += 1;
        return count;
    };
    
    // Query call
    public query func get() : async Nat {
        return count;
    };
    
    // Upgrade hook
    system func preupgrade() {
        // Handle upgrade
    };
};
        </div>
    </div>
  ";

  public query func getSpecification() : async Text {
    specification
  };
}
