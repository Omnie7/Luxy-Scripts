--[[

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    V1.0.0

   ██╗     ██╗   ██╗██╗  ██╗██╗   ██╗    ██╗  ██╗██╗   ██╗██████╗ 
   ██║     ██║   ██║╚██╗██╔╝╚██╗ ██╔╝    ██║  ██║██║   ██║██╔══██╗
   ██║     ██║   ██║ ╚███╔╝  ╚████╔╝     ███████║██║   ██║██████╔╝
   ██║     ██║   ██║ ██╔██╗   ╚██╔╝      ██╔══██║██║   ██║██╔══██╗
   ███████╗╚██████╔╝██╔╝ ██╗   ██║       ██║  ██║╚██████╔╝██████╔╝
   ╚══════╝ ╚═════╝ ╚═╝  ╚═╝   ╚═╝       ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ 
  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

]]--

local v0 = "https://raw.githubusercontent.com/Omnie7/Luxy-Core/main/Library/LuxyV2.luau";
local v1 = "https://raw.githubusercontent.com/Omnie7/Luxy-Core/main/Data/KickBlox.luau";
local v2 = loadstring(game:HttpGet(v0))();
local v3 = loadstring(game:HttpGet(v1))();
local v4 = v2.CreateMain("Luxy HUB");
local v5 = v4:CreateTab("Main", (v2.GetIcon and v2.GetIcon("home")) or "rbxassetid://10723407389");
local v6 = v4:CreateTab("Shop", (v2.GetIcon and v2.GetIcon("shoppingcart")) or "rbxassetid://10734952479");
local v7 = getgenv();
if v7.LuxyHub_Unload then
	pcall(v7.LuxyHub_Unload);
end
v7.HubRunning = true;
v7.AFarm = false;
v7.TBrainrot = {"Any"};
v7.TRarity = {"Any"};
v7.TMutation = {"Any"};
v7.ATrain = false;
v7.A2xTrain = false;
v7.ACollect = false;
v7.CollectDelay = 1287 - (1192 + 35);
v7.AUpgrade = false;
v7.TUpgrade = {"Any"};
v7.MaxUpLevel = 1 - 0;
v7.PlotBrainrotList = {"Any"};
v7.ARebirth = false;
v7.APlotUpgrade = false;
v7.APlaceBest = false;
v7.IsPlacingPet = false;
v7.ABuySpeed = false;
v7.ABuyWeights = false;
v7.ABuyBest = false;
v7.TTargetWeight = "None";
v7.ASellAll = false;
v7.ASellFilter = false;
v7.SellDelay = 1790 - (1134 + 636);
v7.TSSellBrainrot = {"Any"};
v7.TSSellRarity = {"Any"};
v7.TSSellMutation = {"Any"};
local v35 = game:GetService("Players");
local v36 = game:GetService("Workspace");
local v37 = game:GetService("ReplicatedStorage");
local v38 = v35.LocalPlayer;
v7.LuxyHub_Unload = function()
	local v72 = 0 - 0;
	local v73;
	while true do
		if (v72 == (0 - 0)) then
			v73 = 157 - (26 + 131);
			while true do
				if (v73 == 0) then
					v7.HubRunning = false;
					v7.ASellAll = false;
					v7.ASellFilter = false;
					v73 = 1;
				end
				if (v73 == (1 + 3)) then
					v7.APlaceBest = false;
					if (v38.Character and v38.Character:FindFirstChild("Humanoid")) then
						v38.Character.Humanoid.MaxSlopeAngle = 174 - 129;
					end
					break;
				end
				if (v73 == (861 - (240 + 619))) then
					local v211 = 0 + 0;
					while true do
						if (v211 == (1 - 0)) then
							v7.ABuyWeights = false;
							v73 = 3;
							break;
						end
						if (v211 == 0) then
							v7.ACollect = false;
							v7.ABuySpeed = false;
							v211 = 1;
						end
					end
				end
				if (v73 == (1 + 0)) then
					local v212 = 1744 - (1344 + 400);
					while true do
						if ((405 - (255 + 150)) == v212) then
							v7.AFarm = false;
							v7.ATrain = false;
							v212 = 1 + 0;
						end
						if (v212 == (1 + 0)) then
							v7.A2xTrain = false;
							v73 = 8 - 6;
							break;
						end
					end
				end
				if (v73 == 3) then
					local v213 = 0;
					while true do
						if ((3 - 2) == v213) then
							v7.APlotUpgrade = false;
							v73 = 1743 - (404 + 1335);
							break;
						end
						if (v213 == (406 - (183 + 223))) then
							v7.ABuyBest = false;
							v7.ARebirth = false;
							v213 = 1 - 0;
						end
					end
				end
			end
			break;
		end
	end
