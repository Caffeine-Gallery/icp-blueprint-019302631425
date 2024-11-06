import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Nat "mo:base/Nat";
import Random "mo:base/Random";
import Stack "mo:base/Stack";
import Time "mo:base/Time";

import Text "mo:base/Text";

actor {
  let specification = "
    <div class=\"hero\">
        <h1>Internet Computer Protocol (ICP) in a Nutshell</h1>
    </div>

    <div class=\"container\">
        <div class=\"section\">
            <h2>1. What is the Internet Computer?</h2>
            
            <div class=\"info-box\">
                The Internet Computer is a blockchain network that extends the public internet with computational capabilities, enabling smart contracts (called canisters) to serve web content and run applications at web speed.
            </div>

            <div id=\"architecture-diagram\"></div>

            <h3>1.1 Core Components</h3>
            
            <div class=\"technical-box\">
                <h4>Subnet Blockchains</h4>
                Key Properties:
                - Block Time: ~1 second
                - Finality: 2-4 seconds
                - Nodes per Subnet: 13-28
                - Consensus: Threshold Relay
                - Chain-Key Cryptography
                - Scalability: Horizontal scaling through subnet creation
                - Interoperability: Cross-subnet transactions
            </div>
            
            <div class=\"technical-box\">
                <h4>Canister Smart Contracts</h4>
                Features:
                - WebAssembly Runtime
                - Orthogonal Persistence
                - HTTP Outcalls
                - Inter-Canister Calls
                - Autonomous Updates
                - Deterministic Execution
                - Cycle-based Resource Accounting
                - Candid Interface Description Language
            </div>
        </div>

        <div class=\"section\">
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
                   - Deflationary mechanism: ICP burned on conversion

                2. Governance Staking
                   - Neuron creation
                   - Voting power calculation
                   - Reward distribution
                   - Dissolve delay mechanics
                   - Age bonus for long-term staking
                   - Followee system for liquid democracy
            </div>

            <h3>2.2 Neuron Mathematics</h3>
            
            <div class=\"technical-box\">
                Neuron Formulas:

                1. Voting Power = Stake × (1 + DissolveDelay/360) × AgingMultiplier
                   where AgingMultiplier = min(1.25, 1 + age/4years)

                2. Rewards = BaseReward × Stake × DissolveMultiplier × VotingMultiplier
                   where DissolveMultiplier = 1 + (DissolveDelay/MaxDelay)
                   and VotingMultiplier = VotingActivity/TotalProposals

                3. Neuron Spawning:
                   Maturity required = 6 months of accumulated rewards
                   New ICP minted = Maturity × CurrentConversionRate
            </div>
        </div>

        <div class=\"section\">
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
                    <li>Airdrop Receipts</li>
                    <li>Payment for Goods or Services in ICP</li>
                </ul>
            </div>

            <div id=\"tax-implications-flow\"></div>

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
                Capital Gain: (150 × $60) - $7,000 = $2,000

                LIFO Cost Basis:
                (150 × $40) = $6,000
                Capital Gain: (150 × $60) - $6,000 = $3,000

                Importance:
                - Consistent method use
                - Impact on short-term vs long-term capital gains
            </div>
            
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

                3. Neuron Maturity
                   - Taxed when redeemed, not when accrued
                   - May qualify for long-term capital gains if held >1 year

                4. Dissolve Delay Considerations
                   - No tax implications for increasing/decreasing delay
                   - May affect reward rate and thus future taxable income
            </div>

            <h3>3.2 Record Keeping Requirements</h3>
            
            <div class=\"tax-box\">
                <h4>Essential Records:</h4>
                <table>
                    <tr>
                        <th>Transaction Type</th>
                        <th>Required Information</th>
                        <th>Documentation</th>
                        <th>Tax Implications</th>
                    </tr>
                    <tr>
                        <td>Purchases</td>
                        <td>Date, Amount, Price, Fees</td>
                        <td>Exchange statements, Bank transfers</td>
                        <td>Establishes cost basis</td>
                    </tr>
                    <tr>
                        <td>Sales</td>
                        <td>Date, Amount, Price, Fees</td>
                        <td>Exchange statements, Blockchain records</td>
                        <td>Capital gains/losses</td>
                    </tr>
                    <tr>
                        <td>Staking Rewards</td>
                        <td>Distribution dates, Amounts, FMV</td>
                        <td>Network records, Price data</td>
                        <td>Ordinary income</td>
                    </tr>
                    <tr>
                        <td>Cycle Conversions</td>
                        <td>Conversion rate, Amount, Date</td>
                        <td>Canister records, SDR rates</td>
                        <td>Potential taxable event</td>
                    </tr>
                    <tr>
                        <td>Neuron Operations</td>
                        <td>Creation, Spawning, Dissolving</td>
                        <td>NNS records, Transaction logs</td>
                        <td>Varies based on action</td>
                    </tr>
                </table>
            </div>

            <h3>3.3 Tax Reporting Considerations</h3>

            <div class=\"info-box\">
                <h4>Key Points for ICP Tax Reporting:</h4>
                <ul>
                    <li>Use Form 8949 for reporting ICP sales and exchanges</li>
                    <li>Summarize gains/losses on Schedule D</li>
                    <li>Report staking rewards as 'Other Income' on Form 1040</li>
                    <li>Consider state tax implications, which may vary</li>
                    <li>For large transactions, consider quarterly estimated tax payments</li>
                    <li>Consult with a tax professional familiar with cryptocurrency</li>
                </ul>
            </div>
        </div>

        <div class=\"section\">
            <h2>4. Technical Implementation</h2>

            <div id=\"implementation-flow\"></div>

            <h3>4.1 Network Protocol</h3>
            
            <div class=\"technical-box\">
                Protocol Stack:

                1. Application Layer
                   - HTTP/HTTPS Gateway
                   - Asset Certification
                   - Query/Update Segregation
                   - Canister Interfaces (Candid)

                2. Consensus Layer
                   - Block Production
                   - Notarization
                   - State Certification
                   - Threshold Signatures
                   - Random Beacon

                3. Network Layer
                   - P2P Communication
                   - Flow Control
                   - Peer Discovery
                   - Subnet Management

                4. Transport Layer
                   - UDP/TCP
                   - Connection Management
                   - Reliability
                   - Encryption (TLS)
            </div>

            <h3>4.2 Smart Contract Development</h3>
            
            <div class=\"technical-box\">
                Canister Development:

                1. Languages
                   - Motoko (Native)
                   - Rust
                   - JavaScript/TypeScript
                   - C/C++
                   - Any language compiling to Wasm

                2. Development Stack
                   - dfx CLI
                   - Candid Interface Description Language
                   - Vessel Package Manager
                   - Unit Testing Framework
                   - Canister SDK

                3. Deployment
                   - Network Deployment
                   - Upgrade Preservation
                   - State Management
                   - Cycles Management
                   - Inter-Canister Communication
            </div>

            <h4>Example Motoko Code</h4>
            <div class=\"technical-box\">
                import Debug \"mo:base/Debug\";
                import Nat \"mo:base/Nat\";

                actor Counter {
                    stable var count : Nat = 0;
                    
                    // Update call
                    public func increment() : async Nat {
                        count += 1;
                        Debug.print(\"Count is \" # Nat.toText(count));
                        return count;
                    };
                    
                    // Query call
                    public query func get() : async Nat {
                        return count;
                    };
                    
                    // Candid interface (auto-generated)
                    // service : {
                    //   get: () -> (nat) query;
                    //   increment: () -> (nat);
                    // }
                };
            </div>
        </div>
    </div>
  ";

  public query func getSpecification() : async Text {
    specification
  };
}
