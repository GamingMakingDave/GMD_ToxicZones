ESX = exports['es_extended']:getSharedObject()

Citizen.CreateThread(function()
  while Config.ZoneBlip do
    for i, v in ipairs(Config.ToxicZones.ZoneSettings) do
      local blip = AddBlipForRadius(v.coords[1], v.coords[2], v.coords[3] + 250, v.radius);
      SetBlipColour(blip, 47);
      SetBlipAlpha(blip, 1)
    end
    Wait(0)
  end
end)

Citizen.CreateThread(function()
  local ped = PlayerPedId()
  while Config.ZoneBlip do
    for i, v in ipairs(Config.ToxicZones.ZoneSettings) do
      local dist = #(GetEntityCoords(ped) - v.coords)
      if dist < v.radius then

        RequestAnimSet("move_m@buzzed")
        while not HasAnimSetLoaded("move_m@buzzed") do
          Citizen.Wait(0)
        end

        TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SMOKING_POT", 0, 1)
        Citizen.Wait(3000)
        ClearPedTasksImmediately(ped)
        SetPedMotionBlur(ped, true)
        SetPedMovementClipset(ped, "move_m@buzzed", true)
        SetPedIsDrunk(ped, true)
        SetTimecycleModifier("spectator5")
        AnimpostfxPlay("Rampage", 10000001, true)
        ShakeGameplayCam("DRUNK_SHAKE", 1.5)

        SetEntityHealth(GetPlayerPed(-1), 200)
        print("InZone")
      else
        SetPedMoveRateOverride(PlayerId(), 1.0)
        SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
        SetPedIsDrunk(GetPlayerPed(-1), false)
        SetPedMotionBlur(ped, false)
        ResetPedMovementClipset(GetPlayerPed(-1))
        AnimpostfxStopAll()
        ShakeGameplayCam("DRUNK_SHAKE", 0.0)
        SetTimecycleModifierStrength(0.0)
        print("Outzone")
        break
      end
    end
    Wait(0)
  end
end)
