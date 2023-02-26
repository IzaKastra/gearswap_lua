include('organizer-lib')

function get_sets()


  maps()

  MagicBurstFlag     = 0
  MagicAccuracyFlag  = 0
  TreasureHunterFlag = 0

  send_command('bind f9 gs c toggle MagicAccuracy')
  send_command('bind f10 gs c toggle MagicBurst')
  send_command('bind f11 gs c equip movement feet')
  send_command('bind f12 gs c Equip Pet DT')
  send_command('bind ^f12 gs c Equip DT')
  send_command('bind ^f12 gs c Equip Refresh')
  function file_unload()
    send_command('unbind f9')
    send_command('unbind f10')
    send_command('unbind f11')
    send_command('unbind ^f11')
    send_command('unbind f12')
    send_command('unbind ^f12')
  end



  function check_param()
    print('-------------------------')
    if MagicBurstFlag == 0 then
      print('Magic Burst:........OFF')
    elseif MagicBurstFlag == 1 then
      print('Magic Burst:........ON')
    end
    if MagicAccuracyFlag == 0 then
      print('Magic Accuracy:.....OFF')
    elseif MagicAccuracyFlag == 1 then
      print('Magic Accuracy:.....ON')
    end
    if TreasureHunterFlag == 0 then
      print('Treasure Hunter:....OFF')
    elseif TreasureHunterFlag == 1 then
      print('Treasure Hunter:....ON')
    end
    print('-------------------------')
  end

  function self_command(command)
    if command == 'toggle MagicBurst' then
      if MagicBurstFlag == 0 then
        MagicBurstFlag = 1
        send_command('@input /echo Magic Burst: ON')
      elseif MagicBurstFlag == 1 then
        MagicBurstFlag = 0
        send_command('@input /echo Magic Burst: OFF')
      end
      check_param()
    end
    if command == 'toggle MagicAccuracy' then
      if MagicAccuracyFlag == 0 then
        MagicAccuracyFlag = 1
        send_command('@input /echo Magic Accuracy: ON')
      elseif MagicAccuracyFlag == 1 then
        MagicAccuracyFlag = 0
        send_command('@input /echo Magic Accuracy: OFF')
      end
      check_param()
    end
    if command == 'Equip DT' then
      equip(sets.status.Idle.DT)
      send_command('@input /echo Damage Taken set equipped.')
    end
    if command == 'Equip Pet DT' then
      equip(sets.status.Idle.Pet)
      send_command('@input /echo Pet DT set equipped.')
    end
    if command == 'Equip Refresh' then
      equip(sets.status.Idle.Refresh)
      send_command('@input /echo Refresh set equipped.')
    end
    if command == 'equip movement feet' then
      equip({feet = gear.AF.feet,})
      send_command('@input /echo Geomancy Sandals +3 Equipped.')
    end
    if command == 'toggle Treasure Hunter' then
      if TreasureHunterFlag == 0 then
        TreasureHunterFlag = 1
        send_command('@input /echo Treasure Hunter: ON')
      elseif TreasureHunterFlag == 1 then
        TreasureHunterFlag = 0
        send_command('@input /echo Treasure Hunter: OFF')
      end
      check_param()
    end
  end



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- OSEEM-AUGMENTED/SPECIAL GEAR ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  gear = {}

  gear.Obi                            = { waist="Hachirin-no-Obi"}
  gear.Orpheus                        = { waist="Orpheus's Sash"}
  gear.Chatoyant                     = { main="Chatoyant Staff", sub="Achaq Grip"}
  gear.CP                            = { name="Mecisto. Mantle", augments={'Cap. Point+50%','VIT+1','Mag. Acc.+1','DEF+2',}}

  gear.AF = {}
  gear.AF.head                        = {}
  gear.AF.body                        = { name="Geo. Tunic +1"}
  gear.AF.hands                       = { name="Geo. Mitaines +3"}
  gear.AF.legs                        = { name="Geo. Pants +1"}
  gear.AF.feet                        = { name="Geo. Sandals +3"}

  gear.Amalric = {}
  gear.Amalric.body             = { name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}

  gear.Amalric.hands            = { name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}

  gear.Amalric.legs             = { name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}

  gear.Amalric.feet             = { name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}

  gear.AmbuCape = {}
  gear.AmbuCape.Nuke                 = { name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Pet: Damage taken -5%',}}
  gear.AmbuCape.PetDT                = { name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Pet: "Regen"+10','Pet: Damage taken -5%',}}

  gear.Empy = {}
  gear.Empy.head                      = { name="Azimuth Hood +2"}
  gear.Empy.body                      = { name="Azimuth Coat +1"}
  gear.Empy.hands                     = { name="Azimuth Gloves"}
  gear.Empy.legs                      = { name="Azimuth Tights +1"}
  gear.Empy.feet                      = { name="Azimuth Gaiters +1"}

  gear.Merlinic = {}
  gear.Merlinic.head = {}
  gear.Merlinic.head.FC              = { name="Merlinic Hood", augments={'Mag. Acc.+9','"Fast Cast"+6',}}

  gear.Merlinic.body = {}

  gear.Merlinic.hands = {}
  gear.Merlinic.hands.FC             = { name="Merlinic Dastanas", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','"Fast Cast"+5','DEX+3','Mag. Acc.+4','"Mag.Atk.Bns."+9',}}
  gear.Merlinic.hands.DrainAspir     = { name="Merlinic Dastanas", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','"Drain" and "Aspir" potency +4','MND+2','Mag. Acc.+6','"Mag.Atk.Bns."+5',}}

  gear.Merlinic.legs                 = {}
  gear.Merlinic.legs.TH              = { name="Merlinic Shalwar", augments={'Accuracy+4','Enmity-6','"Treasure Hunter"+2','Accuracy+16 Attack+16','Mag. Acc.+7 "Mag.Atk.Bns."+7',}}

  gear.Merlinic.feet = {}
  gear.Merlinic.feet.DrainAspir      = { name="Merlinic Crackows", augments={'Mag. Acc.+27','"Drain" and "Aspir" potency +10',}}
  gear.Merlinic.feet.FC              = { name="Merlinic Crackows", augments={'"Fast Cast"+6','"Mag.Atk.Bns."+1',}}


  gear.Relic = {}
  gear.Relic.head                    = { name="Bagua Galero +3", augments={'Enhances "Primeval Zeal" effect',}}
  gear.Relic.body                    = { name="Bagua Tunic +3", augments={'Enhances "Bolster" effect',}}
  gear.Relic.hands                   = { name="Bagua Mitaines", augments={'Enhances "Curative Recantation" effect',}}
  gear.Relic.legs                    = { name="Bagua Pants +3", augments={'Enhances "Mending Halation" effect',}}
  gear.Relic.feet                    = { name="Bagua Sandals +3", augments={'Enhances "Radial Arcana" effect',}}

  gear.ReiveCape                     = { name="Lifestream Cape", augments={'Geomancy Skill +10','Indi. eff. dur. +18','Pet: Damage taken -2%','Damage taken-3%',}}

  gear.Telchine = {}
  gear.Telchine.head                 = { name="Telchine Cap", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}}
  gear.Telchine.body                 = { name="Telchine Chas.", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}}
  gear.Telchine.hands                = { name="Telchine Gloves", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +9',}}
  gear.Telchine.legs                 = { name="Telchine Braconi", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}}
  gear.Telchine.feet                 = { name="Telchine Pigaches", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}}


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- STATUS SETS --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


  sets.status = {}
  sets.status.Idle = {}
  sets.status.Idle.Pet = {
    main="Idris",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head = gear.Empy.head,
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet = gear.Relic.feet,
    neck={ name="Bagua Charm +1", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Etiolation Earring",
    right_ear="Lugalbanda Earring",
    left_ring="Defending Ring",
    right_ring="Shadow Ring",
    back = gear.AmbuCape.PetDT,
  }
  sets.status.Idle.DT = {
    main="Idris",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Volte Beret",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Mallquis Clogs +2",
    neck={ name="Bagua Charm +1", augments={'Path: A',}},
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Lugalbanda Earring",
    left_ring="Defending Ring",
    right_ring="Shadow Ring",
    back = gear.AmbuCape.PetDT,
  }
  sets.status.Idle.Refresh = {
    main="Daybreak",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Volte Beret",
    body="Jhakri Robe +2",
    hands="Nyame Gauntlets",
    legs='Volte Brais',
    feet="Mallquis Clogs +2",
    neck={ name="Bagua Charm +1", augments={'Path: A',}},
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Lugalbanda Earring",
    left_ring={name="Stikini Ring +1",bag="wardrobe",priority=1},
    right_ring={name="Stikini Ring +1",bag="wardrobe2",priority=2},
    back = gear.AmbuCape.PetDT,
  }
  sets.status.Melee = {
    main="Maxentius",
    sub="Ammurapi Shield",
    ammo="Amar Cluster",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Bagua Charm +1", augments={'Path: A',}},
    waist="Ninurta's Sash",
    left_ear="Mache Earring +1",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
  }
  sets.items = {}
  sets.items.HolyWater = {
    neck="Nicander's Necklace",
    right_ring="Purity Ring",
  }


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- PRECAST SETS -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


  sets.precast = {}
  sets.precast.FastCast = {
    -- 69% Fast Cast, 10% Quick Cast
    -- main="Idris",
    -- ammo="Impatiens",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+9','"Fast Cast"+6',}},
    body="Agwu's Robe",
    hands="Agwu's Gages",
    legs = gear.AF.legs,
    feet={ name="Merlinic Crackows", augments={'"Fast Cast"+6','"Mag.Atk.Bns."+1',}},
    neck="Orunmila's Torque",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Weather. Ring +1",
    right_ring="Lebeche Ring",
    back = gear.AmbuCape.PetDT,
  }

  sets.precast['Black Halo'] = {
    ammo="Amar Cluster",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Regal Earring",
    left_ring="Metamorph Ring +1",
    right_ring="Rufescent Ring",
  }
  sets.precast["Aeolian Edge"] = {
    ammo="Pemphredo Tathlum",
    head = gear.Relic.head,
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear = gear.Moonshade,
    right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back = gear.AmbuCape.Nuke,
  }

  sets.precast.SS = {
    head="Umuthi Hat",   -- Dropped this apparently.
    legs="Doyen Pants",  -- Not worth the +1 inventory for BLM
    waist="Siegel Sash",
  }
  sets.precast.Enhancing = {waist="Siegel Sash",}
  sets.precast.Manafont = {body = gear.Relic.body,}
  sets.precast.Healing = {legs="Doyen Pants",}

  sets.precast.FullCircle = {
    head = gear.Empy.head,
    body = gear.AF.body,
    back = gear.AmbuCape.PetDT,
  }

  sets.precast.FlashNova = {
    ammo="Pemphredo Tathlum",
    head={ name="Merlinic Hood", augments={'DEX+2','Crit.hit rate+3','"Refresh"+1','Accuracy+20 Attack+20','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
    feet="Crier's Gaiters",
    neck="Caro Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Weather. Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Pet: Damage taken -5%',}},
  }

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- MIDCAST SETS -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


  sets.midcast = {}

  sets.midcast.Geomancy = {
    -- +18 handbell
    -- +37 geomancy
    main="Idris",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head = gear.Empy.head,
    body = gear.Relic.body,
    hands = gear.AF.hands,
    legs = gear.Relic.legs,
    feet = gear.Empy.feet,
    neck={ name="Bagua Charm +1", augments={'Path: A',}},
    left_ear="Gna Earring",
    back = gear.ReiveCape,
  }
  sets.midcast.Indi_Duration = {
    legs = gear.Relic.legs,
    feet = gear.Empy.feet,
  }

  sets.midcast.Cures = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Hydrocera",
    head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    body={ name="Vanya Robe", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    hands = gear.AF.hands,
    feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    neck="Nodens gorget",
    waist="Sacro Cord",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Sirona's Ring",
    right_ring="Metamorph Ring +1",
    back = gear.AmbuCape.PetDT,
  }
  sets.midcast.FreeNuke = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Ghastly Tathlum +1",
    head = gear.Relic.head,
    body="Agwu's Robe",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Agwu's Slops",
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Sibyl Scarf",
    waist="Sacro Cord",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring="Metamorph Ring +1",
    back = gear.AmbuCape.Nuke,
  }
  sets.midcast.MagicBurst = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Ea Hat +1",
    body="Ea Houppe. +1",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Agwu's Slops",
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Sibyl Scarf",
    waist="Sacro Cord",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Freke Ring",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Pet: "Regen"+10','Pet: Damage taken -5%',}},
  }
  sets.midcast.Enfeeble = {
  -- +76 Enfeebling Magic Skill
  -- +196 Magic Accuracy
  -- +10% Enfeeble Duration
  -- +189 INT
  -- +179 MND
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head = gear.Relic.head,
    body =   gear.Amalric.body,
    hands = gear.AF.hands,
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet = gear.Relic.feet,
    neck={ name="Bagua Charm +1", augments={'Path: A',}},
    waist="Sacro Cord",
    left_ear="Crep. Earring",
    right_ear="Malignance Earring",
    left_ring="Weather. Ring +1",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back = gear.AmbuCape.Nuke,
  }
  sets.midcast.Enhancing = {
  -- +22 Enhancing Skill
  -- +47% Enhancing Magic Duration (+57% with Ammurapi Shield)
    sub="Ammurapi Shield",
    head = gear.Telchine.head,
    body = gear.Telchine.body,
    hands = gear.Telchine.hands,
    legs = gear.Telchine.legs,
    feet = gear.Telchine.feet,
    neck="Incanter's Torque",
    waist="Embla Sash",
  }
  sets.midcast.DrainAspir = {
  -- +35 Dark Magic Skill
  -- +44 Drain/Aspir potency
    head="Pixie Hairpin +1",
    body="Agwu's Robe",
    hands = gear.Merlinic.hands.DrainAspir,
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Erra Pendant",
    waist="Fucho-no-Obi",
    left_ring="Archon Ring",
    right_ring="Evanescence Ring",
  }
  sets.midcast.Stoneskinn = {
    neck="Nodens Gorget",
    waist="Siegel Sash",
  }
  sets.midcast.ConserveMP = {
    -- GEO gets native +43 Converve MP.
    -- +57 remaining to cap
    head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}}, -- +6
    body="Vedic Coat", -- +10
    legs={ name="Lengo Pants", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',}}, -- +5
    feet={ name="Medium's Sabots", augments={'MP+45','MND+9','"Conserve MP"+5','"Cure" potency +4%',}}, -- +5
    right_ear="Mendi. Earring", -- +2
  }
  sets.midcast.Treasure = {
    head="Wh. Rarab Cap +1",
    hands = gear.Merlinic.hands.TH,
    feet="Volte Boots",
    waist="Chaac Belt",
  }

end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- SPELL/ABILITY LISTS ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function maps() -- For some reason this is required if you want to use List:contains(spell.english). You have to have this "function maps()" and "end" lines surrounding your lists.
-- You also need the maps() line in your get_sets() function if you want these to work.
-- Otherwise you will get an error for all lines that use the "contains(spell.english)" function that says something along the lines of "attempt to index global 'TreasureHunter' (a Nil value)"
-- In addition to the above 3 lines, you'll also need to have the random S infront of your lists

  Cures          = S {"Cure", "Cure II", "Cure III", "Cure IV"}
  DoTs           = S {"Rasp", "Drown", "Choke", "Burn", "Frost", "Shock"}
  EraseNas       = S {"Paralyna", "Stona", "Poisona", "Blindna", "Viruna", "Silena", "Cursna", "Erase"}
  HighCost       = S {"Raise", "Quake II", "Flood II", "Tornado II", "Flare II", "Freeze II", "Burst II"}
  DrainSpells    = S {"Drain", "Aspir", "Aspir II", "Aspir III"}
  Storms         = S {"Sandstorm", "Windstorm", "Hailstorm", "Firestorm", "Rainstorm", "Thunderstorm", "Aurorastorm", "Voidstorm"}
  Treasure       = S {"Dia", "Dia II", "Bio", "Bio II"}
  AoE            = S {"Stonega", "Stonega II", "Stonega III", "Stoneja",
                      "Waterga", "Waterga II", "Waterga III", "Waterja",
                      "Aeroga", "Aeroga II", "Aeroga III", "Aeroja",
                      "Firaga", "Firaga II", "Firaga III", "Firaja",
                      "Blizzaga", "Blizzaga II", "Blizzaga III", "Blizzaja",
                      "Thundaga", "Thundaga II", "Thundaga III", "Thundaja"}
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- PRECAST FUNCTION ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


function precast(spell)

  self = windower.ffxi.get_mob_by_target('me')
  target = windower.ffxi.get_mob_by_target('t') or windower.ffxi.get_mob_by_target('st') or self
  distance = math.sqrt((self.x - target.x)^2 + (self.y - target.y)^2)
  weather_intensity = gearswap.res.weather[world.weather_id].intensity

  if sets.precast[spell.name] then
        equip(set_combine(sets.precast.FastCast, sets.precast[spell.name]))
  elseif spell.skill == "Healing Magic" then
    equip(set_combine(sets.precast.FastCast, sets.precast.Cures))
  elseif spell.name == "Stoneskin" then
    equip(set_combine(sets.precast.FastCast, sets.precast.SS))
  elseif spell.skill == "Enhancing Magic" then
    equip(set_combine(sets.precast.FastCast, sets.precast.Enhancing))
  elseif spell.name == "Life Cycle" then
    equip(sets.precast.FullCircle)
  elseif spell.name == "Concentric Pulse" then
    equip({head = gear.Relic.head})
  elseif spell.name == "Bolster" then
    equip({body = gear.Relic.body})
  elseif spell.name == "Full Circle" then
    equip({hands = gear.Relic.hands})
  elseif spell.name == "Flash Nova" then
    equip(sets.precast.FlashNova)
  elseif spell.name == "Holy Water" then
    equip(set_combine(sets.status.Idle.DT,sets.items.HolyWater))
  else
    equip(sets.precast.FastCast)
  end
  if spell.name == "Dispelga" then
    equip({main = "Daybreak"})
  end

end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- MIDCAST FUNCTION ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


function midcast(spell)


  if spell.skill == "Elemental Magic" then
      equip(sets.midcast.FreeNuke)
    if MagicBurstFlag == 1 then
      equip(sets.midcast.MagicBurst)
    end
    if (world.weather_element == spell.element and world.day_element == spell.element) or (world.weather_element == spell.element and weather_intensity == 2) then
      equip(gear.Obi)
    elseif distance < 7 then
      equip(gear.Orpheus)
    elseif world.weather_element == spell.element or world.day_element == spell.element then
      equip(gear.Obi)
    end

  elseif DrainSpells:contains(spell.english) then
    equip(set_combine(sets.midcast.FreeNukeAccuracy, sets.midcast.DrainAspir))
    if world.weather_element == spell.element or world.day_element == spell.element then
      equip(sets.Obi)
    end

  elseif spell.skill == "Geomancy" then
    equip(set_combine(sets.midcast.ConverveMP, sets.midcast.Geomancy))

  elseif spell.skill == "Dark Magic" then
    if DrainSpells:contains(spell.name) then
      equip(set_combine(sets.midcast.FreeNukeAccuracy,sets.midcast.DrainAspir))
    elseif spell.name == "Stun" then
      equip(set_combine(sets.midcast.FreeNuke,sets.midcast.FreeNukeAccuracy,sets.midcast.Dark))
    end
    if world.weather_element == spell.element or world.day_element == spell.element then
      equip(sets.Obi)
    end

  elseif spell.skill == "Healing Magic" then
    if Cures:contains(spell.english) then
      equip(sets.midcast.Cures)
      if world.weather_element == spell.element or world.day_element == spell.element then
        equip(gear.Obi)
      end
    elseif EraseNas:contains(spell.english) then
      equip(set_combine(sets.midcast.ConserveMP, sets.midcast.Recast))
    elseif HighCost:contains(spell.english) then
      equip(sets.midcast.ConserveMP)
    end

  elseif spell.skill == "Enfeebling Magic" then
    equip(set_combine(sets.midcast.FreeNukeAccuracy, sets.midcast.Enfeeble))
    if buffactive["Klimaform"] then
      if world.weather_element == spell.element then
        equip(gear.Obi)
      end
    end

  elseif spell.skill == "Enhancing Magic" then
    equip(sets.midcast.Enhancing)
    if spell.name == "Stoneskin" then
      equip(sets.midcast.Stoneskinn)
    end
  end

  if Treasure:contains(spell.name) then
    if TreasureHunterFlag == 1 then
      equip(sets.midcast.Treasure)
    end
  end
  if spell.name == "Dispelga" then
    equip({main = "Daybreak"})
  end

  if buffactive["Entrust"] then
    equip({main={ name="Gada", augments={'Indi. eff. dur. +10','Mag. Acc.+13','DMG:+3',}},})
  end
end



function aftercast(spell)
  -- local pet = windower.ffxi.get_mob_by_target('pet')
  -- if pet then
  --   for k,v in pairs(pet) do
  --     print(v)
  --   end
  -- end
  if player.status == 'Idle' then
      equip(sets.status.Idle.Pet)
  elseif player.status == 'Engaged' then
    equip(sets.status.Melee)
  end
end

function status_change(new,old)
  if new == "Idle" then
    equip(sets.status.Idle.Pet)
  elseif sets.status[new] then
    equip(sets.status[new])
  elseif player.status == 'Engaged' then
    equip(sets.status.Melee)
  end
end