end;
local function v40(v74, v75)
	local v76 = 0 + 0;
	local v77;
	while true do
		if ((0 + 0) == v76) then
			v77 = 337 - (10 + 327);
			while true do
				if (v77 == (0 + 0)) then
					local v214 = 338 - (118 + 220);
					while true do
						if (v214 == (0 + 0)) then
							if ((#v74 == (449 - (108 + 341))) or table.find(v74, "Any")) then
								return true;
							end
							return table.find(v74, v75) ~= nil;
						end
					end
				end
			end
			break;
		end
	end
end
local function v41()
	local v78 = 0 + 0;
	local v79;
	local v80;
	local v81;
	while true do
		local v175 = 0;
		while true do
			if (v175 == (4 - 3)) then
				if (v78 == (1494 - (711 + 782))) then
					local v215 = 0;
					while true do
						if (v215 == 1) then
							v78 = 3 - 1;
							break;
						end
						if (v215 == (469 - (270 + 199))) then
							v81 = v36:FindFirstChild("Plots");
							if v81 then
								for v344, v345 in ipairs(v81:GetChildren()) do
									local v346 = 0;
									local v347;
									while true do
										if (v346 == (0 + 0)) then
											v347 = v345:GetAttribute("Owner");
											if ((v347 == v38.Name) or (v347 == v38.DisplayName)) then
												return v345;
											end
											break;
										end
									end
								end
							end
							v215 = 1820 - (580 + 1239);
						end
					end
				end
				break;
			end
			if (v175 == (0 - 0)) then
				if (v78 == (2 + 0)) then
					return nil;
				end
				if (v78 == (0 + 0)) then
					local v216 = 0 + 0;
					while true do
						if (v216 == (2 - 1)) then
							v78 = 1 + 0;
							break;
						end
						if (v216 == 0) then
							v79, v80 = pcall(function()
								return require(v37:WaitForChild("Modules"):WaitForChild("ServicesLoader"):WaitForChild("ClientPlotService"));
							end);
							if (v79 and v80 and v80.Model) then
								return v80.Model;
							end
							v216 = 1168 - (645 + 522);
						end
					end
				end
				v175 = 1791 - (1010 + 780);
			end
		end
	end
end
local function v42(v82)
	local v83 = 0;
	local v84;
	while true do
		if (v83 == (0 + 0)) then
			v84 = 0 - 0;
			while true do
				if (v84 == (0 - 0)) then
					local v217 = 1836 - (1045 + 791);
					while true do
						if (v217 == 0) then
							for v311, v312 in ipairs(v82:GetChildren()) do
								if (v3.MutationOptions and table.find(v3.MutationOptions, v312.Name) and (v312.Name ~= "None") and (v312.Name ~= "Any")) then
									return v312.Name;
								end
							end
							return "None";
						end
					end
				end
			end
			break;
		end
	end
end
local v43 = v37:FindFirstChild("Shared");
if v43 then
	v43 = v43:FindFirstChild("Packages");
end
if v43 then
	v43 = v43:FindFirstChild("Network");
end
local v44 = (v43 and v43:FindFirstChild("rev_KickEvent")) or v37:FindFirstChild("rev_KickEvent", true);
local v45 = (v43 and v43:FindFirstChild("rev_B_Collect")) or v37:FindFirstChild("rev_B_Collect", true);
local v46 = (v43 and v43:FindFirstChild("rev_B_Upgrade")) or v37:FindFirstChild("rev_B_Upgrade", true);
local v47 = (v43 and v43:FindFirstChild("rev_SPEED_UPGRADE")) or v37:FindFirstChild("rev_SPEED_UPGRADE", true);
local v48 = (v43 and v43:FindFirstChild("rev_Shop_Buy")) or v37:FindFirstChild("rev_Shop_Buy", true);
local v49 = (v43 and v43:FindFirstChild("rev_WeightEquip")) or v37:FindFirstChild("rev_WeightEquip", true);
local v50 = (v43 and v43:FindFirstChild("ref_B_SellAll")) or v37:FindFirstChild("ref_B_SellAll", true);
local v51 = (v43 and v43:FindFirstChild("ref_B_Sell")) or v37:FindFirstChild("ref_B_Sell", true);
local v52 = (v43 and v43:FindFirstChild("rev_RebirthRequest")) or v37:FindFirstChild("rev_RebirthRequest", true);
local v53 = (v43 and v43:FindFirstChild("rev_bs_upgrade")) or v37:FindFirstChild("rev_bs_upgrade", true);
local v54 = (v43 and v43:FindFirstChild("rev_S_Interact")) or v37:FindFirstChild("rev_S_Interact", true);
local v55 = v37:FindFirstChild("Objects") and v37.Objects:FindFirstChild("WeightModels");
local v56 = v37:FindFirstChild("WeightsData", true);
local v57 = nil;
pcall(function()
	if v56 then
		v57 = require(v56);
	end
end);
local v58 = nil;
local v59 = {};
pcall(function()
	local v85 = 0 - 0;
	while true do
		if ((0 - 0) == v85) then
			v58 = require(v37.Shared.Data.EntitiesData);
			if (v58 and v58.Brainrots) then
				for v218, v219 in pairs(v58.Brainrots) do
					local v220 = 0;
					local v221;
					while true do
						if (v220 == 0) then
							v221 = string.lower(string.gsub(v218, "[%s%p]", ""));
							v59[v221] = v219;
							break;
						end
					end
				end
			end
			break;
		end
	end
end);
local function v60(v86)
	local v87 = 0;
	local v88;
	local v89;
	local v90;
	local v91;
	local v92;
	while true do
		if (v87 == (506 - (351 + 154))) then
			v88 = string.gsub(tostring(v86), "[,%s%$]", "");
			v89, v90 = string.match(v88, "^([%d%.]+)(%a*)$");
			v87 = 1576 - (1281 + 293);
		end
		if (v87 == (270 - (28 + 238))) then
			return v91;
		end
		if ((0 - 0) == v87) then
			if not v86 then
				return 1559 - (1381 + 178);
			end
			if (type(v86) == "number") then
				return v86;
			end
			v87 = 1;
		end
		if (v87 == (2 + 0)) then
			if not v89 then
				return tonumber(v88) or (0 + 0);
			end
			v91 = tonumber(v89) or (0 + 0);
			v87 = 10 - 7;
		end
		if (v87 == 3) then
			local v192 = 0 + 0;
			while true do
				if (1 == v192) then
					v87 = 474 - (381 + 89);
					break;
				end
				if ((0 + 0) == v192) then
					v92 = {K=(3 + 0),M=(9 - 3),B=9,T=(1168 - (1074 + 82)),Q=15,Qi=18,S=(45 - 24),Sp=(1808 - (214 + 1570)),O=(1482 - (990 + 465)),N=(13 + 17),D=(15 + 18)};
					if (v90 and (v90 ~= "") and v92[v90]) then
						return v91 * ((10 + 0) ^ v92[v90]);
					end
					v192 = 1;
				end
			end
		end
	end
end
local function v61()
	local v93 = 0;
	local v94;
	while true do
		local v176 = 0 - 0;
		while true do
			if (0 == v176) then
				if (v93 == (1726 - (1668 + 58))) then
					local v222 = 626 - (512 + 114);
					while true do
						if (v222 == (0 - 0)) then
							v94 = v38:FindFirstChild("leaderstats") and v38.leaderstats:FindFirstChild("Coins");
							if v94 then
								return v60(v94.Value);
							end
							v222 = 1;
						end
						if (v222 == (1 - 0)) then
							v93 = 3 - 2;
							break;
						end
					end
				end
				if ((1 + 0) == v93) then
					return 0;
				end
				break;
			end
		end
	end
end
local function v62(v95)
	local v96 = 0;
	local v97;
	while true do
		if (v96 == (0 + 0)) then
			v97 = 0 + 0;
			while true do
				if (v97 == 0) then
					if (v57 and v57.Weights and v57.Weights[v95]) then
						local v258 = v57.Weights[v95].Cost;
						if v258 then
							local v313 = 0 - 0;
							local v314;
							local v315;
							local v316;
							while true do
								if (v313 == (1994 - (109 + 1885))) then
									v314 = 0;
									v315 = nil;
									v313 = 1470 - (1269 + 200);
								end
								if ((1 - 0) == v313) then
									v316 = nil;
									while true do
										local v370 = 815 - (98 + 717);
										while true do
											if (v370 == (826 - (802 + 24))) then
												if (1 == v314) then
													return v315 * ((17 - 7) ^ v316);
												end
												if (0 == v314) then
													v315 = v258.first or (0 - 0);
													v316 = v258.second or 0;
													v314 = 1 + 0;
												end
												break;
											end
										end
									end
									break;
								end
							end
						end
					end
					return math.huge;
				end
			end
			break;
		end
	end
end
local v63 = nil;
local function v64()
	local v98 = 0 + 0;
	local v99;
	while true do
		local v177 = 0 + 0;
		while true do
			if (v177 == (0 + 0)) then
				if (1 == v98) then
					if v55 then
						local v259 = 0;
						while true do
							if (v259 == (2 - 1)) then
								v63 = v99;
								break;
							end
							if (v259 == 0) then
								for v348, v349 in ipairs(v55:GetChildren()) do
									table.insert(v99, {name=v349.Name,price=v62(v349.Name)});
								end
								table.sort(v99, function(v350, v351)
									return v350.price < v351.price;
								end);
								v259 = 1;
							end
						end
					end
					return v99;
				end
				if (v98 == 0) then
					if v63 then
						return v63;
					end
					v99 = {};
					v98 = 1;
				end
				break;
			end
		end
	end
end
local function v65()
	local v100 = 0 - 0;
	local v101;
	while true do
		local v178 = 0;
		while true do
			if (v178 == (0 + 0)) then
				if (v100 == 1) then
					return 0 + 0;
				end
				if (v100 == (0 + 0)) then
					local v223 = 0 + 0;
					while true do
						if (v223 == (1 + 0)) then
							v100 = 1;
							break;
						end
						if (v223 == 0) then
							v101 = v38:FindFirstChild("PlayerGui");
							if v101 then
								for v352, v353 in ipairs(v101:GetDescendants()) do
									if (v353:IsA("TextLabel") and v353.Parent and (v353.Parent.Name == "KickLevel") and (type(v353.Text) == "string")) then
										local v371 = 1433 - (797 + 636);
										local v372;
										local v373;
										while true do
											if (v371 == (4 - 3)) then
												if v373 then
													return v60(v373);
												end
												break;
											end
											if (v371 == (1619 - (1427 + 192))) then
												local v422 = 0;
												while true do
													if (v422 == (1 + 0)) then
														v371 = 2 - 1;
														break;
													end
													if (v422 == 0) then
														v372 = v353.Text:gsub("<[^>]+>", ""):gsub(",", "");
														v373 = v372:match("([%d%.]+[a-zA-Z]*)");
														v422 = 1 + 0;
													end
												end
											end
										end
									end
								end
							end
							v223 = 1 + 0;
						end
					end
				end
				break;
			end
		end
	end
end
local function v66()
	local v102 = 0;
	local v103;
	while true do
		if (v102 == (327 - (192 + 134))) then
			return math.huge;
		end
		if (v102 == (1276 - (316 + 960))) then
			v103 = v38:FindFirstChild("PlayerGui");
			if v103 then
				for v224, v225 in ipairs(v103:GetDescendants()) do
					if (v225:IsA("TextLabel") and (type(v225.Text) == "string")) then
						local v260 = 0;
						local v261;
						local v262;
						while true do
							if ((1 + 0) == v260) then
								if v262 then
									return v60(v262);
								end
								break;
							end
							if (v260 == (0 + 0)) then
								v261 = v225.Text:gsub("<[^>]+>", ""):gsub(",", "");
								v262 = v261:match("/%s*([%d%.]+[a-zA-Z]*)%s*Kick");
								v260 = 1 + 0;
							end
						end
					end
				end
			end
			v102 = 3 - 2;
		end
	end
end
local v67 = {"Golden","Diamond","Plasma","Radioactive","Molten","Void","Shadow","Electrified","Rainbow","Virus","Wet","Alien","Bacon","Enchanted"};
local v68 = {Golden=1.5,Diamond=(2 + 0),Plasma=3,Radioactive=(1 + 3),Molten=5,Void=(10 - 4),Shadow=7,Electrified=(1919 - (340 + 1571)),Rainbow=10,Virus=(5 + 7),Wet=(1787 - (1733 + 39)),Alien=(54 - 34),Bacon=(1059 - (125 + 909)),Enchanted=30};
local function v69(v104, v105)
	local v106 = 1948 - (1096 + 852);
	local v107;
	local v108;
	local v109;
	local v110;
	while true do
		local v179 = 0;
		while true do
			if (v179 == 1) then
				if (v106 == (1 + 1)) then
					local v226 = 0 - 0;
					while true do
						if ((1 + 0) == v226) then
							v106 = 3;
							break;
						end
						if ((512 - (409 + 103)) == v226) then
							v110 = 1;
							if (v105 and (v105 ~= "None") and (v105 ~= "")) then
								v110 = v68[v105] or (237.5 - (46 + 190));
							end
							v226 = 96 - (51 + 44);
						end
					end
				end
				if (v106 == 1) then
					local v227 = 0 + 0;
					while true do
						if (v227 == (1317 - (1114 + 203))) then
							v109 = 1;
							if v108 then
								local v319 = 726 - (228 + 498);
								local v320;
								while true do
									if ((0 + 0) == v319) then
										v320 = v108.CPS;
										if (type(v320) == "table") then
											if (v320.first and v320.second) then
												v109 = v320.first * ((6 + 4) ^ v320.second);
											else
												v109 = tonumber(v320.Value) or tonumber(v320[664 - (174 + 489)]) or tonumber(v320.Base) or (2 - 1);
											end
										else
											v109 = tonumber(v320) or (1906 - (830 + 1075));
										end
										break;
									end
								end
							end
							v227 = 525 - (303 + 221);
						end
						if (v227 == (1270 - (231 + 1038))) then
							v106 = 2;
							break;
						end
					end
				end
				break;
			end
			if (v179 == 0) then
				if (v106 == 3) then
					return v109 * v110;
				end
				if (v106 == (0 + 0)) then
					v107 = string.lower(string.gsub(v104, "[%s%p]", ""));
					v108 = v59[v107];
					v106 = 1163 - (171 + 991);
				end
				v179 = 4 - 3;
			end
		end
	end
end
v5:CreateSection("Farming");
v5:CreateDropdownSearch("Filter Brainrot", v3.BrainrotOptions, true, function(v111)
	v7.TBrainrot = v111;
end);
v5:CreateDropdownSearch("Filter Rarity", v3.RarityOptions, true, function(v113)
	v7.TRarity = v113;
end);
v5:CreateDropdownSearch("Filter Mutation", v3.MutationOptions, true, function(v115)
	v7.TMutation = v115;
end);
v5:CreateToggle("Auto Kick [Perfect]", false, function(v117)
	local v118 = 0 - 0;
	while true do
		if (v118 == (2 - 1)) then
			if v7.AFarm then
				task.spawn(function()
					while v7.HubRunning and v7.AFarm do
						task.wait(0.1 + 0);
						local v244 = v38.Character;
						if not v244 then
							continue;
						end
						local v245 = v244:FindFirstChild("HumanoidRootPart");
						local v246 = v244:FindFirstChild("Humanoid");
						local v247 = v36.CurrentCamera;
						if (not v245 or not v246 or (v246.Health <= (0 - 0))) then
							continue;
						end
						local v248 = v36:FindFirstChild("Areas");
						if v248 then
							v248 = v248:FindFirstChild("KickReady");
						end
						if (not v248 or (v247.CameraSubject ~= v246)) then
							continue;
						end
						local v249 = v36:FindFirstChild("Waves");
						local v250 = v249 and (#v249:GetChildren() > (0 - 0));
						local v251 = v38:FindFirstChild("PlayerGui");
						local v252 = v251 and v251:FindFirstChild("HUD");
						local v253 = v252 and v252:FindFirstChild("KickButton");
						if v250 then
							local v286 = 0;
							local v287;
							local v288;
							local v289;
							local v290;
							local v291;
							local v292;
							while true do
								if (v286 == (1 - 0)) then
									v289 = v288[3 - 2] or "Unknown";
									v290 = v288[1250 - (111 + 1137)] or "None";
									v286 = 160 - (91 + 67);
								end
								if (v286 == (0 - 0)) then
									local v354 = 0 + 0;
									while true do
										if (v354 == (524 - (423 + 100))) then
											v286 = 1 + 0;
											break;
										end
										if (v354 == (0 - 0)) then
											v287 = v38:GetAttribute("InGame") or "";
											v288 = string.split(v287, ",");
											v354 = 1;
										end
									end
								end
								if (v286 == 3) then
									if (v40(v7.TBrainrot, v289) and v40(v7.TRarity, v291) and v40(v7.TMutation, v290)) then
										v292 = false;
									end
									if v292 then
										local v375 = 0 + 0;
										local v376;
										local v377;
										local v378;
										while true do
											if (v375 == (771 - (326 + 445))) then
												v247.CameraType = Enum.CameraType.Scriptable;
												v247.CFrame = v248.CFrame * CFrame.new(0, 65 - 50, -(55 - 30));
												v375 = 2 - 1;
											end
											if (v375 == (714 - (530 + 181))) then
												v378 = v376:WaitForChild("Humanoid", 886 - (614 + 267));
												if (v377 and v378) then
													v377.CFrame = v248.CFrame * CFrame.new(32 - (19 + 13), 4 - 1, 0 - 0);
													task.wait(0.2);
													v247.CameraType = Enum.CameraType.Custom;
													v247.CameraSubject = v378;
												end
												break;
											end
											if (v375 == (2 - 1)) then
												v247.CFrame = CFrame.lookAt(v247.CFrame.Position, v248.Position);
												v246.Health = 0 + 0;
												v375 = 2;
											end
											if (v375 == (3 - 1)) then
												v376 = v38.CharacterAdded:Wait();
												v377 = v376:WaitForChild("HumanoidRootPart", 10 - 5);
												v375 = 1815 - (1293 + 519);
											end
										end
									else
										local v379 = 0 - 0;
										local v380;
										while true do
											if (v379 == (2 - 1)) then
												v380 = Vector3.new(v245.Position.X, 0 - 0, v245.Position.Z) - Vector3.new(v248.Position.X, 0, v248.Position.Z);
												if (v380.Magnitude > 5) then
													v246:MoveTo(v248.Position);
												else
													v246:MoveTo(v245.Position);
												end
												break;
											end
											if (v379 == (0 - 0)) then
												v246.WalkSpeed = 235 - 135;
												v246.MaxSlopeAngle = 89;
												v379 = 1 + 0;
											end
										end
									end
									break;
								end
								if (v286 == (1 + 1)) then
									v291 = (v3.RarityMap and v3.RarityMap[v289]) or "Unknown";
									v292 = true;
									v286 = 6 - 3;
								end
							end
						else
							local v293 = 0 + 0;
							local v294;
							while true do
								if (v293 == (1 + 0)) then
									if (v294.Magnitude > (10 + 5)) then
										local v381 = 1096 - (709 + 387);
										while true do
											if (v381 == 0) then
												v245.CFrame = v248.CFrame * CFrame.new(1858 - (673 + 1185), 8 - 5, 0 - 0);
												task.wait(0.5 - 0);
												break;
											end
										end
									elseif (v253 and v253.Visible and v44) then
										local v404 = 0;
										while true do
											if (v404 == (0 + 0)) then
												pcall(function()
													v44:FireServer(0.999099329113793 + 0, 1);
												end);
												task.wait(0.5 - 0);
												break;
											end
										end
									end
									break;
								end
								if (v293 == (0 + 0)) then
									v246.MaxSlopeAngle = 45;
									v294 = Vector3.new(v245.Position.X, 0 - 0, v245.Position.Z) - Vector3.new(v248.Position.X, 0 - 0, v248.Position.Z);
									v293 = 1881 - (446 + 1434);
								end
							end
						end
					end
				end);
			end
			break;
		end
		if (v118 == (1283 - (1040 + 243))) then
			v7.AFarm = v117;
			if (not v7.AFarm and v38.Character and v38.Character:FindFirstChild("Humanoid")) then
				v38.Character.Humanoid.MaxSlopeAngle = 134 - 89;
			end
			v118 = 1;
		end
	end
end);
v5:CreateSection("Progression");
v5:CreateToggle("Auto Train", false, function(v119)
	v7.ATrain = v119;
end);
v5:CreateToggle("Auto Click 2x Train", false, function(v121)
	v7.A2xTrain = v121;
end);
v5:CreateToggle("Auto Rebirth (Smart)", false, function(v123)
	v7.ARebirth = v123;
end);
v5:CreateSection("Collect Cash");
v5:CreateToggle("Auto Collect Cash", false, function(v125)
	v7.ACollect = v125;
end);
v5:CreateSlider("Claim Delay (Seconds)", 1, 2447 - (559 + 1288), 60, function(v127)
	v7.CollectDelay = v127;
end);
v5:CreateSection("Auto Place Brainrot");
v5:CreateToggle("Auto Place Best Brainrot", false, function(v129)
	v7.APlaceBest = v129;
end);
v5:CreateSection("Upgrade Brainrot");
local v70 = v5:CreateDropdownSearch("Target Upgrade Brainrot", v7.PlotBrainrotList, true, function(v131)
	v7.TUpgrade = v131;
end);
v5:CreateButton("Refresh Plot Brainrot List", function()
	local v133 = 1931 - (609 + 1322);
	local v134;
	local v135;
	local v136;
	while true do
		if (v133 == 0) then
			local v194 = 454 - (13 + 441);
			while true do
				if (v194 == (3 - 2)) then
					v133 = 1;
					break;
				end
				if (v194 == (0 - 0)) then
					v134 = v41();
					v135 = {"Any"};
					v194 = 1;
				end
			end
		end
		if (v133 == (1 + 1)) then
			v7.PlotBrainrotList = v135;
			pcall(function()
				local v202 = 0 - 0;
				local v203;
				while true do
					if (v202 == (0 + 0)) then
						v203 = 0 + 0;
						while true do
							if (v203 == 0) then
								if (v70 and v70.Refresh) then
									v70:Refresh(v7.PlotBrainrotList);
								end
								if (v70 and v70.SetOptions) then
									v70:SetOptions(v7.PlotBrainrotList);
								end
								break;
							end
						end
						break;
					end
				end
			end);
			break;
		end
		if (v133 == (2 - 1)) then
			v136 = {};
			if (v134 and v134:FindFirstChild("Slots")) then
				for v229, v230 in ipairs(v134.Slots:GetChildren()) do
					local v231 = 0;
					local v232;
					while true do
						if (0 == v231) then
							v232 = v230:FindFirstChild("PlacedPart");
							if v232 then
								for v356, v357 in ipairs(v232:GetChildren()) do
									if (v357:IsA("Model") and not v357.Name:match("Hitbox")) then
										local v382 = 0 + 0;
										local v383;
										local v384;
										while true do
											if (v382 == 1) then
												if not v136[v384] then
													local v454 = 0;
													while true do
														if (v454 == (0 - 0)) then
															v136[v384] = true;
															table.insert(v135, v384);
															break;
														end
													end
												end
												break;
											end
											if ((0 + 0) == v382) then
												v383 = v42(v357);
												v384 = string.format("%s [%s]", v357.Name, v383);
												v382 = 1;
											end
										end
									end
								end
							end
							break;
						end
					end
				end
			end
			v133 = 2 + 0;
		end
	end
end);
v5:CreateSlider("Upgrade Times (Amount)", 1, 72 + 28, 1 + 0, function(v137)
	v7.MaxUpLevel = v137;
end);
v5:CreateButton("Start Auto Upgrade", function()
	local v139 = 0;
	local v140;
	local v141;
	while true do
		if (v139 == (1 + 0)) then
			if not v140 then
				return;
			end
			v141 = {};
			v139 = 435 - (153 + 280);
		end
		if (v139 == 2) then
			if v140:FindFirstChild("Slots") then
				for v233, v234 in ipairs(v140.Slots:GetChildren()) do
					local v235 = 0;
					local v236;
					while true do
						if (0 == v235) then
							v236 = v234:FindFirstChild("PlacedPart");
							if v236 then
								local v321 = 0;
								local v322;
								while true do
									if (v321 == (2 - 1)) then
										if v322 then
											local v405 = 0 + 0;
											local v406;
											local v407;
											local v408;
											while true do
												if (v405 == 2) then
													if v408 then
														local v465 = 0 + 0;
														local v466;
														while true do
															if (v465 == (0 + 0)) then
																v466 = tonumber(string.match(v234.Name, "%d+"));
																if v466 then
																	table.insert(v141, v466);
																end
																break;
															end
														end
													end
													break;
												end
												if (v405 == (1 + 0)) then
													v408 = false;
													if (type(v7.TUpgrade) == "table") then
														if (table.find(v7.TUpgrade, "Any") or (#v7.TUpgrade == (0 + 0))) then
															v408 = true;
														elseif table.find(v7.TUpgrade, v407) then
															v408 = true;
														end
													elseif (type(v7.TUpgrade) == "string") then
														if ((v7.TUpgrade == "Any") or (v7.TUpgrade == v407)) then
															v408 = true;
														end
													end
													v405 = 2;
												end
												if (v405 == (0 - 0)) then
													v406 = v42(v322);
													v407 = string.format("%s [%s]", v322.Name, v406);
													v405 = 1 + 0;
												end
											end
										end
										break;
									end
									if (v321 == (667 - (89 + 578))) then
										v322 = nil;
										for v396, v397 in ipairs(v236:GetChildren()) do
											if (v397:IsA("Model") and not v397.Name:match("Hitbox")) then
												v322 = v397;
												break;
											end
										end
										v321 = 1 + 0;
									end
								end
							end
							break;
						end
					end
				end
			end
			if (#v141 > 0) then
				task.spawn(function()
					for v254 = 1 - 0, v7.MaxUpLevel do
						if not v7.HubRunning then
							break;
						end
						for v263, v264 in ipairs(v141) do
							local v265 = 1049 - (572 + 477);
							while true do
								if (v265 == 0) then
									pcall(function()
										v46:FireServer(v264);
									end);
									task.wait(0.1);
									break;
								end
							end
						end
						task.wait(0.2 + 0);
					end
				end);
			end
			break;
		end
		if ((0 + 0) == v139) then
			if not v46 then
				return;
			end
			v140 = v41();
			v139 = 1 + 0;
		end
	end
end);
v5:CreateSection("Upgrade Plot");
v5:CreateToggle("Auto Upgrade Plot (Smart)", false, function(v142)
	v7.APlotUpgrade = v142;
end);
v6:CreateSection("Speed Upgrades");
v6:CreateToggle("Auto Buy Speed", false, function(v144)
	v7.ABuySpeed = v144;
end);
v6:CreateSection("Weight Upgrades");
v7.WeightList = {"None"};
if v55 then
	for v190, v191 in ipairs(v55:GetChildren()) do
		table.insert(v7.WeightList, v191.Name);
	end
end
v6:CreateDropdownSearch("Target Weight", v7.WeightList, false, function(v146)
	v7.TTargetWeight = v146;
end);
v6:CreateToggle("Auto Buy Selected Weight", false, function(v148)
	v7.ABuyWeights = v148;
end);
v6:CreateToggle("Auto Buy Best Weight (Smart)", false, function(v150)
	v7.ABuyBest = v150;
end);
v6:CreateSection("Inventory Management");
v6:CreateSlider("Sell Interval (Seconds)", 1, 98 - 38, 15 + 5, function(v152)
	v7.SellDelay = v152;
end);
v6:CreateDropdownSearch("Keep Brainrot (Whitelist)", v3.BrainrotOptions, true, function(v154)
	v7.TSSellBrainrot = v154;
end);
v6:CreateDropdownSearch("Keep Rarity (Whitelist)", v3.RarityOptions, true, function(v156)
	v7.TSSellRarity = v156;
end);
v6:CreateDropdownSearch("Keep Mutation (Whitelist)", v3.MutationOptions, true, function(v158)
	v7.TSSellMutation = v158;
end);
v6:CreateToggle("Auto Sell All", false, function(v160)
	v7.ASellAll = v160;
end);
v6:CreateToggle("Auto Sell Selected", false, function(v162)
	v7.ASellFilter = v162;
end);
task.spawn(function()
	while v7.HubRunning do
		task.wait(844 - (497 + 345));
		if (v7.APlaceBest and v54) then
			local v196 = 0 + 0;
			local v197;
			local v198;
			while true do
				if (v196 == (0 + 0)) then
					local v237 = 1333 - (605 + 728);
					while true do
						if (v237 == (0 + 0)) then
							v197 = v38.Character;
							v198 = v41();
							v237 = 1;
						end
						if ((1 - 0) == v237) then
							v196 = 1 + 0;
							break;
						end
					end
				end
				if (v196 == (3 - 2)) then
					if (v198 and v197) then
						local v266 = nil;
						local v267 = math.huge;
						local v268 = {};
						if v198:FindFirstChild("Slots") then
							for v323, v324 in ipairs(v198.Slots:GetChildren()) do
								local v325 = 0 + 0;
								local v326;
								local v327;
								local v328;
								while true do
									if ((2 - 1) == v325) then
										v328 = false;
										if v326 then
											for v431, v432 in ipairs(v326:GetChildren()) do
												if (v432:IsA("Model") and not v432.Name:match("Hitbox")) then
													v328 = true;
													local v455 = "None";
													for v461, v462 in ipairs(v432:GetChildren()) do
														if table.find(v67, v462.Name) then
															v455 = v462.Name;
															break;
														end
													end
													local v456 = v69(v432.Name, v455);
													if (v456 < v267) then
														local v467 = 0 + 0;
														while true do
															if ((489 - (457 + 32)) == v467) then
																v267 = v456;
																v266 = v327;
																break;
															end
														end
													end
													break;
												end
											end
										end
										v325 = 1 + 1;
									end
									if (v325 == (1404 - (832 + 570))) then
										if (not v328 and v327) then
											table.insert(v268, v327);
										end
										break;
									end
									if ((0 + 0) == v325) then
										local v385 = 0 + 0;
										while true do
											if (v385 == 0) then
												v326 = v324:FindFirstChild("PlacedPart");
												v327 = tonumber(string.match(v324.Name, "%d+"));
												v385 = 1;
											end
											if ((3 - 2) == v385) then
												v325 = 1 + 0;
												break;
											end
										end
									end
								end
							end
						end
						local v269 = nil;
						local v270 = -(797 - (588 + 208));
						local v271 = {};
						if v38.Backpack then
							for v329, v330 in ipairs(v38.Backpack:GetChildren()) do
								table.insert(v271, v330);
							end
						end
						for v296, v297 in ipairs(v197:GetChildren()) do
							if v297:IsA("Tool") then
								table.insert(v271, v297);
							end
						end
						for v298, v299 in ipairs(v271) do
							if v299:GetAttribute("GUID") then
								local v331 = 0 - 0;
								local v332;
								local v333;
								while true do
									if (v331 == (1800 - (884 + 916))) then
										v332 = v299:GetAttribute("Mutation") or "None";
										v333 = v69(v299.Name, v332);
										v331 = 1;
									end
									if (v331 == (1 - 0)) then
										if (v333 > v270) then
											local v409 = 0 + 0;
											local v410;
											while true do
												if (v409 == 0) then
													v410 = 0;
													while true do
														if (0 == v410) then
															v270 = v333;
															v269 = v299;
															break;
														end
													end
													break;
												end
											end
										end
										break;
									end
								end
							end
						end
						if v269 then
							if (#v268 > (653 - (232 + 421))) then
								local v358 = 1889 - (1569 + 320);
								local v359;
								while true do
									if (v358 == 0) then
										v359 = 0 + 0;
										while true do
											if ((1 + 0) == v359) then
												task.wait(0.6);
												pcall(function()
													v54:FireServer(v268[1]);
												end);
												v359 = 6 - 4;
											end
											if ((605 - (316 + 289)) == v359) then
												v7.IsPlacingPet = true;
												v269.Parent = v197;
												v359 = 2 - 1;
											end
											if (v359 == (1 + 1)) then
												task.wait(1453.5 - (666 + 787));
												v7.IsPlacingPet = false;
												break;
											end
										end
										break;
									end
								end
							elseif (v266 and (v270 > v267)) then
								local v386 = 425 - (360 + 65);
								while true do
									if (v386 == (4 + 0)) then
										task.wait(0.5);
										v7.IsPlacingPet = false;
										break;
									end
									if ((254 - (79 + 175)) == v386) then
										v7.IsPlacingPet = true;
										for v445, v446 in ipairs(v197:GetChildren()) do
											if v446:IsA("Tool") then
												v446.Parent = v38.Backpack;
											end
										end
										v386 = 1;
									end
									if (v386 == (1 - 0)) then
										task.wait(0.3 + 0);
										pcall(function()
											v54:FireServer(v266);
										end);
										v386 = 2;
									end
									if (2 == v386) then
										task.wait(2 - 1);
										v269.Parent = v197;
										v386 = 3;
									end
									if (v386 == (5 - 2)) then
										task.wait(0.6);
										pcall(function()
											v54:FireServer(v266);
										end);
										v386 = 4;
									end
								end
							end
						end
					end
					break;
				end
			end
		end
	end
end);
task.spawn(function()
	while v7.HubRunning do
		local v180 = 899 - (503 + 396);
		while true do
			if (v180 == (181 - (92 + 89))) then
				task.wait(0.5 - 0);
				if (v7.ATrain and not v7.IsPlacingPet) then
					local v238 = 0 + 0;
					local v239;
					local v240;
					while true do
						if ((1 + 0) == v238) then
							if (v240 and v55) then
								local v334 = 0 - 0;
								local v335;
								local v336;
								local v337;
								local v338;
								while true do
									if (v334 == (0 + 0)) then
										v335 = nil;
										v336 = -1;
										v334 = 2 - 1;
									end
									if ((2 + 0) == v334) then
										if v239 then
											local v411 = 0;
											local v412;
											while true do
												if (0 == v411) then
													v412 = v239:FindFirstChildOfClass("Tool");
													if v412 then
														table.insert(v337, v412);
													end
													break;
												end
											end
										end
										v338 = v64();
										v334 = 2 + 1;
									end
									if (v334 == 1) then
										v337 = {};
										for v398, v399 in ipairs(v38.Backpack:GetChildren()) do
											if v399:IsA("Tool") then
												table.insert(v337, v399);
											end
										end
										v334 = 5 - 3;
									end
									if ((1 + 2) == v334) then
										for v400, v401 in ipairs(v337) do
											for v413, v414 in ipairs(v338) do
												if ((v414.name == v401.Name) and (v413 > v336)) then
													local v447 = 0;
													while true do
														if (v447 == (0 - 0)) then
															v336 = v413;
															v335 = v401;
															break;
														end
													end
												end
											end
										end
										if v335 then
											local v415 = 0;
											local v416;
											while true do
												if (v415 == (1244 - (485 + 759))) then
													v416 = v239:FindFirstChildOfClass("Tool");
													if (not v416 or (v416.Name ~= v335.Name)) then
														local v468 = 0 - 0;
														while true do
															if (v468 == (1189 - (442 + 747))) then
																if v49 then
																	pcall(function()
																		v49:FireServer(v335.Name);
																	end);
																end
																if (v335.Parent == v38.Backpack) then
																	v240:EquipTool(v335);
																end
																break;
															end
														end
													end
													break;
												end
											end
										end
										break;
									end
								end
							end
							break;
						end
						if (v238 == (1135 - (832 + 303))) then
							v239 = v38.Character;
							v240 = v239 and v239:FindFirstChild("Humanoid");
							v238 = 947 - (88 + 858);
						end
					end
				end
				break;
			end
		end
	end
end);
task.spawn(function()
	while v7.HubRunning do
		local v181 = 0;
		local v182;
		while true do
			if (v181 == (0 + 0)) then
				v182 = 0 + 0;
				while true do
					if (v182 == (0 + 0)) then
						task.wait(789.1 - (766 + 23));
						if (v7.ABuySpeed and v47) then
							pcall(function()
								v47:FireServer(4 - 3);
							end);
						end
						break;
					end
				end
				break;
			end
		end
	end
end);
task.spawn(function()
	local v164 = false;
	local v165 = 0;
	local v166 = "";
	while v7.HubRunning do
		local v183 = 0 - 0;
		local v184;
		local v185;
		while true do
			if (v183 == (0 - 0)) then
				task.wait(0.5);
				v184 = v61();
				v183 = 3 - 2;
			end
			if (v183 == (1075 - (1036 + 37))) then
				if (v185 and v48) then
					local v241 = 0;
					local v242;
					while true do
						if ((1 + 0) == v241) then
							if (v166 ~= v185) then
								v164 = false;
							end
							if ((v184 >= v242) and not v164) then
								local v339 = 0 - 0;
								local v340;
								local v341;
								while true do
									if (v339 == (2 + 0)) then
										v341 = v61();
										if (v341 >= v340) then
											local v417 = 0;
											while true do
												if (v417 == 0) then
													v164 = true;
													v165 = v341;
													break;
												end
											end
										else
											v164 = false;
										end
										break;
									end
									if (v339 == 1) then
										pcall(function()
											v48:FireServer("WeightShop", v185);
										end);
										task.wait(1.5);
										v339 = 2;
									end
									if (v339 == (1480 - (641 + 839))) then
										v166 = v185;
										v340 = v61();
										v339 = 914 - (910 + 3);
									end
								end
							end
							break;
						end
						if ((0 - 0) == v241) then
							local v301 = 1684 - (1466 + 218);
							while true do
								if (v301 == 1) then
									v241 = 1 + 0;
									break;
								end
								if (v301 == (1148 - (556 + 592))) then
									v242 = v62(v185);
									if (v184 > v165) then
										v164 = false;
									end
									v301 = 1 + 0;
								end
							end
						end
					end
				end
				break;
			end
			if (v183 == 1) then
				local v204 = 0;
				while true do
					if (v204 == (808 - (329 + 479))) then
						v185 = nil;
						if (v7.ABuyBest and v55) then
							local v302 = 0;
							local v303;
							local v304;
							local v305;
							while true do
								if (v302 == (856 - (174 + 680))) then
									if v303 then
										local v387 = 0 - 0;
										local v388;
										while true do
											if (v387 == (0 - 0)) then
												v388 = v303:FindFirstChildOfClass("Tool");
												if v388 then
													table.insert(v305, v388);
												end
												break;
											end
										end
									end
									for v362, v363 in ipairs(v305) do
										if (v363:IsA("Tool") and v55:FindFirstChild(v363.Name)) then
											v304 = v363.Name;
										end
									end
									v302 = 3 + 0;
								end
								if (v302 == 3) then
									if v304 then
										local v389 = 739 - (396 + 343);
										local v390;
										local v391;
										while true do
											if (v389 == (0 + 0)) then
												local v436 = 1477 - (29 + 1448);
												while true do
													if (v436 == (1390 - (135 + 1254))) then
														v389 = 1;
														break;
													end
													if (v436 == (0 - 0)) then
														v390 = v64();
														v391 = 0 - 0;
														v436 = 1 + 0;
													end
												end
											end
											if (v389 == (1528 - (389 + 1138))) then
												for v448, v449 in ipairs(v390) do
													if (v449.name == v304) then
														v391 = v448;
														break;
													end
												end
												if ((v391 > (574 - (102 + 472))) and (v391 < #v390)) then
													v185 = v390[v391 + 1].name;
												elseif ((v391 == (0 + 0)) and (#v390 > (0 + 0))) then
													v185 = v390[1 + 0].name;
												end
												break;
											end
										end
									end
									break;
								end
								if (v302 == 1) then
									local v360 = 1545 - (320 + 1225);
									while true do
										if (1 == v360) then
											v302 = 2;
											break;
										end
										if (v360 == (0 - 0)) then
											v305 = {};
											for v418, v419 in ipairs(v38.Backpack:GetChildren()) do
												table.insert(v305, v419);
											end
											v360 = 1 + 0;
										end
									end
								end
								if (v302 == (1464 - (157 + 1307))) then
									local v361 = 1859 - (821 + 1038);
									while true do
										if (v361 == (0 - 0)) then
											v303 = v38.Character;
											v304 = nil;
											v361 = 1 + 0;
										end
										if (v361 == (1 - 0)) then
											v302 = 1;
											break;
										end
									end
								end
							end
						elseif (v7.ABuyWeights and (v7.TTargetWeight ~= "None")) then
							v185 = v7.TTargetWeight;
						end
						v204 = 1;
					end
					if ((1 + 0) == v204) then
						v183 = 4 - 2;
						break;
					end
				end
			end
		end
	end
end);
task.spawn(function()
	local v167 = 0;
	local v168;
	local v169;
	local v170;
	while true do
		if (v167 == (1027 - (834 + 192))) then
			v170 = nil;
			while true do
				if (v168 == (0 + 0)) then
					v169 = false;
					v170 = 0 + 0;
					v168 = 1 + 0;
				end
				if (v168 == (1 - 0)) then
					while v7.HubRunning do
						local v255 = 304 - (300 + 4);
						local v256;
						while true do
							if (v255 == 0) then
								task.wait(1 + 0);
								v256 = v61();
								v255 = 2 - 1;
							end
							if (1 == v255) then
								if (v7.APlotUpgrade and v53) then
									if (v256 > v170) then
										v169 = false;
									end
									if not v169 then
										local v392 = 362 - (112 + 250);
										local v393;
										local v394;
										while true do
											if (0 == v392) then
												local v437 = 0 + 0;
												while true do
													if (v437 == (0 - 0)) then
														v393 = v61();
														pcall(function()
															v53:FireServer();
														end);
														v437 = 1 + 0;
													end
													if (v437 == 1) then
														v392 = 1;
														break;
													end
												end
											end
											if (v392 == (2 + 0)) then
												if (v394 >= v393) then
													local v458 = 0;
													while true do
														if (v458 == 0) then
															v169 = true;
															v170 = v394;
															break;
														end
													end
												end
												break;
											end
											if (v392 == (1 + 0)) then
												task.wait(1 + 0);
												v394 = v61();
												v392 = 2;
											end
										end
									end
								end
								break;
							end
						end
					end
					break;
				end
			end
			break;
		end
		if (v167 == 0) then
			v168 = 0 + 0;
			v169 = nil;
			v167 = 1415 - (1001 + 413);
		end
	end
end);
task.spawn(function()
	local v171 = 0 - 0;
	local v172;
	while true do
		if (v171 == (882 - (244 + 638))) then
			v172 = false;
			while v7.HubRunning do
				local v205 = 693 - (627 + 66);
				while true do
					if (v205 == 0) then
						task.wait(2 - 1);
						if (v7.ARebirth and v52) then
							local v306 = 602 - (512 + 90);
							local v307;
							local v308;
							while true do
								if ((1907 - (1665 + 241)) == v306) then
									if ((v307 >= v308) and (v308 > 0) and not v172) then
										local v395 = 0;
										while true do
											if (v395 == (717 - (373 + 344))) then
												v172 = true;
												pcall(function()
													v52:FireServer();
												end);
												v395 = 1 + 0;
											end
											if (v395 == (1 + 0)) then
												task.wait(5);
												v172 = false;
												break;
											end
										end
									end
									break;
								end
								if (v306 == (0 - 0)) then
									v307 = v65();
									v308 = v66();
									v306 = 1 - 0;
								end
							end
						end
						break;
					end
				end
			end
			break;
		end
	end
end);
task.spawn(function()
	while v7.HubRunning do
		task.wait(1099.2 - (35 + 1064));
		if v7.A2xTrain then
			local v199 = 0 + 0;
			local v200;
			local v201;
			while true do
				if (v199 == (0 - 0)) then
					local v243 = 0 + 0;
					while true do
						if (v243 == (1237 - (298 + 938))) then
							v199 = 1260 - (233 + 1026);
							break;
						end
						if (v243 == 0) then
							v200 = v38:FindFirstChild("PlayerGui");
							v201 = v200 and v200:FindFirstChild("KickUpgrades");
							v243 = 1667 - (636 + 1030);
						end
					end
				end
				if ((1 + 0) == v199) then
					if v201 then
						for v309, v310 in ipairs(v201:GetChildren()) do
							if (v310.Name == "Bonus") then
								pcall(function()
									for v364, v365 in pairs(getconnections(v310.MouseButton1Click)) do
										v365:Fire();
									end
									for v366, v367 in pairs(getconnections(v310.Activated)) do
										v367:Fire();
									end
								end);
							end
						end
					end
					break;
				end
			end
		end
	end
end);
task.spawn(function()
	local v173 = 0;
	while v7.HubRunning do
		local v186 = 0 + 0;
		local v187;
		while true do
			if (v186 == (1 + 0)) then
				if not v187 then
					continue;
				end
				if (v7.ACollect and v45) then
					if ((tick() - v173) >= v7.CollectDelay) then
						local v272 = 0 + 0;
						local v273;
						local v274;
						while true do
							if (v272 == 0) then
								v173 = tick();
								v273 = v38.Character;
								v272 = 222 - (55 + 166);
							end
							if (v272 == (1 + 0)) then
								v274 = v273 and v273:FindFirstChild("HumanoidRootPart");
								if (v274 and v187:FindFirstChild("Slots") and v187:FindFirstChild("Buttons")) then
									local v368 = 0 + 0;
									local v369;
									while true do
										if (v368 == (0 - 0)) then
											v369 = v274.CFrame;
											for v438, v439 in ipairs(v187.Slots:GetChildren()) do
												local v440 = 0;
												local v441;
												while true do
													if ((297 - (36 + 261)) == v440) then
														v441 = v439:FindFirstChild("PlacedPart");
														if (v441 and v441:FindFirstChildOfClass("Model")) then
															local v477 = 0 - 0;
															local v478;
															while true do
																if (v477 == (1368 - (34 + 1334))) then
																	v478 = tonumber(string.match(v439.Name, "%d+"));
																	if v478 then
																		local v480 = 0;
																		local v481;
																		while true do
																			if (v480 == (0 + 0)) then
																				v481 = v187.Buttons:FindFirstChild(v439.Name);
																				if (v481 and v481:IsA("BasePart")) then
																					local v483 = 0;
																					local v484;
																					while true do
																						if (v483 == 0) then
																							v484 = 0 + 0;
																							while true do
																								if (v484 == 0) then
																									v274.CFrame = v481.CFrame * CFrame.new(1283 - (1035 + 248), 24 - (20 + 1), 0);
																									task.wait(0.15 + 0);
																									v484 = 320 - (134 + 185);
																								end
																								if (1 == v484) then
																									pcall(function()
																										v45:FireServer(v478);
																									end);
																									task.wait(1133.1 - (549 + 584));
																									break;
																								end
																							end
																							break;
																						end
																					end
																				end
																				break;
																			end
																		end
																	end
																	break;
																end
															end
														end
														break;
													end
												end
											end
											v368 = 686 - (314 + 371);
										end
										if (v368 == (3 - 2)) then
											v274.CFrame = v369;
											break;
										end
									end
								end
								break;
							end
						end
					end
				end
				break;
			end
			if (v186 == 0) then
				task.wait(0.5);
				v187 = v41();
				v186 = 969 - (478 + 490);
			end
		end
	end
end);
task.spawn(function()
	local v174 = 0 + 0;
	while v7.HubRunning do
		local v188 = 1172 - (786 + 386);
		local v189;
		while true do
			if (v188 == (3 - 2)) then
				if (v7.ASellAll and v50) then
					if ((v189 - v174) >= v7.SellDelay) then
						local v275 = 1379 - (1055 + 324);
						while true do
							if (v275 == (1340 - (1093 + 247))) then
								v174 = v189;
								pcall(function()
									v50:InvokeServer();
								end);
								break;
							end
						end
					end
				elseif (v7.ASellFilter and v51) then
					if ((v189 - v174) >= v7.SellDelay) then
						local v317 = 0 + 0;
						local v318;
						while true do
							if ((0 + 0) == v317) then
								v318 = 0 - 0;
								while true do
									if (v318 == 0) then
										v174 = v189;
										if v38.Backpack then
											for v459, v460 in ipairs(v38.Backpack:GetChildren()) do
												if (v460:IsA("Tool") and v460:GetAttribute("Mutation")) then
													local v470 = 0;
													local v471;
													local v472;
													local v473;
													local v474;
													while true do
														if (v470 == (6 - 4)) then
															if not v474 then
																pcall(function()
																	v51:InvokeServer(v460.Name);
																end);
																task.wait(0.1 - 0);
															end
															break;
														end
														if (v470 == (0 - 0)) then
															local v479 = 0;
															while true do
																if (v479 == 0) then
																	v471 = v460.Name;
																	v472 = v460:GetAttribute("Rarity") or "Unknown";
																	v479 = 1;
																end
																if (v479 == (1 + 0)) then
																	v470 = 3 - 2;
																	break;
																end
															end
														end
														if (v470 == (3 - 2)) then
															v473 = v460:GetAttribute("Mutation") or "None";
															v474 = v40(v7.TSSellBrainrot, v471) and v40(v7.TSSellRarity, v472) and v40(v7.TSSellMutation, v473);
															v470 = 2 + 0;
														end
													end
												end
											end
										end
										break;
									end
								end
								break;
							end
						end
					end
				end
				break;
			end
			if ((0 - 0) == v188) then
				task.wait(688.5 - (364 + 324));
				v189 = tick();
				v188 = 2 - 1;
			end
		end
	end
end);
