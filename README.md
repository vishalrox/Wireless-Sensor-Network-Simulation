Wireless Sensor Network (WSN) Simulation in Scilab
📌 Project Overview

This project simulates a Wireless Sensor Network (WSN) using Scilab.
The simulation models multiple sensor nodes deployed in a 100×100 area that communicate with a base station either directly or via multi-hop routing. The energy consumption of nodes is tracked, and the network lifetime is evaluated by monitoring the number of active and dead nodes over time.

⚙️ Features

Random deployment of N sensor nodes in a 2D grid.

Energy-efficient routing: nodes can either transmit directly to the base station or relay data through another active node.

Energy model includes transmission cost (distance-based), reception cost, and idle consumption.

Tracks network lifetime metrics:

First Node Death (FND)

Active node count vs. time

Dead node count vs. time

Plots:

Active nodes over time

Dead nodes over time

🖥️ Tech Stack

Language: Scilab (open-source alternative to MATLAB)

Concepts: Wireless Sensor Networks, Energy-efficient Routing, Euclidean Distance, Energy Models

📊 Simulation Results

Network Lifetime (First Node Death): ~6–10 time steps (varies per run)

All Nodes Dead: By ~100–120 time steps

Sample Plots:

Number of Active Nodes Over Time


Number of Dead Nodes Over Time


📂 Project Structure
├── WSN_simulation.sci     # Main Scilab simulation code
├── Plot_output.png        # Active nodes plot
├── Result.png             # Dead nodes plot
└── README.md              # Project documentation

🚀 How to Run

Install Scilab
.

Open WSN_simulation.sci in Scilab editor.

Run the file using:

exec('WSN_simulation.sci', -1);


Observe the console output (network lifetime) and generated plots.

📌 Example Output
Network Lifetime: 7 time steps


Plots show the gradual decrease in active nodes and corresponding increase in dead nodes.

📖 Learning Outcomes

Understood DCN/Computer Networks concepts like routing, communication range, and node failures.

Implemented WSN simulation with energy-aware routing in Scilab.

Analyzed network lifetime and performance degradation over time.

✨ Author

👤 Vishal Mehta
