flowchart LR
    Client["User Browser\n(Presentation Layer)"] -->|HTTP Request| Apache["Apache Server\n(Application Layer)"]
    Apache -->|SQL Query| MySQL["MySQL Database\n(Data Layer)"]
    MySQL -->|Data Response| Apache
    Apache -->|HTML Response| Client
