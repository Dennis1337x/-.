addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), function()
  local file = fileOpen("lisans.txt") or false
  if not file then
    print("\n------------------------------------\n~ diwnessAC - lisans.txt bulunamadı------------------------------------")
    cancelEvent()
    stopResource(getThisResource())
    return
  end
  local count = fileGetSize(file) 
  local license = fileRead(file, count) 
  fileClose(file) 
  local time = getRealTime()
  local year = time.year + 1900
  local month = time.month + 1
  local day = time.monthday

  license = string.gsub(license, "[\n\r]", "")
  license = string.gsub(license, " ", "")

  if license == "" then 
    cancelEvent()
    stopResource(getThisResource())
    return
  end

  print("~ diwnessAC - Lisans Kontrol ediliyor...")
  fetchRemote("https://46.102.237.34/"..license, function(responseData, error)
    if string.find(responseData, "Confirmed") then 
      print("~ diwnessAC - Giriş başarılı")
      --setElementData(getResourceRootElement(getThisResource()), "XAC_42AK1YUHAC_IS_ACTIVE_vTyfcQv41b_AND_LICENSE_Z9orj7X0Lx_IS_CONFIRMED", true)
    else 
      print("\n------------------------------------\n~ AnverScripting - "..responseData.."\n------------------------------------")
      stopResource(getThisResource())
    end 
  end )
end)

local veriler = {
    ["money"] = true,
    ["playerid"] = true,
    ["etiket"] = true,
    ["hoursplayed"] = true,
    ["admin_level"] = true,
    ["vip"] = true,
    ["bankmoney"] = true,
}

addEventHandler("onElementDataChange", root, function(dataName, oldValue)
    if veriler[dataName] and client then
        setElementData(source, dataName, oldValue)
       -- local serial = getPlayerSerial(client)
        --local mesaj = "yakaladim abijim"
        cancelEvent()
        outputChatBox("aynen kanzi yaptin suan :)")
    end

    if client and client ~= source and veriler[dataName] then
        setElementData(sorce, dataName, oldValue)
        cancelEvent()
        outputChatBox("onu yapamazsin kanzi.")

    end
end)

addEventHandler("onPlayerWeaponSwitch", root,function(weapon, endX, endY, endZ, hitElement, startX, startY, startZ)
    if not exports.global:hasItem(source, 115) then
        local msg = "[ADMIN BUM]" .. getPlayerName(source) .. " adlı oyuncu silah hilesi denedi ve atıldı"
        exports.global:sendMessageToAdmins(msg)
        kickPlayer(source, source, "bamgüm")
        cancelEvent()
    end
end)

addEvent("annesiz" , true)
addEventHandler("annesiz" , root , function()
		local logClient = getPlayerName(source)
		local logSource = "Fonksiyon"
		local logText = 
		"=======================================\n"..
		"Supheli Hileci - Diwness Roleplay Anti Hile\n"..
		"Hileci Adi: "..logClient.."\n"..
		"Kullanilan Hile: "..logSource..""..
		"======================================="
		local ip = getPlayerIP(source)
		local serial = getPlayerSerial(source)
		local kad = getPlayerName(source)
		addBan(ip, kad, serial, "DiwnessAC", "Fonksiyon Hilesi", 0)
		outputDebugString(logText)
		outputChatBox(""..logClient.." adlı oyuncu Fonksiyon hilesi denedi ve Diwness Anti Hile tarafından banlandı!", getRootElement())
end)
