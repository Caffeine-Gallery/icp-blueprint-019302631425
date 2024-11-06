import { backend } from 'declarations/backend';

document.addEventListener('DOMContentLoaded', async () => {
    try {
        const content = await backend.getSpecification();
        document.getElementById('container').innerHTML = content;

        // Initialize Mermaid diagrams
        mermaid.initialize({ startOnLoad: true });

        const blockProduction = `
        sequenceDiagram
            participant RP as Random Beacon
            participant P as Proposer
            participant V as Validators
            participant M as Memory Pool
            
            RP->>P: Select Round Proposer
            P->>M: Fetch Pending Txs
            P->>P: Build Block
            P->>V: Broadcast Block
            
            par Validation
                V->>V: Verify Syntactic
                V->>V: Execute Txs
                V->>V: Verify State
            end
            
            V->>V: Generate Signature Share
            V->>P: Send Signature
            P->>P: Aggregate Signatures
            P->>V: Broadcast Final Block
        `;
        
        const memoryModel = `
        graph TD
            A[Wasm Module] --> B[Memory Pages]
            B --> C[Heap Memory]
            B --> D[Stable Memory]
            
            C --> E[Volatile State]
            D --> F[Persistent State]
            
            E --> G[Runtime Context]
            F --> H[Upgrades]
        `;
        
        const networkTopology = `
        graph TD
            A[Client] --> B[Boundary Nodes]
            B --> C[Subnet A]
            B --> D[Subnet B]
            
            subgraph "Subnet A"
                C --> E[Node 1]
                C --> F[Node 2]
                C --> G[Node N]
            end
            
            subgraph "Subnet B"
                D --> H[Node 1]
                D --> I[Node 2]
                D --> J[Node N]
            end
            
            E --> K[Canisters]
            F --> K
            G --> K
            
            H --> L[Canisters]
            I --> L
            J --> L
            
            K <--> L[XNet Messages]
        `;

        document.getElementById('block-production').innerHTML = `<div class="mermaid">${blockProduction}</div>`;
        document.getElementById('memory-model').innerHTML = `<div class="mermaid">${memoryModel}</div>`;
        document.getElementById('network-topology').innerHTML = `<div class="mermaid">${networkTopology}</div>`;

        mermaid.init(undefined, document.querySelectorAll(".mermaid"));
    } catch (error) {
        console.error("Error fetching specification:", error);
        document.getElementById('container').innerHTML = "<p>Error loading content. Please try again later.</p>";
    }
});
