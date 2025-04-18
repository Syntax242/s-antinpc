local areas = Config.Areas

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerCoords = GetEntityCoords(PlayerPedId())
        for _, area in pairs(areas) do
            local distance = #(playerCoords - area.coords)
            if distance <= area.radius then
                SetPedDensityMultiplierThisFrame(0.0)
                SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
                SetVehicleDensityMultiplierThisFrame(0.0)
                SetRandomVehicleDensityMultiplierThisFrame(0.0)
                SetParkedVehicleDensityMultiplierThisFrame(0.0)
                ClearAreaOfPeds(area.coords.x, area.coords.y, area.coords.z, area.radius, 1)
            end
        end
    end
end)
