-- SouthAsia_XP2
-- Author: blkbutterfly74
-- DateCreated: 3/7/2021 1:32:40 PM
-- Creates a tiny map shaped like real-world South Asia
-- based off Africa, SEA amd Inland Sea map scripts
-- Thanks to Firaxis
-------------------------------------------------------------------------------

include "MapEnums"
include "MapUtilities"
include "MountainsCliffs"
include "RiversLakes"
include "FeatureGenerator"
include "TerrainGenerator"
include "NaturalWonderGenerator"
include "ResourceGenerator"
include "CoastalLowlands"
include "AssignStartingPlots"

-- tiny map data
local g_Minor = {
	centerX = 31,
	centerY = 3,
	width = 56,
	height = 49,
	xOffset = 0,
	yOffset = 0,
	landStrips = {
		{1, 29, 32},
		{2, 29, 33},
		{3, 28, 33},
		{4, 28, 33},
		{5, 28, 33},
		{6, 22, 23},
		{6, 28, 32},
		{7, 21, 24},
		{7, 29, 31},
		{8, 20, 25},
		{8, 29, 31},
		{9, 19, 25},
		{9, 28, 30},
		{10, 19, 26},
		{11, 19, 28},
		{12, 18, 28},
		{13, 18, 28},
		{14, 18, 28},
		{15, 17, 28},
		{16, 16, 29},
		{17, 16, 29},
		{18, 16, 29},
		{19, 16, 29},
		{20, 15, 29},
		{21, 15, 29},
		{22, 14, 29},
		{23, 14, 29},
		{24, 13, 29},
		{24, 31, 31},
		{25, 13, 31},
		{26, 13, 33},
		{27, 13, 34},
		{28, 13, 35},
		{29, 12, 36},
		{30, 12, 37},
		{31, 12, 38},
		{32, 12, 39},
		{33, 12, 40},
		{34, 11, 41},
		{35, 11, 42},
		{36, 11, 44},
		{37, 12, 45},
		{38, 7, 8},
		{38, 12, 45},
		{39, 6, 10},
		{39, 12, 46},
		{40, 5, 10},
		{40, 12, 52},
		{41, 4, 53},
		{42, 6, 54},
		{43, 5, 55},
		{44, 4, 55},
		{45, 3, 55},
		{46, 2, 55},
		{47, 1, 55},
		{48, 0, 55}}
};

-- large map data
local g_Major = {
	centerX = 47,
	centerY = 5,
	width = 87,
	height = 65,
	xOffset = 0,
	yOffset = 0,
	landStrips = {
		{1, 46, 48},
		{2, 45, 49},
		{3, 44, 50},
		{4, 44, 51},
		{5, 25, 25},
		{5, 44, 50},
		{6, 44, 50},
		{6, 84, 84},
		{7, 37, 38},
		{7, 44, 49},
		{7, 84, 84},
		{8, 36, 39},
		{8, 44, 49},
		{9, 35, 39},
		{9, 45, 48},
		{9, 83, 84},
		{10, 35, 41},
		{10, 46, 47},
		{10, 83, 83},
		{11, 34, 41},
		{11, 44, 46},
		{12, 34, 41},
		{12, 45, 45},
		{12, 82, 82},
		{13, 34, 43},
		{14, 33, 44},
		{15, 33, 44},
		{16, 32, 44},
		{16, 81, 81},
		{17, 32, 44},
		{17, 81, 81},
		{18, 31, 44},
		{19, 31, 44},
		{19, 82, 82},
		{20, 30, 45},
		{20, 82, 82},
		{21, 30, 45},
		{21, 82, 83},
		{22, 29, 45},
		{22, 82, 82},
		{23, 29, 45},
		{23, 82, 82},
		{24, 29, 45},
		{24, 83, 83},
		{25, 29, 45},
		{26, 28, 45},
		{27, 28, 45},
		{28, 27, 45},
		{29, 27, 45},
		{30, 27, 47},
		{31, 26, 48},
		{32, 26, 51},
		{32, 86, 86},
		{33, 25, 52},
		{33, 85, 86},
		{34, 25, 52},
		{34, 86, 86},
		{35, 25, 53},
		{35, 86, 86},
		{36, 25, 55},
		{36, 86, 86},
		{37, 25, 56},
		{37, 86, 86},
		{38, 25, 57},
		{38, 86, 86},
		{39, 24, 58},
		{39, 86, 86},
		{40, 24, 59},
		{40, 85, 86},
		{41, 24, 59},
		{41, 84, 86},
		{42, 24, 61},
		{42, 84, 86},
		{43, 24, 63},
		{43, 83, 86},
		{44, 24, 64},
		{44, 82, 86},
		{45, 25, 65},
		{45, 81, 86},
		{46, 18, 19},
		{46, 25, 65},
		{46, 80, 86},
		{47, 18, 21},
		{47, 25, 64},
		{47, 78, 86},
		{48, 17, 22},
		{48, 25, 64},
		{48, 79, 86},
		{49, 16, 22},
		{49, 24, 72},
		{49, 78, 86},
		{50, 15, 22},
		{50, 24, 75},
		{50, 78, 86},
		{51, 15, 76},
		{51, 78, 86},
		{52, 18, 86},
		{53, 15, 86},
		{54, 14, 86},
		{55, 14, 86},
		{56, 12, 86},
		{57, 12, 86},
		{58, 11, 86},
		{59, 10, 86},
		{60, 0, 86},
		{61, 0, 86},
		{62, 0, 86},
		{63, 0, 86},
		{64, 0, 86}}
};

