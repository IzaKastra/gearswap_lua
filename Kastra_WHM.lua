  include('organizer-lib')

function get_sets()

    TPFlag = "Default"

  maps() -- This line is also REQUIRED if you're going to use custom spell lists. See below for more information.
  
  send_command('bind f9 gs c cycle TP mode')

  send_command('bind f11 gs c equip Criers')
  send_command('bind f12 gs c Equip DT')
  send_command('bind ^f12 gs c Equip Refresh')
  function file_unload()
    send_command('unbind f9')
    send_command('unbind f11')
    send_command('unbind f12')
    send_command('unbind ^f12')
  end
  function self_command(command)

    function check_param()
        print('-------------------------')
        if TPFlag == "Accuracy" then
          print('TP Mode:..........Default')
        elseif TPFlag == "Default" then
          print('TP Mode:.........Accuracy')
        end
        print('-------------------------')
    end

    if command == 'cycle TP mode' then
        if TPFlag == "Default" then
          TPFlag = "Accuracy"
          send_command('@input /echo TP mode: Accuracy')
        elseif TPFlag == "Accuracy" then
          TPFlag = "Default"
          send_command('@input /echo TP mode: Default')
        end
        check_param()
      end
  

    if command == 'Equip DT' then
      equip(sets.status.Idle.DT)
      send_command('@input /echo Damage Taken set equipped.')
    end
    if command == 'Equip Refresh' then
      equip(sets.status.Idle.Refresh)
      send_command('@input /echo Refresh idle set equipped.')
    end
    if command == 'equip Criers' then
      equip(gear.Criers)
      send_command('@input /echo Crier\'s Gaiters Equipped.')
    end
  end


  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ----------- AUGMENTED/SPECIAL GEAR ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  gear = {}

  gear.Obi                           = { waist="Hachirin-no-Obi"}
  gear.Criers                        = { feet="Crier's Gaiters"}
  gear.Chatoyant                     = { main="Chatoyant Staff",  sub="Achaq Grip"}
  gear.Moonshade                     = { name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}}

  gear.AF = {}
  gear.AF.head                       = {}
  gear.AF.body                       = {}
  gear.AF.hands                      = { name="Theophany Mitts +3"}
  gear.AF.legs                       = { name="Th. Pant. +3"}
  gear.AF.feet                       = { name="Theo. Duckbills +3"}

  gear.AmbuCape = {}
  gear.AmbuCape.Idle                 = { name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10','Damage taken-5%',}}
  gear.AmbuCape.FC                   = { name="Alaunus's Cape", augments={'"Fast Cast"+10',}}

  gear.Empy = {}
  gear.Empy.head                     = { name="Ebers Cap +2"}
  gear.Empy.body                     = { name="Ebers Bliaut +2"}
  gear.Empy.hands                    = { name="Ebers Mitts +2"}
  gear.Empy.legs                     = { name="Ebers Pant. +2"}
  gear.Empy.feet                     = { name="Ebers Duckbills +2"}

  gear.Relic = {}
  gear.Relic.head                    = { name="Piety Cap +3", augments={'Enhances "Devotion" effect',}}
  gear.Relic.body                    = { name="Piety Bliaut +3", augments={'Enhances "Benediction" effect',}}
  gear.Relic.hands                   = { name="Piety Mitts +3", augments={'Enhances "Martyr" effect',}}
  gear.Relic.legs                    = { name="Piety Pantaln. +3", augments={'Enhances "Afflatus Misery" effect',}}
  gear.Relic.feet                    = { name="Piety Duckbills +3", augments={'Enhances "Afflatus Solace" effect',}}

  gear.Telchine = {}
  gear.Telchine.head                 = { name="Telchine Cap", augments={'Enh. Mag. eff. dur. +9',}}
  gear.Telchine.body                 = { name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}}
  gear.Telchine.hands                = { name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +8',}}
  gear.Telchine.legs                 = { name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +8',}}
  gear.Telchine.feet                 = { name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}}

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ----- STATUS SETS --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  sets.status = {}
  sets.status.Idle = {}
  sets.status.Idle.Refresh = {
    main="Daybreak",
    sub="Genmei Shield",
    ammo="Homiliary",
    head="Inyanga Tiara +2",
    body = gear.Empy.body,
    hands="Inyanga Dastanas +2",
    legs="Volte Brais",
    feet="Inyan. Crackows +2",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Etiolation Earring",
    right_ear="Ebers Earring +1",
    left_ring="Defending Ring",
    right_ring="Shadow Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10','Damage taken-5%',}},
  }
  sets.status.Idle.DT = {
    main="Daybreak",
    sub="Genmei Shield",
    ammo="Homiliary",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Etiolation Earring",
    right_ear="Ebers Earring +1",
    left_ring="Defending Ring",
    right_ring="Shadow Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10','Damage taken-5%',}},
  }

  sets.status.Engaged = {}
  sets.status.Engaged["Accuracy"] = {
    ammo="Amar Cluster",
    head={ name="Bunzi's Hat", augments={'Path: A',}},
    body="Ayanmo Corazza +2",
    hands="Bunzi's Gloves",
    legs="Aya. Cosciales +2",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Combatant's Torque",
    waist="Windbuffet Belt +1",
    left_ear="Mache Earring +1",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
  }
  sets.status.Engaged["Default"] = {
    ammo="Amar Cluster",
    head={ name="Bunzi's Hat", augments={'Path: A',}},
    body="Ayanmo Corazza +2",
    hands="Bunzi's Gloves",
    legs="Aya. Cosciales +2",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Combatant's Torque",
    waist="Windbuffet Belt +1",
    left_ear="Dedition Earring",
    right_ear="Brutal Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
  }


  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ----- PRECAST SETS -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  sets.precast = {}
  sets.precast.Default = {
    -- +66% fast cast, +10% Quick Cast
    ammo="Impatiens",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Inyanga Jubbah +2",
    hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +10','"Conserve MP"+7','"Fast Cast"+7',}},
    legs="Aya. Cosciales +2",
    neck="Orunmila's Torque",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Weather. Ring +1",
    right_ring="Lebeche Ring",
    back = gear.AmbuCape.FC,
  }
  sets.precast.Healing = {
    -- -36% Cure cast time, -13% Healing Magic cast time
    main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
    sub="Sors Shield",
    head = gear.Relic.head,
    legs = gear.Empy.legs,
    feet="Hygieia Clogs",
    left_ear="Nourish. Earring +1",
  }
  sets.precast.Enhancing = {
    -- -10% Stoneskin cast time, -8% Enhancing Magic cast time
    legs="Doyen Pants",
    waist="Siegel Sash",
  }
  sets.precast.Benediction = {
    body = gear.Relic.body,
  }
  sets.precast.Devotion = {
    head = gear.Relic.head,
  }
  sets.precast.Dispelga = {
    main="Daybreak",
    ammo="Impatiens",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Inyanga Jubbah +2",
    hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +10','"Conserve MP"+7','"Fast Cast"+7',}},
    legs="Aya. Cosciales +2",
    neck="Orunmila's Torque",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Weather. Ring +1",
    right_ring="Lebeche Ring",
    back = gear.AmbuCape.FC,
  }
  sets.precast.Impact ={
    body="Twilight Cloak"
  }
  sets.precast["Randgrith"] = {
    ammo="Amar Cluster",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist="Prosilio Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Telos Earring",
    left_ring="Rufescent Ring",
    right_ring="Shukuyu Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
  }
  sets.precast["Realmrazer"] = {
    ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Bunzi's Gloves",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Mache Earring +1",
    right_ear="Telos Earring",
    left_ring="Rufescent Ring",
    right_ring="Ilabrat Ring",
    back={ name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
  }
  sets.precast["Black Halo"] = {
    ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist="Prosilio Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Telos Earring",
    left_ring="Rufescent Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
  }
  sets.precast["Mystic Boon"] = {
    ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Regal Earring",
    left_ring="Rufescent Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
  }
  sets.precast["Seraph Strike"] = {
    ammo="Oshasha's Treatise",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Baetyl Pendant",
    waist="Windbuffet Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Friomisi Earring",
    left_ring="Weatherspoon Ring +1",
    right_ring="Freke Earring",
    back={ name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
  }

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ----- MIDCAST SETS -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  sets.midcast = {}
  sets.midcast.Cures = {
    -- +50% Cure Potency, +6% Cure Potency II, +225 MND, +141 VIT, -45 Enmity, -45% PDT
    main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
    sub="Genmei Shield",
    ammo="Staunch Tathlum +1",
    head = gear.Empy.head,
    body = gear.Empy.body,
    hands = gear.AF.hands,
    legs = gear.Empy.legs,
    feet = gear.Relic.feet,
    neck="Cleric's Torque",
    waist="Emphatikos Rope",
    left_ear="Glorious Earring",
    -- left_ear="Nourish. Earring +1",
    right_ear="Ebers Earring +1",
    left_ring="Defending Ring",
    right_ring="Lebeche Ring",
    back = gear.AmbuCape.Idle,
  }
  sets.midcast.Enfeeble = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Hydrocera",
    head = gear.Empy.head,
    body = gear.Empy.body,
    hands = gear.Relic.hands,
    legs={ name="Chironic Hose", augments={'Mag. Acc.+26','MND+10',}},
    feet = gear.AF.feet,
    neck="Incanter's Torque",
    waist="Sacro Cord",
    left_ear="Malignance Earring",
    right_ear="Crep. Earring",
    left_ring="Weather. Ring +1",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back = gear.AmbuCape.Idle,
  }
  sets.midcast.Enhancing = {
    main="Beneficus",
    head="Befouled Crown",
    body = gear.Telchine.body,
    hands="Inyan. Dastanas +2",
    legs = gear.Relic.legs,
    feet = gear.AF.feet,
    neck="Incanter's Torque",
    back={ name="Mending Cape", augments={'Healing magic skill +2','Enha.mag. skill +10','Mag. Acc.+1',}},
  }
  sets.midcast.EnhancingDuration = {
    sub="Ammurapi Shield",         -- +10%
    head = gear.Telchine.head,     -- +9%
    body = gear.Telchine.body,     -- +10%
    hands = gear.Telchine.hands,   -- +8%
    legs = gear.Telchine.legs,     -- +8%
    feet = gear.AF.feet,           -- +10%
    waist="Embla Sash",            -- +10%
  }
  sets.midcast.Barspell = {
    main="Beneficus",
    head = gear.Empy.head,
    body = gear.Empy.body,
    hands="Inyan. Dastanas +2",
    legs = gear.Relic.legs,
    feet = gear.AF.feet,
    neck="Incanter's Torque",
    left_ear="Andoaa Earring",
    back={ name="Mending Cape", augments={'Healing magic skill +2','Enha.mag. skill +10','Mag. Acc.+1',}},
  }
  sets.midcast.Cursna = {
  -- +78 Healing Magic, +75 Cursna
    main="Yagrush",
    body = gear.Empy.body,
    hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +10','"Conserve MP"+7','"Fast Cast"+7',}},
    legs = gear.AF.legs,
    feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    neck="Incanter's Torque",
    left_ring="Haoma's Ring",
    right_ring="Haoma's Ring",
    back = gear.AmbuCape.Idle,
  }
  sets.midcast.EraseNa = {
    main="Yagrush",
    head = gear.Empy.head,
    hands = gear.Empy.hands,
    neck="Cleric's Torque",
    back={ name="Mending Cape", augments={'Healing magic skill +2','Enha.mag. skill +10','Mag. Acc.+1',}},
  }
  sets.midcast.Regens = {
    main="Bolelabunga",
    head="Inyanga Tiara +2",
    body = gear.Relic.body,
    legs = gear.AF.legs,
    hands = gear.Empy.hands,
  }
  sets.midcast.Treasure = {
    head="Volte Cap",
    hands="Volte Bracers",
    feet="Volte Boots",
    waist="Chaac Belt",
  }
  sets.midcast.Stoneskin = {
    neck="Nodens Gorget",
    legs="Shedir Seraweels",
    waist="Siegel Sash",
  }
  sets.midcast.Aquaveil = {
    main="Vadose Rod",
    head="Chironic Hat",
    hands="Regal Cuffs",
    legs="Shedir Seraweels",
    waist="Emphatikos Rope",
  }
  sets.midcast.DivineSkill = {
  }
  sets.midcast.Nuke = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Inyanga Tiara +2",
    body="Gyve Doublet",
    hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +10','"Conserve MP"+7','"Fast Cast"+7',}},
    legs="Gyve Trousers",
    feet="Aya. Gambieras +2",
    neck="Baetyl Pendant",
    waist="Sacro Cord",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Weather. Ring +1",
    right_ring="Freke Ring",
    back = gear.AmbuCape.Idle,
  }
  sets.midcast.UndeadBanish = {
    main="Mes'yohi Rod",
    head="Ipoca Beret",
    hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +10','"Conserve MP"+7','"Fast Cast"+7',}},
  }
  sets.midcast.ConserveMP = {
    -- +19 Conserve MP, +1% MP not consumed on cast
    ammo="Pemphredo Tathlum",
    head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    legs={ name="Lengo Pants", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',}},
    feet="Hygieia Clogs",
    neck="Incanter's Torque",
  }
  sets.midcast.Dispelga = {
    main="Daybreak"
  }
  sets.midcast.Impact = {
    body="Twilight Cloak"
  }

end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- SPELL/ABILITY LISTS ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function maps() -- For some reason this is required if you want to use List:contains(spell.name). You have to have this "function maps()" and "end" lines surrounding your lists.
-- You also need the maps() line in your get_sets() function if you want these to work.
-- Otherwise you will get an error for all lines that use the "contains(spell.name)" function that says something along the lines of "attempt to index global 'TreasureHunter' (a Nil value)"

  Cures          = S {"Cure", "Cure II", "Cure III", "Cure IV", "Cure V", "Cure VI", "Curaga", "Curaga II", "Curaga III", "Curaga IV", "Curaga V", "Cura", "Cura II", "Cura III"}
  EraseNas       = S {"Paralyna", "Stona", "Poisona", "Blindna", "Viruna", "Silena", "Erase", "Cursna", "Erase"}
  Regens         = S {"Regen", "Regen II", "Regen III", "Regen IV"}
  HighCost       = S {"Raise", "Raise II", "Raise III", "Arise", "Reraise", "Reraise II", "Reraise III", "Reraise IV"}
  Banishes       = S {"Banish", "Banish II", "Banish III", "Banishga", "Banishga II", "Holy"}
  TreasureHunter = S {"Dia", "Dia II", "Diaga", "Flash", "Banish"}
  Barspells      = S {"Barfira", "Barwatera", "Barthundra", "Barstonra", "Baraera", "Barblizzara", "Barparalyna", "Barpetra", "Barpoisonra", "Barblindra", "Barvira", "Barsilencra", "Barsleepra", "Baramnesra"}
  DurationSpells = S {"Haste", "Protectra V", "Shellra V", "Protect V", "Shell V", "Aurorastorm","Voidstorm","Firestorm","Rainstorm","Thunderstorm","Sandstorm","Windstorm","Hailstorm"}

end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- PRECAST FUNCTION ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function precast(spell)
  if sets.precast[spell.name] then
        equip(sets.precast[spell.name])
  elseif spell.skill == "Healing Magic" then
    equip(set_combine(sets.precast.Default,sets.precast.Healing))
  elseif spell.skill == "Enhancing Magic" then
    equip(set_combine(sets.precast.Default,sets.precast.Enhancing))
  else
    equip(sets.precast.Default)
  end
  if spell.name == "Seraph Strike" then
    equip(sets.status.Seraph)
  end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- MIDCAST FUNCTION ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function midcast(spell)
  if sets.midcast[spell.name] then
    equip(sets.midcast[spell.name])

  elseif spell.skill == "Healing Magic" then
    if Cures:contains(spell.name) then
      equip(sets.midcast.Cures)
      if world.weather_element == spell.element or world.day_element == spell.element then
        equip(gear.Obi)
      end
      if buffactive['Aurorastorm'] then
        equip(gear.Chatoyant)
      end
    elseif spell.name == "Cursna" then
      equip(sets.midcast.Cursna)
    elseif EraseNas:contains(spell.name) then
      equip(sets.midcast.EraseNa)
    elseif HighCost:contains(spell.name) then
      equip(sets.midcast.ConserveMP)
    end

  elseif spell.skill == "Enhancing Magic" then
    if EraseNas:contains(spell.name) then
      equip(sets.midcast.EraseNa)
    elseif spell.name == "Auspice" then
      equip(set_combine(sets.midcast.EnhancingDuration, {feet = gear.Empy.feet}))
    elseif Regens:contains(spell.name) then
      equip(set_combine(sets.midcast.EnhancingDuration, sets.midcast.Regens))
    elseif Barspells:contains(spell.name) then
      equip(set_combine(sets.midcast.EnhancingDuration, sets.midcast.Barspell))
    elseif DurationSpells:contains(spell.name) then
      equip(sets.midcast.EnhancingDuration)
    elseif HighCost:contains(spell.name) then
      equip(set_combine(sets.midcast.ConserveMP, sets.midcast.EnhancingDuration))
    else
      equip(set_combine(sets.midcast.EnhancingDuration,sets.midcast.Enhancing))
    end

  elseif spell.skill == 'Enfeebling Magic' then
    equip(sets.midcast.Enfeeble)

  elseif Banishes:contains(spell.name) then
    equip(set_combine(sets.midcast.Nuke,sets.midcast.UndeadBanish))
    if world.weather_element == spell.element or world.day_element == spell.element then
      equip(gear.Obi)
    end
  elseif spell.skill == "Elemental Magic" then
    equip(sets.midcast.Nuke)
  end

  if TreasureHunter:contains(spell.name) then
    equip(sets.midcast.Treasure)
  end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- AFTERCAST FUNCTION -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function aftercast(spell)
  if player.status == 'Idle'  then
    equip(sets.status.Idle.DT)
  elseif player.status == "Engaged" then
    equip(sets.status.Engaged[TPFlag])
  end
  -- if buffactive["Sublimation: Activated"] then
  --   equip({waist="Embla Sash"})
  -- end
end

function status_change(new,old)
  if new == "Idle" then
    if player.mpp < 80 then
      equip(sets.status.Idle.Refresh)
    else
      equip(sets.status.Idle.DT)
    end
  elseif new == "Engaged" then
    equip(sets.status.Engaged[TPFlag])
  elseif sets.status[new] then
    equip(sets.status[new])
  end
  -- if buffactive["Sublimation: Activated"] then
  --   equip({waist="Embla Sash"})
  -- end
end
