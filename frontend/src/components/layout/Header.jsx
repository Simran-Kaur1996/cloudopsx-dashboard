// src/components/layout/Header.jsx
import React from 'react'
import {
  AppBar,
  Toolbar,
  Typography,
  TextField,
  Box,
  Button,
  useTheme
} from '@mui/material'

const Header = () => {
  const theme = useTheme()

  return (
    <AppBar position="static" sx={{ bgcolor: '#1e293b', boxShadow: 'none' }}>
      <Toolbar
        sx={{
          display: 'flex',
          justifyContent: 'space-between',
          flexWrap: 'wrap',
          gap: 2
        }}
      >
        {/* Logo + Title */}
        <Typography variant="h6" fontWeight={700} sx={{ flexShrink: 0 }}>
          CloudOpsX{' '}
          <span style={{ color: '#cbd5e1' }}>– Inventory Intelligence</span>
        </Typography>

        {/* Search + User Info + Logout */}
        <Box
          sx={{
            display: 'flex',
            gap: 2,
            alignItems: 'center',
            flexWrap: 'wrap'
          }}
        >
          <TextField
            placeholder="Search inventory..."
            size="small"
            variant="outlined"
            sx={{
              bgcolor: '#334155',
              input: { color: 'white' },
              borderRadius: 1,
              '& fieldset': { borderColor: '#475569' },
              '&:hover fieldset': { borderColor: '#64748b' }
            }}
          />

          <Typography variant="body2" color="white">
            Logged in as <strong>Simranjeet</strong>
          </Typography>

          <Button
            variant="contained"
            color="error"
            size="small"
            sx={{ fontSize: '0.8rem', textTransform: 'none' }}
          >
            Logout
          </Button>
        </Box>
      </Toolbar>
    </AppBar>
  )
}

export default Header