local g_iW, g_iH;
local g_iFlags = {};
local g_continentsFrac = nil;
local g_iNumTotalLandTiles = 0; 
local g_CenterX;
local g_CenterY;
local g_landStrips;
local g_xOffset = 0;
local g_yOffset = 0;
local featuregen = nil;

-------------------------------------------------------------------------------
function GenerateMap()
	print("Generating Southeast Asia Map");
	local pPlot;

	-- Set globals
	g_iW, g_iH = Map.GetGridSize();
	g_iFlags = TerrainBuilder.GetFractalFlags();
	local temperature = MapConfiguration.GetValue("temperature"); -- Default setting is Temperate.

	local shift = 0.07;

	--	local world_age
	local world_age_new = 5;
	local world_age_normal = 3;
	local world_age_old = 2;

	local world_age = MapConfiguration.GetValue("world_age");
	if (world_age == 1) then
		world_age = world_age_new;
	elseif (world_age == 3) then
		world_age = world_age_old;
	else
		world_age = world_age_normal;	-- default
	end
	
	plotTypes = GeneratePlotTypes(world_age);
	terrainTypes = GenerateTerrainTypesSouthAsia(plotTypes, g_iW, g_iH, g_iFlags, true, temperature, shift);
	ApplyBaseTerrain(plotTypes, terrainTypes, g_iW, g_iH);

	AreaBuilder.Recalculate();
	--[[ blackbutterfly74 - Why this additional AnalyzeChockepoint()? Commenting out for now:
	TerrainBuilder.AnalyzeChokepoints(); --]]
	TerrainBuilder.StampContinents();

	local iContinentBoundaryPlots = GetContinentBoundaryPlotCount(g_iW, g_iH);
	local biggest_area = Areas.FindBiggestArea(false);
	print("After Adding Hills: ", biggest_area:GetPlotCount());
	AddTerrainFromContinents(plotTypes, terrainTypes, world_age, g_iW, g_iH, iContinentBoundaryPlots);

	AreaBuilder.Recalculate();
	
	-- Place lakes before rivers to act as sources of water
	AddLakes(0);

	-- River generation is affected by plot types, originating from highlands and preferring to traverse lowlands.
	AddRivers();

	AddFeatures();

	TerrainBuilder.AnalyzeChokepoints();
	
	print("Adding cliffs");
	AddCliffs(plotTypes, terrainTypes);
	
	local args = {
		numberToPlace = GameInfo.Maps[Map.GetMapSize()].NumNaturalWonders,
	};

	local nwGen = NaturalWonderGenerator.Create(args);

	AddFeaturesFromContinents();
	MarkCoastalLowlands();
	
	local resourcesConfig = MapConfiguration.GetValue("resources");
	local startConfig = MapConfiguration.GetValue("start");-- Get the start config
	local args = {
		resources = resourcesConfig,
		LuxuriesPerRegion = 7,
		START_CONFIG = startConfig,
	}
	local resGen = ResourceGenerator.Create(args);

	print("Creating start plot database.");
	-- START_MIN_Y and START_MAX_Y is the percent of the map ignored for major civs' starting positions.
	local args = {
		MIN_MAJOR_CIV_FERTILITY = 100,
		MIN_MINOR_CIV_FERTILITY = 25, 
		MIN_BARBARIAN_FERTILITY = 1,
		START_MIN_Y = 15,
		START_MAX_Y = 15,
		START_CONFIG = startConfig,
	};
	local start_plot_database = AssignStartingPlots.Create(args)

	local GoodyGen = AddGoodies(g_iW, g_iH);
