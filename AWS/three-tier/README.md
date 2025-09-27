```mermaid
flowchart LR
    Client[User Browser<br>(Presentation Layer)] -->|HTTP Request| Apache[Apache Server<br>(Application Layer)]
    Apache -->|SQL Query| MySQL[MySQL Database<br>(Data Layer)]
    MySQL -->|Data Response| Apache
    Apache -->|HTML Response| Client
