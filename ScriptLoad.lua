if _G.HOHO_RAN then return end
_G.HOHO_RAN = true

-- Garanti que o ambiente esteja correto
for Index, Value in next, debug do
    if not getgenv()[Index] then
        getgenv()[Index] = Value
    end
end

-- Definindo a função clone
local function cloneref(g)
    if not getgenv().InstanceList then return end
    for b, c in pairs(getgenv().InstanceList) do
        if c == g then
            getgenv().InstanceList[b] = nil
            return g
        end
    end
end

if not getgenv().cloneref then getgenv().cloneref = cloneref end

repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

notify = loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Notification.lua"))()

-- Definindo uma chave permanente
local permanentKey = "DragonOFICIAL"

-- Função para carregar o script do Blox Fruits com a chave permanente
local function loadBloxFruits()
    -- Adicionando a chave permanente como parte do ambiente
    getgenv().key = permanentKey
    
    -- Carregando o script do Blox Fruits
    loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HohoV2/main/BloxFruit/BloxFruitTEST_ONLY.lua"))()
end

-- Verifica a versão e carrega o script do Blox Fruits
if _G.HOHO_PVP_UI or _G.HohoVersion == "v3" then
    return loadBloxFruits()
end

-- Carregando o script pela primeira vez
loadBloxFruits()