end

-- Input a Hash; Export width, height, and wrapX
function GetMapInitData(MapSize)
	local size = GameInfo.Maps[MapSize].MapSizeType;
	local WrapX = false;

	if (size == "MAPSIZE_DUEL" or size == "MAPSIZE_TINY" or size == "MAPSIZE_SMALL") then
		g_CenterX = g_Minor.centerX;
		g_CenterY = g_Minor.centerY;
		g_landStrips = g_Minor.landStrips;
		g_xOffset = g_Minor.xOffset;
		g_yOffset = g_Minor.yOffset;

		return {Width = g_Minor.width, Height = g_Minor.height, WrapX = WrapX}
	elseif (size == "MAPSIZE_STANDARD" or size == "MAPSIZE_LARGE" or size == "MAPSIZE_HUGE") then
		g_CenterX = g_Major.centerX;
		g_CenterY = g_Major.centerY;
		g_landStrips = g_Major.landStrips;
		g_xOffset = g_Major.xOffset;
		g_yOffset = g_Major.yOffset;

		return {Width = g_Major.width, Height = g_Major.height, WrapX = WrapX}
	end
end
-------------------------------------------------------------------------------
function GeneratePlotTypes(world_age)
	print("Generating Plot Types");
	local plotTypes = {};

	-- Start with it all as water
	for x = 0, g_iW - 1 do
		for y = 0, g_iH - 1 do
			local i = y * g_iW + x;
			local pPlot = Map.GetPlotByIndex(i);
			plotTypes[i] = g_PLOT_TYPE_OCEAN;
			TerrainBuilder.SetTerrainType(pPlot, g_TERRAIN_TYPE_OCEAN);
		end
	end

	-- Each land strip is defined by: Y, X Start, X End
	for i, v in ipairs(g_landStrips) do
		local y = v[1] + g_yOffset;
		local xStart = v[2] + g_xOffset;
		local xEnd = v[3] + g_xOffset; 
		for x = xStart, xEnd do
			local i = y * g_iW + x;
			local pPlot = Map.GetPlotByIndex(i);
			plotTypes[i] = g_PLOT_TYPE_LAND;
			TerrainBuilder.SetTerrainType(pPlot, g_TERRAIN_TYPE_GRASS);  -- temporary setting so can calculate areas
			g_iNumTotalLandTiles = g_iNumTotalLandTiles + 1;
		end
	end
		
	AreaBuilder.Recalculate();
	
	local args = {};
	args.world_age = world_age;
	args.iW = g_iW;
	args.iH = g_iH
	args.iFlags = g_iFlags;
	args.blendRidge = 10;
	args.blendFract = 1;
	args.extra_mountains = 35;		-- epic mountains
	mountainRatio = 16 + world_age;
	plotTypes = ApplyTectonics(args, plotTypes);
	plotTypes = AddLonelyMountains(plotTypes, mountainRatio);

	return plotTypes;
end

