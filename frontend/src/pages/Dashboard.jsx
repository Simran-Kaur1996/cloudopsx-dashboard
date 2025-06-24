// FULL MUI DASHBOARD IMPLEMENTATION

import React from 'react'
import {
  Typography,
  Box,
  CssBaseline,
  Container,
  Grid,
  Paper,
  Button,
  Checkbox,
  FormControlLabel,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Card,
  CardContent,
  Chip
} from '@mui/material'
import CategoryQuantityChart from '../components/charts/CategoryQuantityChart'
import Header from '../components/layout/Header'

const Dashboard = () => {
  return (
    <Box
      sx={{
        display: 'flex',
        flexDirection: 'column',
        minHeight: '100vh',
        bgcolor: '#0f172a',
        color: 'white'
      }}
    >
      <CssBaseline />

      {/* Navbar */}
      <Header />

      {/* Filter */}
      {/* <Box
        px={4}
        py={2}
        bgcolor="#1e293b"
        display="flex"
        justifyContent="space-between"
        alignItems="center"
      >
        <FormControlLabel
          control={<Checkbox defaultChecked sx={{ color: '#3b82f6' }} />}
          label="Seroult Inventory"
        />
        <Button
          variant="contained"
          sx={{ bgcolor: '#3b82f6', '&:hover': { bgcolor: '#2563eb' } }}
        >
          Filter
        </Button>
      </Box> */}

      <Container maxWidth="xl" sx={{ py: 6 }}>
        <Grid container spacing={3} justifyContent={'space-between'}>
          {/* === ROW 1: First Two Charts === */}
          <Grid item xs={12} md={6}>
            <Paper sx={{ p: 2, bgcolor: '#1e293b' }}>
              <CategoryQuantityChart />
            </Paper>
          </Grid>

          <Grid item xs={12} md={6}>
            <Paper sx={{ p: 2, bgcolor: '#1e293b' }}>
              {/* StockStatusChart */}
              <CategoryQuantityChart />
            </Paper>
          </Grid>

          {/* === ROW 2: Second Two Charts === */}
          <Grid item xs={12} md={6}>
            <Paper sx={{ p: 2, bgcolor: '#1e293b' }}>
              {/* InventoryTrendChart */}
              <CategoryQuantityChart />
            </Paper>
          </Grid>

          <Grid item xs={12} md={6}>
            <Paper sx={{ p: 2, bgcolor: '#1e293b' }}>
              {/* SupplierDistributionChart */}
              <CategoryQuantityChart />
            </Paper>
          </Grid>

          {/* === ROW 3: Inventory Table === */}
          <Grid item xs={12} md={12} sm={12} lg={12} width={'100%'}>
            <Paper sx={{ p: 2, bgcolor: '#1e293b' }}>
              <Typography variant="h6" gutterBottom color="white">
                Inventory
              </Typography>

              <TableContainer>
                <Table size="small" sx={{ width: '100%' }}>
                  <TableHead>
                    <TableRow>
                      <TableCell sx={{ color: 'white' }}>Product ID</TableCell>
                      <TableCell sx={{ color: 'white' }}>Name</TableCell>
                      <TableCell sx={{ color: 'white' }}>Category</TableCell>
                      <TableCell sx={{ color: 'white' }}>Price</TableCell>
                      <TableCell sx={{ color: 'white' }}>
                        Stock Status
                      </TableCell>
                    </TableRow>
                  </TableHead>
                  <TableBody>
                    {[
                      [
                        '1001',
                        'Wireless Mouse',
                        'Accessories',
                        '$25',
                        'Low Stock'
                      ],
                      [
                        '1006',
                        'Gaming Monitor',
                        'Monitors',
                        '$350',
                        'Low Stock'
                      ],
                      [
                        '1009',
                        'Noise Canceling Headset',
                        'Accessories',
                        '$90',
                        'Out of Stock'
                      ],
                      [
                        '1013',
                        'External Hard Drive',
                        'Storage',
                        '$120',
                        'In Stock'
                      ],
                      ['1014', 'Webcam', 'Cameras', '$70', 'Low Stock']
                    ].map(([id, name, category, price, status], index) => (
                      <TableRow key={index}>
                        <TableCell sx={{ color: 'white' }}>{id}</TableCell>
                        <TableCell sx={{ color: 'white' }}>{name}</TableCell>
                        <TableCell sx={{ color: 'white' }}>
                          {category}
                        </TableCell>
                        <TableCell sx={{ color: 'white' }}>{price}</TableCell>
                        <TableCell>
                          <Chip
                            label={status}
                            color={
                              status === 'In Stock'
                                ? 'success'
                                : status === 'Low Stock'
                                ? 'warning'
                                : 'error'
                            }
                            size="small"
                          />
                        </TableCell>
                      </TableRow>
                    ))}
                  </TableBody>
                </Table>
              </TableContainer>
            </Paper>
          </Grid>
        </Grid>
      </Container>
    </Box>
  )
}

export default Dashboard
