import React, { useState, useEffect } from 'react';

function App() {
    const [data, setData] = useState([]);

    useEffect(() => {
        // Ваш код для получения данных, например, с использованием fetch
        fetch('http://51.250.102.45:8080/', {
            method: 'GET',
            mode: 'cors',
            credentials: 'include', // Включает отправку куки при кросс-доменных запросах
            headers: {
                'Content-Type': 'application/json',
                // Другие необходимые заголовки
            },
        })
        .then(response => response.json())
        .then(result => {
            // Проверяем, что result.data является массивом
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
                // Ваш код для отображения данных
                <div key={item.id}>{item.name}</div>
            ))}
        </div>
    );
}

export default App;
