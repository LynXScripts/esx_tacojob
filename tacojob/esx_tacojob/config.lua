Config                            = {}
Config.DrawDistance               = 100.0

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement      = true
Config.EnableHelicopters          = false
Config.EnableMoneyWash            = false
Config.MaxInService               = -1
Config.Locale                     = 'en'

Config.MissCraft                  = 0 -- %


Config.AuthorizedVehicles = {
    { name = 'boxville2',  label = 'Burger Truck' },
}

Config.Blips = {
    
    Blip = {
      Pos     = { x = 20.3, y = -1602.0, z = 29.4 },
      Sprite  = 82,
      Display = 4,
      Scale   = 1.,
      Colour  = 49,
    },

}

Config.Zones = {

    Cloakrooms = {
        Pos   = { x = 20.3, y = -1602.0, z = 29.4 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 255, g = 0, b = 0 },
        Type  = 27,
    },

    Vaults = {
        Pos   = { x = 12.8, y = -1600.5, z = 29.4 },
        Size  = { x = 1.0, y = 1.0, z = 1.0 },
        Color = { r = 30, g = 144, b = 255 },
        Type  = 27,
    },

    Fridge = {
        Pos   = { x = 16.7, y = -1599.7, z = 29.4 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 255, g = 0, b = 0 },
        Type  = 27,
    },
	
	Cook = {
        Pos   = { x = 11.5, y = -1599.2, z = 29.4 },
        Size  = { x = 1., y = 1., z = 1.0 },
        Color = { r = 0, g = 200, b = 220 },
        Type  = 27,
    },
	
	Vehicles = {
        Pos          = { x = -1172.37, y = -899.39, z = 12.9 },
        SpawnPoint   = { x = -1170.55, y = -892.59, z = 13.94 },
        Size         = { x = 1.8, y = 1.8, z = 1.0 },
        Color        = { r = 255, g = 255, b = 0 },
        Type         = 27,
        Heading      = 30.00,
    },

    VehicleDeleters = {
        Pos   = { x = -1164.48, y = -891.76, z = 13.15 },
        Size  = { x = 3.0, y = 3.0, z = 0.2 },
        Color = { r = 255, g = 255, b = 0 },
        Type  = 27,
    },
    
    BossActions = {
        Pos   = { x = -1202.46, y = -895.0, z = 13.0 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 0, g = 100, b = 0 },
        Type  = 1,
    },
}


-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
  barman_outfit = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 281,   ['torso_2'] = 1,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 4,
        ['pants_1'] = 52,   ['pants_2'] = 2,
        ['shoes_1'] = 1,   ['shoes_2'] = 10,
        ['chain_1'] = 0,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] =2,   ['tshirt_2'] = 0,
        ['torso_1'] = 294,    ['torso_2'] = 2,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 1,
        ['pants_1'] = 54,   ['pants_2'] = 1,
        ['shoes_1'] = 4,    ['shoes_2'] = 3,
        ['chain_1'] = 0,    ['chain_2'] = 0
    }
  }
}
