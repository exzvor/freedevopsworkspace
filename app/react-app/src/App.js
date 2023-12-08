import React, { useState, useEffect } from 'react';

function App() {
    const [data, setData] = useState([]);

    useEffect(() => {
        // fetch for receiving data from backend (the port which you specified in backend docker run)
        fetch('http://your_server_ip_address:8080/', {
            method: 'GET',
            mode: 'cors',
            credentials: 'include', // Enables sending a cookie on cross-domain requests
            headers: {
                'Content-Type': 'application/json',
            },
        })
        .then(response => response.json())
        .then(result => {
            // Check that result.data is an array
            if (Array.isArray(result.data)) {
                setData(result.data);
            } else {
                console.error('Data is not an array:', result.data);
            }
        })
        .catch(error => console.error('Error fetching data:', error));
    }, []);

    return (
        <div>
            {data.map(item => (
                // Your code for displaying the data
                <div key={item.id}>{item.name}</div>
            ))}
        </div>
    );
}

export default App;