function InitFractal(args)

	if(args == nil) then args = {}; end

	local continent_grain = args.continent_grain or 2;
	local rift_grain = args.rift_grain or -1; -- Default no rifts. Set grain to between 1 and 3 to add rifts. - Bob
	local invert_heights = args.invert_heights or false;
	local polar = args.polar or true;
	local ridge_flags = args.ridge_flags or g_iFlags;

	local fracFlags = {};
	
	if(invert_heights) then
		fracFlags.FRAC_INVERT_HEIGHTS = true;
	end
	
	if(polar) then
		fracFlags.FRAC_POLAR = true;
	end
	
	if(rift_grain > 0 and rift_grain < 4) then
		local riftsFrac = Fractal.Create(g_iW, g_iH, rift_grain, {}, 6, 5);
		g_continentsFrac = Fractal.CreateRifts(g_iW, g_iH, continent_grain, fracFlags, riftsFrac, 6, 5);
	else
		g_continentsFrac = Fractal.Create(g_iW, g_iH, continent_grain, fracFlags, 6, 5);	
	end

	-- Use Brian's tectonics method to weave ridgelines in to the continental fractal.
	-- Without fractal variation, the tectonics come out too regular.
	--
	--[[ "The principle of the RidgeBuilder code is a modified Voronoi diagram. I 
	added some minor randomness and the slope might be a little tricky. It was 
	intended as a 'whole world' modifier to the fractal class. You can modify 
	the number of plates, but that is about it." ]]-- Brian Wade - May 23, 2009
	--
	local MapSizeTypes = {};
	for row in GameInfo.Maps() do
		MapSizeTypes[row.MapSizeType] = row.PlateValue;
	end
	local sizekey = Map.GetMapSize();

	local numPlates = MapSizeTypes[sizekey] or 4

	-- Blend a bit of ridge into the fractal.
	-- This will do things like roughen the coastlines and build inland seas. - Brian

	g_continentsFrac:BuildRidges(numPlates, {}, 1, 2);
end

function AddFeatures()
	print("Adding Features");

	-- Get Rainfall setting input by user.
	local rainfall = MapConfiguration.GetValue("rainfall");
	if rainfall == 4 then
		rainfall = 1 + TerrainBuilder.GetRandomNumber(3, "Random Rainfall - Lua");
	end

	local args = {rainfall = rainfall, iJunglePercent = 25, iMarshPercent = 15, iForestPercent = 10, iReefPercent = 11}	-- jungle & marsh max coverage
	featuregen = FeatureGenerator.Create(args);

	featuregen:AddFeatures(true, false);  --second parameter is whether or not rivers start inland);

	-- add jungle more densely at center
	for iX = 0, g_iW - 1 do
		for iY = 0, g_iH - 1 do
			local index = (iY * g_iW) + iX;
			local plot = Map.GetPlot(iX, iY);
			local iDistanceFromCenter = Map.GetPlotDistance(iX, iY, g_CenterX, g_CenterY);

			-- inverse of Australia floodplain logic
			if (TerrainBuilder.GetRandomNumber(g_iW, "Resource Placement Score Adjust") >= iDistanceFromCenter) then
				featuregen:AddJunglesAtPlot(plot, iX, iY);
			elseif (TerrainBuilder.GetRandomNumber(g_iW, "Resource Placement Score Adjust") >= iDistanceFromCenter) then
				featuregen:AddForestsAtPlot(plot, iX, iY);
			end
		end
	end
end
------------------------------------------------------------------------------
function GenerateTerrainTypesSouthAsia(plotTypes, iW, iH, iFlags, bNoCoastalMountains)
	print("Generating Terrain Types");
	local terrainTypes = {};

	local fracXExp = -1;
	local fracYExp = -1;
	local grain_amount = 3;

	-- terrain gen based on altitude
	india = Fractal.Create(iW, iH,							
									grain_amount, iFlags, 
									fracXExp, fracYExp);
									
	iSnowTop = india:GetHeight(100);
	iSnowBottom = india:GetHeight(98);
									
	iTundraTop = india:GetHeight(98);
	iTundraBottom = india:GetHeight(95);
									
	iGrassTop = india:GetHeight(95);
	iGrassBottom = india:GetHeight(60);
																		
	iPlainsTop = india:GetHeight(60);
	iPlainsBottom = india:GetHeight(25);
									
	iDesertTop = india:GetHeight(25);
	iDesertBottom = india:GetHeight(0);

	for iX = 0, iW - 1 do
		for iY = 0, iH - 1 do
			local index = (iY * iW) + iX;
			if (plotTypes[index] == g_PLOT_TYPE_OCEAN) then
				if (IsAdjacentToLand(plotTypes, iX, iY)) then
					terrainTypes[index] = g_TERRAIN_TYPE_COAST;
				else
					terrainTypes[index] = g_TERRAIN_TYPE_OCEAN;
				end
			end
		end
	end

	if (bNoCoastalMountains == true) then
		plotTypes = RemoveCoastalMountains(plotTypes, terrainTypes);
	end

	for iX = 0, iW - 1 do
		for iY = 0, iH - 1 do
			local index = (iY * iW) + iX;

			local lat = -(iH/2 - iY)/(iH/2);		-- inversion

			local val = india:GetHeight(iX, iY);

			-- Indian subcontinent
			if (lat > -0.62) then
				if (plotTypes[index] == g_PLOT_TYPE_MOUNTAIN) then
					if ((val >= iDesertBottom) and (val <= iDesertTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_DESERT_MOUNTAIN;
					elseif ((val >= iPlainsBottom) and (val <= iPlainsTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_PLAINS_MOUNTAIN;
					elseif ((val >= iGrassBottom) and (val <= iGrassTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_GRASS_MOUNTAIN;
					elseif ((val >= iTundraBottom) and (val <= iTundraTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_TUNDRA_MOUNTAIN;
					elseif ((val >= iSnowBottom) and (val <= iSnowTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_SNOW_MOUNTAIN;
					end
				elseif (plotTypes[index] ~= g_PLOT_TYPE_OCEAN) then
					if ((val >= iDesertBottom) and (val <= iDesertTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_DESERT;
					elseif ((val >= iPlainsBottom) and (val <= iPlainsTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_PLAINS;
					elseif ((val >= iGrassBottom) and (val <= iGrassTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_GRASS;
					elseif ((val >= iTundraBottom) and (val <= iTundraTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_TUNDRA;
					elseif ((val >= iSnowBottom) and (val <= iSnowTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_SNOW;
					end
				end

			-- Sri Lanka
			else 
				if (plotTypes[index] == g_PLOT_TYPE_MOUNTAIN) then
					terrainTypes[index] = g_TERRAIN_TYPE_GRASS_MOUNTAIN;

					if ((val >= iPlainsBottom) and (val <= iPlainsTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_PLAINS_MOUNTAIN;
					end

				elseif (plotTypes[index] ~= g_PLOT_TYPE_OCEAN) then
					terrainTypes[index] = g_TERRAIN_TYPE_GRASS;
						
					if ((val >= iPlainsBottom) and (val <= iPlainsTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_PLAINS;
					end
				end
			end
		end
	end

	local bExpandCoasts = true;

	if bExpandCoasts == false then
		return
	end

	print("Expanding coasts");
	for iI = 0, 2 do
		local shallowWaterPlots = {};
		for iX = 0, iW - 1 do
			for iY = 0, iH - 1 do
				local index = (iY * iW) + iX;
				if (terrainTypes[index] == g_TERRAIN_TYPE_OCEAN) then
					-- Chance for each eligible plot to become an expansion is 1 / iExpansionDiceroll.
					-- Default is two passes at 1/4 chance per eligible plot on each pass.
					if (IsAdjacentToShallowWater(terrainTypes, iX, iY) and TerrainBuilder.GetRandomNumber(4, "add shallows") == 0) then
						table.insert(shallowWaterPlots, index);
					end
				end
			end
		end
		for i, index in ipairs(shallowWaterPlots) do
			terrainTypes[index] = g_TERRAIN_TYPE_COAST;
		end
	end
	
	return terrainTypes; 
end

------------------------------------------------------------------------------
function FeatureGenerator:AddIceToMap()
	return false, 0;
end

------------------------------------------------------------------------------
function FeatureGenerator:AddReefAtPlot(plot, iX, iY)
	--Reef Check. First see if it can place the feature.
	if(TerrainBuilder.CanHaveFeature(plot, g_FEATURE_REEF)) then
		self.iNumReefablePlots = self.iNumReefablePlots + 1;
		if(math.ceil(self.iReefCount * 100 / self.iNumReefablePlots) <= self.iReefMaxPercent) then
				--Weight based on adjacent plots
				local iEquator = 0;
				local iScore  = 1.5 * math.abs(iY - iEquator);
				local iAdjacent = TerrainBuilder.GetAdjacentFeatureCount(plot, g_FEATURE_REEF);

				if(iAdjacent == 0 ) then
					iScore = iScore + 100;
				elseif(iAdjacent == 1) then
					iScore = iScore + 125;
				elseif (iAdjacent == 2) then
					iScore = iScore  + 150;
				elseif (iAdjacent == 3 or iAdjacent == 4) then
					iScore = iScore + 175;
				else
					iScore = iScore + 10000;
				end

				if(TerrainBuilder.GetRandomNumber(200, "Resource Placement Score Adjust") >= iScore) then
					TerrainBuilder.SetFeatureType(plot, g_FEATURE_REEF);
					self.iReefCount = self.iReefCount + 1;
				end
		end
	end
end

------------------------------------------------------------------------------
function AddFeaturesFromContinents()
	print("Adding Features from Continents");

	featuregen:AddFeaturesFromContinents();
end

-- override: northern forest bias
function FeatureGenerator:AddForestsAtPlot(plot, iX, iY)
	--Forest Check. First see if it can place the feature.
	
	if(TerrainBuilder.CanHaveFeature(plot, g_FEATURE_FOREST)) then
		if(math.ceil(self.iForestCount * 100 / self.iNumLandPlots) <= self.iForestMaxPercent) then
			--Weight based on adjacent plots if it has more than 3 start subtracting
			local iScore = 300 * (iY + 1);    -- co-ordinate system starts at zero
			local iAdjacent = TerrainBuilder.GetAdjacentFeatureCount(plot, g_FEATURE_FOREST);

			if(iAdjacent == 0 ) then
				iScore = iScore;
			elseif(iAdjacent == 1) then
				iScore = iScore + 50;
			elseif (iAdjacent == 2 or iAdjacent == 3) then
				iScore = iScore + 150;
			elseif (iAdjacent == 4) then
				iScore = iScore - 50;
			else
				iScore = iScore - 200;
			end
				
			if(TerrainBuilder.GetRandomNumber(300, "Resource Placement Score Adjust") <= iScore) then
				TerrainBuilder.SetFeatureType(plot, g_FEATURE_FOREST);
				self.iForestCount = self.iForestCount + 1;
			end
		end
	end
end

-- override: more southern jungle
function FeatureGenerator:AddJunglesAtPlot(plot, iX, iY)
	--Jungle Check. First see if it can place the feature.
	if(TerrainBuilder.CanHaveFeature(plot, g_FEATURE_JUNGLE)) then
		if(math.ceil(self.iJungleCount * 100 / self.iNumLandPlots) <= self.iJungleMaxPercent) then

			--Weight based on adjacent plots if it has more than 3 start subtracting
			local iScore = 350 * (1 - iY/g_iH);
			local iAdjacent = TerrainBuilder.GetAdjacentFeatureCount(plot, g_FEATURE_JUNGLE);

			if(iAdjacent == 0 ) then
				iScore = iScore;
			elseif(iAdjacent == 1) then
				iScore = iScore + 50;
			elseif (iAdjacent == 2 or iAdjacent == 3) then
				iScore = iScore + 150;
			elseif (iAdjacent == 4) then
				iScore = iScore - 50;
			else
				iScore = iScore - 200;
			end

			if(TerrainBuilder.GetRandomNumber(100, "Resource Placement Score Adjust") <= iScore) then
				TerrainBuilder.SetFeatureType(plot, g_FEATURE_JUNGLE);
				local terrainType = plot:GetTerrainType();

				if(terrainType == g_TERRAIN_TYPE_PLAINS_HILLS or terrainType == g_TERRAIN_TYPE_GRASS_HILLS) then
					TerrainBuilder.SetTerrainType(plot, g_TERRAIN_TYPE_PLAINS_HILLS);
				else
					TerrainBuilder.SetTerrainType(plot, g_TERRAIN_TYPE_PLAINS);
				end

				self.iJungleCount = self.iJungleCount + 1;
				return true;
			end

		end
	end

	return false
end