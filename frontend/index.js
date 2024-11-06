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
            
            User->>Gateway: HTTP Request
            Gateway->>Canister: Query/Update
            Canister->>Consensus: State Update
            Consensus->>Canister: Confirmation
            Canister->>Gateway: Response
            Gateway->>User: HTTP Response
        `;

        document.getElementById('architecture-diagram').innerHTML = `<div class="mermaid">${architectureDiagram}</div>`;
        document.getElementById('tokenomics-flow').innerHTML = `<div class="mermaid">${tokenomicsFlow}</div>`;
        document.getElementById('implementation-flow').innerHTML = `<div class="mermaid">${implementationFlow}</div>`;

        mermaid.init(undefined, document.querySelectorAll(".mermaid"));
    } catch (error) {
        console.error("Error fetching specification:", error);
        document.getElementById('content').innerHTML = "<p>Error loading content. Please try again later.</p>";
    }
});
