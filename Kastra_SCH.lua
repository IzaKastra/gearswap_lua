include('organizer-lib')

function get_sets()


  maps()

  MagicBurstFlag     = 0
  MagicAccuracyFlag  = 0
  TreasureHunterFlag = 0

  send_command('bind f9 gs c toggle Magic Burst')
  send_command('bind f10 gs c toggle Magic Accuracy')
  send_command('bind f11 gs c equip Criers')
  send_command('bind f12 gs c Equip DT')
  send_command('bind ^f9 gs c toggle Treasure Hunter')
  send_command('bind ^f12 gs c Equip Idle')
  function file_unload()
    send_command('unbind f9')
    send_command('unbind f10')
    send_command('unbind f11')
    send_command('unbind f12')
    send_command('unbind ^f11')
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

    if command == 'toggle Magic Burst' then
      if MagicBurstFlag == 0 then
        MagicBurstFlag = 1
        send_command('@input /echo Magic Burst: ON')
      elseif MagicBurstFlag == 1 then
        MagicBurstFlag = 0
        send_command('@input /echo Magic Burst: OFF')
      end
      check_param()
    end

    if command == 'toggle Magic Accuracy' then
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
    if command == 'Equip Idle' then
      equip(sets.status.Idle.Refresh)
      send_command('@input /echo Damage Taken set equipped.')
    end


    if command == 'equip Criers' then
      equip(gear.Criers)
      send_command('@input /echo Crier\'s Gaiters Equipped.')
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
  gear.Criers                         = { feet="Crier's Gaiters"}

  gear.Akademos                       = { name="Akademos", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}}

  gear.AF = {} -- None of the SCH AF is worth the gil, especially with Empy+2/+3 providing so much Magic Accuracy
  gear.AF.head                        = {}
  gear.AF.body                        = {}
  gear.AF.hands                       = {}
  gear.AF.legs                        = {}
  gear.AF.feet                        = {}

  gear.Amalric = {}
  gear.Amalric.body                   = { name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}
  gear.Amalric.hands                  = { name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}
  gear.Amalric.legs                   = { name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}
  gear.Amalric.feet                   = { name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}

  gear.AmbuCape = {}
  gear.AmbuCape.Nuke                  = { name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}}

  gear.Chironic = {}
  gear.Chironic.head                  = { name="Chironic hat"}

  gear.Chironic.legs = {}
  gear.Chironic.legs.MNDfeeble       = { name="Chironic Hose", augments={'Mag. Acc.+26','MND+10',}}
  gear.Chironic.legs.INTfeeble       = { name="Chironic Hose", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','"Fast Cast"+3','INT+8','Mag. Acc.+4',}}

  gear.Empy = {}
  gear.Empy.head                      = {name="Arbatel Bonnet +3"}
  gear.Empy.body                      = {name="Arbatel Gown +3",}
  gear.Empy.hands                     = {name="Arbatel Bracers +3"}
  gear.Empy.legs                      = {name="Arbatel Pants +2",}
  gear.Empy.feet                      = {name="Arbatel Loafers +3"}


  gear.Merlinic = {}
  gear.Merlinic.head = {}
  gear.Merlinic.head.FC               = { name="Merlinic Hood", augments={'Mag. Acc.+9','"Fast Cast"+6',}}

  gear.Merlinic.body = {}

  gear.Merlinic.hands = {}
  gear.Merlinic.hands.FC              = { name="Merlinic Dastanas", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','"Fast Cast"+5','DEX+3','Mag. Acc.+4','"Mag.Atk.Bns."+9',}}
  gear.Merlinic.hands.DrainAspir      = { name="Merlinic Dastanas", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','"Drain" and "Aspir" potency +4','MND+2','Mag. Acc.+6','"Mag.Atk.Bns."+5',}}

  gear.Merlinic.legs                  = {}
  gear.Merlinic.legs.TH               = { name="Merlinic Shalwar", augments={'Accuracy+4','Enmity-6','"Treasure Hunter"+2','Accuracy+16 Attack+16','Mag. Acc.+7 "Mag.Atk.Bns."+7',}}
  gear.Merlinic.legs.MB               = { name="Merlinic Shalwar", augments={'Mag. Acc.+24','Magic burst dmg.+9%','INT+10','"Mag.Atk.Bns."+15',}}

  gear.Merlinic.feet = {}
  gear.Merlinic.feet.FC               = { name="Merlinic Crackows", augments={'"Fast Cast"+6','"Mag.Atk.Bns."+1',}}

  gear.ReiveCape = {}
  gear.ReiveCape.Helix                = { name="Bookworm's Cape", augments={'INT+1','Helix eff. dur. +19',}}
  gear.ReiveCape.Regen                = { name="Bookworm's Cape", augments={'INT+2','MND+2','"Regen" potency+9',}}

  gear.Relic = {}
  gear.Relic.head                     = { name="Peda. M.Board +3", augments={'Enh. "Altruism" and "Focalization"',}}
  gear.Relic.body                     = { name="Peda. Gown +3", augments={'Enhances "Enlightenment" effect',}}
  gear.Relic.hands                    = {}
  gear.Relic.legs                     = { name="Peda. Pants +1", augments={'Enhances "Tabula Rasa" effect',}}
  gear.Relic.feet                     = { name="Peda. Loafers +1", augments={'Enhances "Stormsurge" effect',}}

  gear.Telchine = {}
  gear.Telchine.head                  = { name="Telchine Cap", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}}
  gear.Telchine.body                  = { name="Telchine Chas.", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}}
  gear.Telchine.hands                 = { name="Telchine Gloves", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +9',}}
  gear.Telchine.legs                  = { name="Telchine Braconi", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}}
  gear.Telchine.feet                  = { name="Telchine Pigaches", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}}


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- STATUS SETS --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


  sets.status = {}
  sets.status.Idle = {}
  sets.status.Idle.DT = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head = "Volte Beret",
    body = gear.Empy.body,
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Mallquis Clogs +2",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Carrier's Sash",
    left_ear="Etiolation Earring",
    right_ear="Lugalbanda Earring",
    left_ring="Defending Ring",
    right_ring="Shadow Ring",
    back = gear.AmbuCape.Nuke,
  }
  sets.status.Idle.Refresh = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Homiliary",
    head="Volte Beret",
    body = gear.Empy.body,
    hands="Nyame Gauntlets",
    legs="Volte Brais",
    feet="Mallquis Clogs +2",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Lugalbanda Earring",
    left_ring="Defending Ring",
    right_ring="Shadow Ring",
    back = gear.AmbuCape.Nuke,
  }
  sets.status.Melee = {
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Combatant's Torque",
    waist="Witful Belt",
    left_ear="Telos Earring",
    right_ear="Mache Earring +1",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back = gear.AmbuCape.Nuke,
  }
  sets.status.Sublimation = {
    -- head = gear.AF.head, -- +4
    body = gear.Relic.body, -- +5
    waist="Embla Sash", -- +3
  }


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- PRECAST SETS -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


  sets.precast = {}
  sets.precast.FastCast = {
  -- 79% Fast Cast, 5% Quick Cast
    ammo="Impatiens",
    head = gear.Merlinic.head.FC,
    body="Agwu's Robe",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Volte Brais",
    feet = gear.Merlinic.feet.FC,
    neck="Orunmila's Torque",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Malignance Earring",
    left_ring="Weather. Ring +1",
    right_ring="Kishar Ring",
    gear.AmbuCape.FC,
  }

  sets.precast.Impact = {
    ammo="Impatiens",
    head="Empty",
    body="Crepuscular Cloak",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Volte Brais",
    feet = gear.Merlinic.feet.FC,
    neck="Orunmila's Torque",
    waist="Embla Sash",
    left_ear="Loquac. Earring",
    right_ear="Malignance Earring",
    left_ring="Weather. Ring +1",
    right_ring="Kishar Ring",
  }
  sets.precast.Tabula = {legs = gear.Relic.legs,}
  sets.precast.Enlightenment = {body = gear.Relic.body}

  sets.precast.Myrkr = {
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Pixie Hairpin +1",
    body = gear.Amalric.body,
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs = gear.Amalric.legs,
    feet = gear.Amalric.feet,
    neck="Sanctity Necklace",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Evans Earring",
    left_ring="Sangoma Ring",
    right_ring="Etana Ring",
  }
  sets.precast.Cataclysm = {
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Pixie Hairpin +1",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring="Archon Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
  }

  sets.precast.EarthCrusher = {
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
  }

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- MIDCAST SETS -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


  sets.midcast = {}

  sets.midcast.Cures = {
    main="Daybreak",
    sub="Sors Shield",
    head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    body={ name="Vanya Robe", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +8',}},
    legs="Gyve Trousers",
    feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    neck="Nodens Gorget",
    waist="Sacro Cord",
    left_ear="Regal Earring",
    right_ear="Mendi. Earring",
    left_ring="Sirona's Ring",
    right_ring="Haoma's Ring",
  }
  sets.midcast.Helix = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    body="Agwu's Robe",
    body = gear.Empy.body,
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Agwu's Slops",
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck={ name="Argute Stole +1", augments={'Path: A',}},
    waist="Sacro Cord",
    back = gear.ReiveCape.Helix,
  }
  sets.midcast.Nuke = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head = gear.Empy.head,
    body="Agwu's Robe",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Agwu's Slops",
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck={ name="Argute Stole +1", augments={'Path: A',}},
    waist="Sacro Cord",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring="Metamorph Ring +1",
    back = gear.AmbuCape.Nuke,
  }
  sets.midcast.MagicBurst = {
  -- +37% MB, +15% MBII (gear), +13% (MBII JP Gifts)
  -- Total: +37% MB, +28% MBII
    head = gear.Relic.head,
    body="Agwu's Robe",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Agwu's Slops",
    feet = gear.Empy.feet,
    neck={ name="Argute Stole +1", augments={'Path: A',}},
    left_ring="Mujin Band",
  }
  sets.midcast.DarkAffinity = {
    head="Pixie Hairpin +1",
    right_ring="Archon Ring",
  }
  sets.midcast.LightAffinity = {
    main="Daybreak",
    sub="Ammurapi Shield",
    left_ring="Weather. Ring +1",
  }

  sets.midcast.Enfeeble = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head={ name="Peda. M.Board +3", augments={'Enh. "Altruism" and "Focalization"',}},
    body="Agwu's Robe",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck={ name="Argute Stole +1", augments={'Path: A',}},
    waist="Sacro Cord",
    left_ear="Crep. Earring",
    right_ear="Malignance Earring",
    left_ring="Weather. Ring +1",
    right_ring="Kishar Ring",
    back = gear.AmbuCape.Nuke,
  }

  sets.midcast.EnhancingDuration = {
		main="Pedagogy Staff", -- +15%
    head = gear.Telchine.head,     -- +9%
    body = gear.Relic.body,        -- +12%
    hands = gear.Telchine.hands,   -- +8%
    legs = gear.Telchine.legs,     -- +8%
    feet = gear.Telchine.feet,     -- +10%
    waist="Embla Sash",
  }
  sets.midcast.EnhancingSkill = {
  -- +49 Enhancing Magic Skill
    head = gear.Empy.head,
    body = gear.Relic.body,
    neck="Incanter's Torque",
    waist="Cascade Belt",
    left_ear="Mimir Earring",
  }

  sets.midcast.Impact = {
    -- Stack Magic Accuracy
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    body="Crepuscular Cloak",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Agwu's Slops",
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck={ name="Argute Stole +1", augments={'Path: A',}},
    waist="Sacro Cord",
    left_ear="Crep. Earring",
    right_ear="Malignance Earring",
    left_ring="Weather. Ring +1",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back = gear.AmbuCape.Nuke,
  }
  sets.midcast.Aquaveil = {head = gear.Chironic.head}

  sets.midcast.DrainAspir = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Agwu's Robe",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Agwu's Slops",
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Erra Pendant",
    waist="Fucho-no-Obi",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Archon Ring",
    right_ring="Evanescence Ring",
    back = gear.AmbuCape.Nuke,
  }
  sets.midcast.Stoneskin = {
    neck="Nodens Gorget",
    waist="Siegel Sash",
  }
  sets.midcast.Regen = {
		main="Pedagogy Staff",
    head = gear.Empy.head,
    body = gear.Telchine.body,
    back = gear.ReiveCape.Regen,
  }
  sets.midcast.Cursna = {
  -- +93 Healing Magic Skill, +48 Cursna
    body = gear.Relic.body,
    feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
    neck="Debilis Medallion",
    left_ring="Haoma's Ring",
    right_ring="Haoma's Ring",
    back="Oretan. Cape +1",
  }
  sets.midcast.Treasure = {
    ammo="Perfect Lucky Egg", -- +1
    head="Volte Cap",  -- +1
    hands="Volte Bracers",  -- +1
    legs = gear.Merlinic.legs.TH,  -- +2
    feet="Volte Boots",  -- +1
    waist="Chaac Belt",  -- +1
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
    Regens         = S {"Regen", "Regen II", "Regen III", "Regen IV", "Regen V"}
    EraseNas       = S {"Paralyna", "Stona", "Poisona", "Blindna", "Viruna", "Silena", "Cursna", "Erase"}
    DrainSpells    = S {"Drain", "Aspir", "Aspir II"}
    MNDfeeble      = S {"Addle", "Paralyze", "Silence", "Slow"}
    INTfeeble      = S {"Bind", "Blind", "Distract", "Frazzle", "Gravity", "Sleep", "Sleep II", "Poison", "Poison II", "Break", "Dispel"}
    DoTs           = S {"Dia", "Dia II", "Bio", "Bio II"}
    EnhSkill       = S {"Stoneskin", "Aquaveil", "Blink", "Ice Spikes", "Shock Spikes", "Blaze Spikes",
                        "Barfire", "Barwater", "Barthunder", "Barstone", "Baraero", "Barblizzard", "Barparalyze", "Barpetrify", "Barpoison", "Barblind", "Barvirus", "Barsilence", "Barsleep", "Baramnesia"}
    EnhDuration    = S {"Haste", "Flurry", "Refresh", "Regen", "Regen II", "Klimaform", "Embrava"}
    Storms         = S {"Sandstorm", "Windstorm", "Hailstorm", "Firestorm", "Rainstorm", "Thunderstorm", "Aurorastorm", "Voidstorm",
                        "Sandstorm II", "Windstorm II", "Hailstorm II", "Firestorm II", "Rainstorm II", "Thunderstorm II", "Aurorastorm II", "Voidstorm II"}
    Helix          = S {"Geohelix", "Hydrohelix", "Anemohelix", "Pyrohelix", "Cryohelix", "Ionohelix","Luminohelix","Noctohelix",
                        "Geohelix II", "Hydrohelix II", "Anemohelix II", "Pyrohelix II", "Cryohelix II", "Ionohelix II","Luminohelix II","Noctohelix II"}
    Treasure       = S {"Dia", "Dia II", "Diaga", "Bio", "Bio II"}
end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- PRECAST FUNCTION ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function precast(spell)


    -- local allRecasts = windower.ffxi.get_ability_recasts()
    -- local stratsRecast = allRecasts[231]

    -- local maxStrategems = math.floor((player.main_job_level + 10) / 20)

    -- local fullRechargeTime = maxStrategems*33

    -- local currentCharges = math.floor(maxStrategems - maxStrategems * stratsRecast / fullRechargeTime)
    
    -- -- print(currentCharges,maxStrategems, math.floor(stratsRecast), fullRechargeTime)

    -- if spell.name == "Immanence" then

    --     if currentCharges > 0 and not buffactive["Immanence"] then -- The number of charges before using Immanence
    --         while stratsRecast > 33 do
    --             stratsRecast = stratsRecast - 33
    --         end
    --         currentCharges = currentCharges - 1
    --         -- print("Strategems: "..scount..". Recast: "..srecast.." seconds.")
    --         -- send_command('@input /echo Strategems:'..currentCharges.."   Next:"..math.floor(stratsRecast).." seconds.")
    --         -- send_command('@input /p [Strategems remaining:'..currentCharges.."]   [Next:"..math.floor(stratsRecast).." seconds]")
    --         -- send_command('@input /p Strategems:'..scount.."   Next:"..srecast.." seconds.")
    --     end
    -- end
    



    

  self = windower.ffxi.get_mob_by_target('me')
  target = windower.ffxi.get_mob_by_target('t') or windower.ffxi.get_mob_by_target('st') or self
  distance = math.sqrt((self.x - target.x)^2 + (self.y - target.y)^2)
  weather_intensity = gearswap.res.weather[world.weather_id].intensity

  if spell.name == "Impact" then
    equip(sets.precast[spell.name])
  elseif spell.name == "Tabula Rasa" then
    equip(sets.precast.Tabula)
  elseif spell.name == "Enlightenment" then
    equip(sets.precast.Enlightenment)
  elseif spell.skill ~= nil then
    equip(sets.precast.FastCast)
  end

  if spell.name == "Myrkr" then
    equip(sets.precast.Myrkr)
  end
  if spell.name == "Cataclysm" then
    equip(sets.precast.Cataclysm)
  end
  if spell.name == "Earth Crusher" then
    equip(sets.precast.EarthCrusher)
  end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- MIDCAST FUNCTION ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function midcast(spell)

  if spell.skill == "Elemental Magic" then

    if spell.name == "Impact" then
      equip(sets.midcast.Impact)
    else
      equip(sets.midcast.Nuke)
      if MagicBurstFlag == 1 then
        equip(sets.midcast.MagicBurst)
      end
      if buffactive["Klimaform"] then
        if (world.weather_element == spell.element and world.day_element == spell.element) then
            equip({feet=gear.Empy.feet})
        end
      end
    end
    if (world.weather_element == spell.element and world.day_element == spell.element) or (world.weather_element == spell.element and weather_intensity == 2) then
      equip(gear.Obi)
    elseif distance < 7 then
      equip(gear.Orpheus)
    elseif world.weather_element == spell.element or world.day_element == spell.element then
      equip(gear.Obi)
    end
    if Helix:contains(spell.name) then
      equip(sets.midcast.Helix)
      if distance < 10 then
        equip(gear.Orpheus)
      end
    end
    if buffactive['Ebullience'] then
      equip({head = gear.Empy.head})
    end
    if buffactive['Klimaform'] and spell.element == world.weather_element then
      equip({feet = gear.Empy.feet})
    end
    if spell.element == "Dark" then
      equip(sets.midcast.DarkAffinity)
    elseif spell.element == "Light" then
        equip(sets.midcast.LightAffinity)
    -- elseif spell.element == "Earth" then
    --     equip({neck="Quanpur Necklace"})
    end

  elseif spell.skill == "Dark Magic" then
    if DrainSpells:contains(spell.name) then
      equip(set_combine(sets.midcast.Nuke, sets.midcast.DrainAspir))
    elseif spell.name == "Stun" then
      equip(sets.midcast.Nuke)
    end

    if spell.element == "Dark" then
      equip(sets.midcast.DarkAffinity)
    end

    if (world.weather_element == spell.element and world.day_element == spell.element) or (world.weather_element == spell.element and weather_intensity == 2) then
      equip(gear.Obi)
    elseif distance < 7 then
      equip(gear.Orpheus)
    elseif world.weather_element == spell.element or world.day_element == spell.element then
      equip(gear.Obi)
    end

  elseif spell.skill == "Healing Magic" then
    if Cures:contains(spell.english) then
      equip(sets.midcast.Cures)
      if world.weather_element == spell.element or world.day_element == spell.element then
        equip(set_combine(gear.Obi, {main="Chatoyant Staff", sub="Achaq Grip"}))
      end
      if buffactive['Rapture'] then
        equip({head = gear.Empy.head})
      end
    end
    if spell.name == "Cursna" then
      equip(sets.midcast.Cursna)
    end

  elseif spell.skill == "Enfeebling Magic" then
    equip(set_combine(sets.midcast.Nuke, sets.midcast.Enfeeble))
    if INTfeeble:contains(spell.name) then
      equip({legs = gear.Chironic.legs.INTfeeble})
    elseif MNDfeeble:contains(spell.name) then
      equip({legs = gear.Chironic.legs.MNDfeeble})
    end

  elseif spell.skill == "Enhancing Magic" then
    equip(sets.midcast.EnhancingDuration)
    if EnhSkill:contains(spell.name) then
      equip(sets.midcast.EnhancingSkill)
    end
    if spell.name == "Stoneskin" then
      equip(sets.midcast.Stoneskin)
    elseif spell.name == "Aquaveil" then
      equip(sets.midcast.Aquaveil)
    elseif Regens:contains(spell.name) then
      equip(sets.midcast.Regen)
    end
    -- if Storms:contains(spell.name) then
    --   equip({feet = gear.Relic.feet})
    -- end
    if buffactive['Perpetuance'] then
      equip({hands = gear.Empy.hands})
    end
  end

  if TreasureHunterFlag == 1 then
    if Treasure:contains(spell.name) then
      equip(sets.midcast.Treasure)
    end
  end

end


function aftercast(spell)

  sublimation_up = buffactive['Sublimation: Activated'] or buffactive['Sublimation: Complete']
  if player.status == 'Idle' then
    if player.mpp < 70 then
      equip(sets.status.Idle.Refresh)
    else
      equip(sets.status.Idle.DT)
    end
    if spell.name == "Sublimation" then
      if not sublimation_up then
        equip(sets.status.Sublimation)
      end
    end
    if buffactive["Sublimation: Activated"] then
      equip(sets.status.Sublimation)
    end
--   if player.status == "Engaged" then
--     equip(sets.status.Melee)
--   end
  else
    equip(sets.status.Idle.DT)
  end
end

function status_change(new,old)
  deactivate_sublimation = buffactive['Sublimation: Activated'] or buffactive['Sublimation: Complete']
  if new == "Idle" then
    if player.mpp < 70  then
      equip(sets.status.Idle.Refresh)
    else
      equip(sets.status.Idle.DT)
    end
  end
  if buffactive["Sublimation: Activated"] then
    equip(sets.status.Sublimation)
--   if player.status == "Engaged" then
--     equip(sets.status.Melee)
--   end
  else
    equip(sets.status.Idle.DT)
  end
end
