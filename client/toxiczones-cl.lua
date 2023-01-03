ESX = exports['es_extended']:getSharedObject()

Citizen.CreateThread(function()
    while Config.ZoneBlip do
      for i, v in ipairs(Config.RadioStationCoords.ZoneSettings) do
        local blip = AddBlipForRadius(v.coords[1], v.coords[2], v.coords[3] + 250, v.radius);
      SetBlipColour(blip, 47);
      SetBlipAlpha(blip, 1)
      end
      Wait(0)
      break
    end
  end)