import { backend } from 'declarations/backend';

document.addEventListener('DOMContentLoaded', async () => {
    try {
        const content = await backend.getSpecification();
        document.getElementById('content').innerHTML = content;

        // Initialize Mermaid diagrams
        mermaid.initialize({ startOnLoad: true });
        
        const architectureDiagram = `
        graph TD
            A[Internet Computer] --> B[Subnet Blockchains]
            A --> C[Protocol Labs]
            A --> D[Network Nervous System]
            
            B --> E[Nodes]
            B --> F[Canisters]
            
            C --> G[Chain Key Crypto]
            C --> H[WebAssembly VM]
            
            D --> I[Governance]
            D --> J[Economics]
            
            E --> K[Consensus]
            E --> L[Execution]
            E --> M[Networking]
            
            F --> N[Smart Contracts]
            F --> O[Web Services]
            F --> P[DApps]
            
            G --> Q[Threshold Signatures]
            G --> R[Non-Interactive DKG]
            
            H --> S[Deterministic Execution]
            H --> T[Memory Management]
            
            I --> U[Proposals]
            I --> V[Voting]
            
            J --> W[ICP Token]
            J --> X[Cycles]
            
            style A fill:#29abe2
            style B fill:#522785
            style C fill:#29abe2
            style D fill:#522785
        `;
        
        const tokenomicsFlow = `
        graph LR
            A[ICP Token] --> B[Cycles]
            A --> C[Neurons]
            
            B --> D[Computation]
            B --> E[Storage]
            B --> F[Memory]
            
            C --> G[Governance]
            C --> H[Staking Rewards]
            C --> I[Voting Power]
            
            D --> J[Canister Execution]
            E --> K[State Storage]
            F --> L[Runtime Memory]
            
            G --> M[Network Upgrades]
            G --> N[Economic Parameters]
            
            H --> O[Neuron Maturity]
            H --> P[Dissolve Delay Bonus]
            
            I --> Q[Proposal Influence]
            I --> R[Followees]
            
            style A fill:#29abe2
            style B fill:#522785
            style C fill:#29abe2
        `;
        
        const implementationFlow = `
        sequenceDiagram
            participant User
            participant Gateway
            participant Canister
            participant Consensus
            participant StateManager
            
            User->>Gateway: HTTP Request
            Gateway->>Canister: Query/Update
            Canister->>StateManager: Read State
            StateManager->>Canister: Return State
            Canister->>Consensus: Propose Update
            Consensus->>Consensus: Reach Agreement
            Consensus->>StateManager: Apply Update
            StateManager->>Canister: Confirm Update
            Canister->>Gateway: Response
            Gateway->>User: HTTP Response
        `;

        const taxImplicationsFlow = `
        graph TD
            A[ICP Token Activities] --> B[Taxable Events]
            A --> C[Record Keeping]
            
            B --> D[Token Sale]
            B --> E[ICP to Cycles Conversion]
            B --> F[Exchange Trading]
            B --> G[Staking Rewards]
            B --> H[Neuron Maturity Redemption]
            
            C --> I[Transaction Logs]
            C --> J[Cost Basis Tracking]
            C --> K[Fair Market Value Records]
            
            D --> L[Capital Gains/Losses]
            E --> L
            F --> L
            
            G --> M[Ordinary Income]
            H --> M
            
            I --> N[Tax Reporting]
            J --> N
            K --> N
            
            L --> O[Schedule D]
            M --> P[Form 1040]
            
            style A fill:#29abe2
            style B fill:#522785
            style C fill:#29abe2
        `;

        document.getElementById('architecture-diagram').innerHTML = `<div class="mermaid">${architectureDiagram}</div>`;
        document.getElementById('tokenomics-flow').innerHTML = `<div class="mermaid">${tokenomicsFlow}</div>`;
        document.getElementById('implementation-flow').innerHTML = `<div class="mermaid">${implementationFlow}</div>`;
        document.getElementById('tax-implications-flow').innerHTML = `<div class="mermaid">${taxImplicationsFlow}</div>`;

        mermaid.init(undefined, document.querySelectorAll(".mermaid"));
    } catch (error) {
        console.error("Error fetching specification:", error);
        document.getElementById('content').innerHTML = "<p>Error loading content. Please try again later.</p>";
    }
});
