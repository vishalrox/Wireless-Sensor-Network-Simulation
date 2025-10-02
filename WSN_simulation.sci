// Wireless Sensor Network Simulation in Scilab

// Initialize Parameters
N = 100;                  // Number of sensor nodes
grid_size = 100;          // Size of the area (100x100)
comm_range = 20;          // Communication range
base_station = [50, 50];  // Base station coordinates
initial_energy = 1.0;     // Initial energy of each node
transmit_cost = 0.01;     // Energy cost per unit distance for transmission
receive_cost = 0.005;     // Energy cost for receiving data
time_steps = 200;         // Number of simulation steps

// Randomly place nodes
nodes = rand(N, 2) * grid_size;  // Random (x, y) positions
energies = initial_energy * ones(N, 1);  // Initial energy for each node
active_nodes = ones(N, 1); // 1 if node is active, 0 if dead

// Function to calculate Euclidean distance
function d = distance(p1, p2)
    d = sqrt((p1(1) - p2(1))^2 + (p1(2) - p2(2))^2);
endfunction

// Simulation Variables
network_lifetime = 0;
active_node_count = [];
dead_node_count = [];

// Simulation Loop
for t = 1:time_steps
    for i = 1:N
        if active_nodes(i) == 1 then // Only consider active nodes
            distances = zeros(N+1, 1);
            for j = 1:N
                if i ~= j & active_nodes(j) == 1 then
                    distances(j) = distance(nodes(i, :), nodes(j, :));
                else
                    distances(j) = %inf;  // Ignore self or dead nodes
                end
            end
            distances(N+1) = distance(nodes(i, :), base_station);  // Distance to base station
            
            [min_dist, idx] = min(distances);
            
            if min_dist <= comm_range then
                if idx == N+1 then
                    // Transmit directly to base station
                    energies(i) = energies(i) - transmit_cost * min_dist;
                else
                    // Relay data through another node
                    energies(i) = energies(i) - transmit_cost * min_dist;
                    energies(idx) = energies(idx) - receive_cost;  // Receiving node energy cost
                end
            else
                // Node is unable to transmit
                energies(i) = energies(i) - 0.001;  // Idle energy consumption
            end
            
            // Check if node dies
            if energies(i) <= 0 then
                active_nodes(i) = 0;
            end
        end
    end
    
    // Update network lifetime and active node count
    if network_lifetime == 0 & sum(active_nodes) < N then
        network_lifetime = t;
    end
    active_node_count(t) = sum(active_nodes);
    dead_node_count(t) = N - active_node_count(t);
end

// Plot Network Lifetime
clf();
subplot(2, 1, 1);
plot(1:time_steps, active_node_count);
xlabel('Time Steps');
ylabel('Active Nodes');
title('Number of Active Nodes Over Time');

subplot(2, 1, 2);
plot(1:time_steps, dead_node_count);
xlabel('Time Steps');
ylabel('Dead Nodes');
title('Number of Dead Nodes Over Time');

// Display Network Lifetime
disp("Network Lifetime: " + string(network_lifetime) + " time steps");
