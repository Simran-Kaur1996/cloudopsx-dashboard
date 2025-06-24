// src/components/charts/CategoryQuantityChart.jsx
import React, { useEffect, useState } from 'react'
import axios from 'axios'
import { Bar } from 'react-chartjs-2'
import {
  Chart as ChartJS,
  BarElement,
  CategoryScale,
  LinearScale,
  Tooltip,
  Legend,
  Title
} from 'chart.js'

ChartJS.register(BarElement, CategoryScale, LinearScale, Tooltip, Legend, Title)

const CategoryQuantityChart = () => {
  const [chartData, setChartData] = useState(null)

  useEffect(() => {
    // Fetch data from the API
    axios
      .get(`${process.env.REACT_APP_API_BASE_URL}/charts/inventory/`)
      .then((res) => {
        const data = res.data
        setChartData({
          labels: data.categories,
          datasets: [
            {
              label: 'Stock Quantity by Category',
              data: data.quantities,
              backgroundColor: 'rgba(59, 130, 246, 0.7)',
              borderRadius: 8,
              borderSkipped: false
            }
          ]
        })
      })
      .catch((err) => {
        console.error('Error fetching chart data', err)
      })
  }, [])

  const options = {
    responsive: true,
    maintainAspectRatio: false, // ✅ IMPORTANT
    plugins: {
      legend: {
        display: true,
        position: 'bottom',
        labels: { color: '#ffffff' }
      },
      title: {
        display: true,
        text: 'Inventory Quantity by Category',
        color: '#ffffff',
        font: { size: 18 },
        padding: { top: 10, bottom: 20 }
      }
    },
    scales: {
      x: {
        ticks: { color: '#ffffff' },
        grid: { color: 'rgba(255,255,255,0.1)' }
      },
      y: {
        ticks: { color: '#ffffff' },
        grid: { color: 'rgba(255,255,255,0.1)' }
      }
    }
  }

  return (
    <div
      className="bg-[#1e293b] p-4 rounded-lg shadow-md w-full"
      style={{ height: '320px' }}
    >
      {chartData ? (
        <Bar data={chartData} options={options} />
      ) : (
        <p className="text-white text-center">Loading chart...</p>
      )}
    </div>
  )
}

export default CategoryQuantityChart
