function get_sets()
  AccFlag            = 1
  HasteFlag          = 0
  HybridTPFlag       = false
  CritTPFlag         = false
  MagicBurstFlag     = false
  UtsuEnmityFlag     = false



  -- ! == alt
  -- ^ == ctrl
  --
  -- F# commands
  send_command('bind f9 gs c cycle TP mode')
  send_command('bind f10 gs c cycle Haste')
  send_command('bind f11 gs c Equip Movement')
  send_command('bind f12 gs c Equip DT')

  -- Ctrl+F# commands
  send_command('bind ^f9 gs c Equip Treasure Hunter')
  -- send_command('bind ^f10 gs c Tauret')
  -- send_command('bind ^f11 gs c Kannagi')
  send_command('bind ^f12 gs c Equip MEva')

  -- Alt+F# commands
  send_command('bind !f9 gs c Naegling')
  send_command('bind !f10 gs c Gandiva')
  send_command('bind !f11 gs c Fomalhaut')
  send_command('bind !f12 gs c toggle HybridTP')

  -- Ctrl+Alt+F# commands
  -- send_command('bind ^!f9 gs c toggle CritTP')
  -- send_command('bind ^!f10 gs c Free spot') -- Free spot
  -- send_command('bind ^!f11 gs c toggle MagicBurst')
  -- send_command('bind ^!f12 gs c toggle UtsuEnmity')


  function file_unload()
    send_command('unbind f9')
    send_command('unbind f10')
    send_command('unbind f11')
    send_command('unbind f12')
    send_command('unbind ^f9')
    send_command('unbind ^f10')
    send_command('unbind ^f11')
    send_command('unbind ^f12')
    send_command('unbind !f9')
    send_command('unbind !f10')
    send_command('unbind !f11')
    send_command('unbind !f12')
    send_command('unbind ^!f9')
    send_command('unbind ^!f10')
    send_command('unbind ^!f11')
    send_command('unbind ^!f12')
  end


  function self_command(command)

    if command == 'Equip Treasure Hunter' then
      equip(sets.Treasure)
      send_command('@input /echo Treasure Hunter +4 equipped')
    end
    if command == 'Naegling' then
      equip(sets.WeaponSet.Naegling)
      send_command('@input /echo Naegling weapon set equipped.')
      -- send_command('@input /lockstyleset 49')
    end
    if command == 'Gandiva' then
      equip(sets.WeaponSet.Gandiva)
      send_command('@input /echo Gandiva weapon set equipped.')
      -- send_command('@input /lockstyleset 48')

    end
    if command == 'Fomalhaut' then
      equip(sets.WeaponSet.Fomalhaut)
      send_command('@input /echo Fomalhaut weapon set equipped.')
      -- send_command('@input /lockstyleset 47')
    end


    if command == 'cycle Haste' then
      if HasteFlag == 0 then
        HasteFlag = 1
        send_command('@input /echo Haste Level: 15%')
      elseif HasteFlag == 1 then
        HasteFlag = 2
        send_command('@input /echo Haste Level: 30%')
      elseif HasteFlag == 2 then
        HasteFlag = 3
        send_command('@input /echo Haste Level: Capped')
      elseif HasteFlag == 3 then
        HasteFlag = 0
        send_command('@input /echo Haste Level: 0%')
      end
    end

    if command == 'cycle TP mode' then
      if AccFlag == 0 then
        AccFlag = 1
        send_command('@input /echo Accuracy mode: 1200 Eva')
      elseif AccFlag == 1 then
        AccFlag = 2
        send_command('@input /echo Accuracy mode: 1350 Eva')
      elseif AccFlag == 2 then
        AccFlag = 3
        send_command('@input /echo Accuracy mode: 1500 Eva')
      elseif AccFlag == 3 then
        AccFlag = 0
        send_command('@input /echo Accuracy mode: 1150 Eva')
      end
    end

    if command == 'toggle HybridTP' then
      if HybridTPFlag == true then
        HybridTPFlag = false
        send_command('@input /echo Hybrid DT + Melee toggled OFF')
      elseif HybridTPFlag == false then
        HybridTPFlag = true
        send_command('@input /echo Hybrid DT + Melee toggled ON')
      end
    end

    if command == 'toggle CritTP' then
      if CritTPFlag == true then
        CritTPFlag = false
        send_command('@input /echo Kannagi AM3 Crit TP toggled OFF')
      elseif CritTPFlag == false then
        CritTPFlag = true
        send_command('@input /echo Kannagi AM3 Crit TP toggled ON')
      end
    end

    if command == 'Equip DT' then
      equip(sets.status.Idle.DT)
      send_command('@input /echo Damage Taken set equipped.')
    end
    if command == 'Equip MEva' then
      equip(sets.status.Idle.Eva)
      send_command('@input /echo Idle Evasion set equipped.')
    end

    if command == 'Equip Movement' then
      equip({legs="Carmine Cuisses +1"})
			send_command('@input /echo Carmine Cuisses +1 equipped.')
    end

  end


  gear = {}
  gear.Moonshade                     = { name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}}
  gear.Obi                           = { waist="Hachirin-no-Obi"}

  gear.Empy = {}
  gear.Empy.head                     = {}
  gear.Empy.body                     = {}
  gear.Empy.hands                    = {}
  gear.Empy.legs                     = {}
  gear.Empy.feet                     = {}

  gear.Adhemar = {}

  gear.Adhemar.head = {}
  gear.Adhemar.head.Accuracy         = { name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}}

  gear.Adhemar.body = {}
  gear.Adhemar.body.Attack           = { name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}}

  gear.Adhemar.hands = {}
  gear.Adhemar.hands.Accuracy        = { name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}}
  gear.Adhemar.hands.Attack          = { name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}}

  gear.AmbuCape = {}
  gear.AmbuCape.Crit                 = { name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Crit.hit rate+10',}}
  gear.AmbuCape.STP                  = { name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10','Damage taken-5%',}}
  gear.AmbuCape.DW                   = { name="Belenus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Damage taken-5%',}}
  gear.AmbuCape.WSDstr               = { name="Belenus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}}
  gear.AmbuCape.Snapshot             = { name="Belenus's Cape", augments={'"Snapshot"+10',}}

  gear.AF = {}
  gear.AF.head                       = {}
  gear.AF.body                       = { name="Orion Jerkin +1"}
  gear.AF.hands                      = { name="Orion Bracers +3"}
  gear.AF.legs                       = { name="Orion Braccae +2"}
  gear.AF.feet                       = {}

  gear.Herc = {}
  gear.Herc.head = {}
  gear.Herc.head.FC                  = { name="Herculean Helm", augments={'"Mag.Atk.Bns."+6','"Fast Cast"+4',}}

  gear.Herc.hands = {}

  gear.Herc.body = {}

  gear.Herc.legs = {}

  gear.Herc.feet = {}
  gear.Herc.feet.QA                  = { name="Herculean Boots", augments={'Accuracy+17','Pet: STR+1','Quadruple Attack +3','Accuracy+18 Attack+18','Mag. Acc.+3 "Mag.Atk.Bns."+3',}}

  gear.Relic = {}
  gear.Relic.head                    = { name="Arcadian Beret +3", augments={'Enhances "Recycle" effect',}}
  gear.Relic.body                    = {}
  gear.Relic.hands                   = {}
  gear.Relic.legs                    = {}
  gear.Relic.feet                    = {}


  sets.items = {}
  sets.items.HolyWater = {
    neck="Nicander's Necklace",
    right_ring="Purity Ring",
  }

  sets.WeaponSet = {}
  sets.WeaponSet.Naegling = {
    main="Naegling",
    sub="Mercurial Kris",
    range={ name="Accipiter", augments={'TP Bonus +1000',}},
    ammo="Hauksbok Arrow",
  }
  sets.WeaponSet.Gandiva = {
    main="Oneiros Knife",
    sub="Nusku Shield",
    range="Gandiva",
    ammo="Chrono arrow",
  }
  sets.WeaponSet.Fomalhaut = {
    main="Perun +1",
    sub="Nusku Shield",
    range="Fomalhaut",
    ammo="Chrono bullet",
  }


  sets.status = {}
  sets.status.Idle = {}
  sets.status.Idle.DT = {
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Warder's Charm +1",
    waist="Carrier's Sash",
    left_ear="Etiolation Earring",
    right_ear="Sanare Earring",
    left_ring="Defending Ring",
    right_ring="Shadow Ring",
    back="Shadow Mantle",
  }

  sets.Melee = {}

  sets.Melee.Trials = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Sanctity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Crepuscular Ring",
    right_ring="Epona's Ring",
    back="Shadow Mantle",
  }

  sets.Melee.Standard = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Combatant's Torque",
    waist="Kentarch Belt +1",
    left_ear="Brutal Earring",
    right_ear="Telos Earring",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back = gear.AmbuCape.DW
  }
  sets.Melee.Hybrid = {
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Ilabrat Ring",
    right_ring="Epona's Ring",
    back = gear.AmbuCape.DW
  }

  sets.Treasure = {
    head="Volte Cap",
    feet="Volte Boots",
    hands="Volte Bracers",
    waist="Chaac Belt",
  }

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ----- PRECAST SETS -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  sets.precast = {}
  sets.precast.FastCast = {
  -- +56% Fast Cast, +7% Quick Magic
    head = gear.Herc.head.FC,
    body="Dread Jupon",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Gyve Trousers",
    feet="",
    neck="Orunmila's Torque",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Weather. Ring +1",
    right_ring="Lebeche Ring",
    back = gear.AmbuCape.Evasion,
  }
  sets.precast.Preshot0 = {
    -- Snapshot: 56+10(merits)
    -- Rapidshot: 10
    head={ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+5',}},
    body="Amini Caban +1", -- 0,0,7
    hands="Carmine Fin. Ga.", -- 7,10
    legs = gear.AF.legs, -- 10,0
    feet="Meg. Jam. +2", -- 10,0
    neck={ name="Scout's Gorget +1", augments={'Path: A',}}, -- 3,0
    waist="Impulse Belt", -- 3,0
    left_ring="Crepuscular Ring", -- 3,0
    back = gear.AmbuCape.Snapshot, -- 10,0,2
  }
  sets.precast.Camoflage = {body=gear.AF.body}


  sets.WeaponSkill = {}
  sets.WeaponSkill["Last Stand"] = {
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear = gear.Moonshade,
    right_ear="Crep. Earring",
    left_ring="Gere Ring",
    right_ring="Regal Ring",
    back = gear.AmbuCape.WSDagi,
  }
  sets.WeaponSkill["Hot Shot"] = {
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear = gear.Moonshade,
    right_ear="Friomisi Earring",
    left_ring="Shiva Ring +1",
    right_ring="Regal Ring",
    back = gear.AmbuCape.WSDstr,
  }
  sets.WeaponSkill["Flaming Arrow"] = {
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear = gear.Moonshade,
    right_ear="Friomisi Earring",
    left_ring="Shiva Ring +1",
    right_ring="Regal Ring",
    back = gear.AmbuCape.WSDstr,
  }
  sets.WeaponSkill["Jishnu's Radiance"] = {
    ammo="Chrono Arrow",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Meg. Cuirie +2",
    hands="Mummu Wrists +2",
    legs="Jokushu Haidate",
    feet="Thereoid Greaves",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Odr Earring",
    right_ear="Sherida Earring",
    left_ring="Begrudging Ring",
    right_ring="Regal Ring",
    back = gear.AmbuCape.Crit
  }
  sets.WeaponSkill["Trueflight"] = {
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear = gear.Moonshade,
    right_ear="Crematio Earring",
    left_ring="Weather. Ring +1",
    right_ring="Dingir Ring",
    back = gear.AmbuCape.WSDagi,
  }
  sets.WeaponSkill["Wildfire"] = {
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Crematio Earring",
    left_ring="Shiva Ring +1",
    right_ring="Dingir Ring",
    back = gear.AmbuCape.WSDagi,
  }
  sets.WeaponSkill["Aeolian Edge"] = {
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear = gear.Moonshade,
    right_ear="Friomisi Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back = gear.AmbuCape.WSDstr,
  }
  sets.WeaponSkill["Savage Blade"] = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear = gear.Moonshade,
    right_ear="Sherida Earring",
    left_ring="Ilabrat Ring",
    right_ring="Regal Ring",
    back = gear.AmbuCape.WSDstr,
  }

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ----- MIDCAST SETS -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


  sets.midcast = {}
  sets.midcast.Midshot = {
    head = gear.Relic.head,
    body="Nisroch Jerkin",
    hands="Malignance Gloves",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="K. Kachina Belt +1",
    left_ear="Crep. Earring",
    right_ear="Telos Earring",
    left_ring="Crepuscular Ring",
    right_ring="Regal Ring",
    back = gear.AmbuCape.STP
  }
  sets.midcast.MidshotAM3 = {
    head="Meghanada Visor +2",
    body="Nisroch Jerkin",
    hands="Mummu Wrists +2",
    legs="Darraigner's Brais",
    feet="Thereoid Greaves",
    neck={ name="Scout's Gorget +1", augments={'Path: A',}},
    waist="K. Kachina Belt +1",
    left_ear="Telos Earring",
    right_ear="Enervating Earring",
    left_ring="Begrudging Ring",
    right_ring="Ilabrat Ring",
    back = gear.AmbuCape.Crit
  }
  sets.midcast.Barrage = {
    head = gear.Relic.head,
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands = gear.AF.hands,
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Malignance Boots",
    neck="Iskur Gorget",
    waist="Yemaya Belt",
    left_ear="Crep. Earring",
    right_ear="Enervating Earring",
    left_ring="Crepuscular Ring",
    right_ring="Ilabrat Ring",
    back = gear.AmbuCape.Crit

  }
  sets.midcast.Unlimited = {}

end




--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- SPELL/ABILITY LISTS ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- PRECAST FUNCTION ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


function precast(spell)

  if spell.action_type == 'Ranged Attack' or (spell.type == 'WeaponSkill' and spell.skill == 'Archery') or spell.name == "Bounty Shot" or spell.name == "Eagle Eye Shot" or spell.name == "Shadowbind" then
    if player.equipment.ammo == "Hauksbok Arrow" then
      cancel_spell()
      print("Spell cancelled; attempted to use Hauksbok Arrow.")
      send_command('@input /echo Spell cancelled\\; attempted to use Hauksbok Arrow.')
    end
  end

  self = windower.ffxi.get_mob_by_target('me')
  target = windower.ffxi.get_mob_by_target('t') or windower.ffxi.get_mob_by_target('st') or self
  distance = math.sqrt((self.x - target.x)^2 + (self.y - target.y)^2)
  weather_intensity = gearswap.res.weather[world.weather_id].intensity


  if sets.WeaponSkill[spell.name] then
      equip(sets.WeaponSkill[spell.name])
  elseif spell.type=="WeaponSkill" then
    equip(sets.WeaponSkill["Last Stand"])
  elseif spell.action_type == 'Ranged Attack' then
    equip(sets.precast.Preshot0)
  elseif spell.name == 'Spectral Jig' and buffactive['Sneak'] then
    -- If using Spectral Jig, automatically remove Sneak so the spell does not fail.
    windower.ffxi.cancel_buff(71)
  elseif spell.name == "Holy Water" then
    equip(set_combine(sets.status.Idle.DT,sets.items.HolyWater))
  else
    equip(sets.precast.FastCast)
  end


end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- MIDCAST FUNCTION ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function midcast(spell)

  if spell.action_type == 'Ranged Attack' then
    if buffactive['Aftermath: Lv.3'] then
      equip(sets.midcast.MidshotAM3)
    else
      equip(sets.midcast.Midshot)
    end
    if buffactive["Barrage"] then
        equip(sets.midcast.Barrage)
    end
  end

end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- AFTERCAST FUNCTION -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function aftercast(spell)
  if player.status == 'Idle' then
    equip(sets.status.Idle.DT)
  elseif player.status == "Engaged" then
    equip(sets.Melee.Hybrid)
  end
end

function status_change(new,old)

  if player.status == 'Idle' then
    equip(sets.status.Idle.DT)
  elseif player.status == "Engaged" then
    equip(sets.Melee.Hybrid)
  end

end
