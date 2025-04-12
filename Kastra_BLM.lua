include('organizer-lib')

function get_sets()


  maps()

  MagicBurstFlag     = 0
  MagicAccuracyFlag  = 0
  TreasureHunterFlag = 0
  OccultAcumenFlag   = 0


  send_command('bind f9 gs c toggle Magic Burst')
  send_command('bind f10 gs c Free Space')
  send_command('bind f11 gs c equip Criers')
  send_command('bind f12 gs c Equip DT')
  send_command('bind ^f9 gs c toggle Treasure Hunter')
  send_command('bind ^f10 gs c toggle Occult Acumen')
  send_command('bind ^f12 gs c Equip Idle')
  send_command('bind !f9 gs c Equip Bunzi')
  send_command('bind !f10 gs c Equip Marin')
  function file_unload()
    send_command('unbind f9')
    send_command('unbind f10')
    send_command('unbind !f9')
    send_command('unbind !f10')
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
    if OccultAcumenFlag == 0 then
      print('Occult Acumen:......OFF')
    elseif OccultAcumenFlag == 1 then
      print('Occult Acumen:.......ON')
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

    if command == 'toggle Occult Acumen' then
      if OccultAcumenFlag == 0 then
        OccultAcumenFlag = 1
        send_command('@input /echo Occult Acumen: ON')
      elseif OccultAcumenFlag == 1 then
        OccultAcumenFlag = 0
        send_command('@input /echo Occult Acumen: OFF')
      end
      check_param()
    end

    if command == 'Equip DT' then
      equip(sets.status.Idle.DT)
      send_command('@input /echo Damage Taken set equipped.')
    end
    if command == 'Equip Idle' then
      equip(sets.status.Idle.Refresh)
      send_command('@input /echo Refresh set equipped.')
    end


    if command == 'equip Criers' then
        equip(gear.Criers)
        send_command('@input /echo Crier\'s Gaiters Equipped.')
      end

    if command == 'Equip Bunzi' then
      equip({main="Bunzi's Rod",sub="Ammurapi Shield"})
      send_command('@input /echo Bunzi\'s Rod Equipped.')
    end
    if command == 'Equip Marin' then
        equip({main="Marin Staff +1",sub="Enki Strap"})
        send_command('@input /echo Marin Staff +1 equipped.')
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

  gear.Obi                           = { waist="Hachirin-no-Obi"}
  gear.Orpheus                       = { waist="Orpheus's Sash"}
  gear.Criers                        = { feet="Crier's Gaiters"}

  gear.AF = {}
  gear.AF.head                        = {}
  gear.AF.body                        = { name="Spaekona's Coat +3"}
  gear.AF.hands                       = {}
  gear.AF.legs                        = {}
  gear.AF.feet                        = { name="Spae. Sabots +3"}

  gear.Amalric = {}
  gear.Amalric.body                   = { name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}
  gear.Amalric.hands                  = { name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}
  gear.Amalric.legs                   = { name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}
  gear.Amalric.feet                   = { name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}

  gear.AmbuCape = {}
  gear.AmbuCape.Nuke                 = { name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}}
  gear.AmbuCape.FC                   = { name="Taranus's Cape", augments={'MP+60','"Fast Cast"+10',}}
  gear.AmbuCape.STP                  = { name="Taranus's Cape", augments={'"Store TP"+10',}}

  gear.Empy = {}
  gear.Empy.head                      = {}
  gear.Empy.body                      = { name="Wicce Coat +3",}
  gear.Empy.hands                     = {}
  gear.Empy.legs                      = { name="Wicce Chausses +2"}
  gear.Empy.feet                      = { name="Wicce Sabots +2"}

  gear.Grio = {}
  gear.Grio.Death                    = { name="Grioavolr", augments={'Enfb.mag. skill +8','MP+96','Mag. Acc.+29','"Mag.Atk.Bns."+25',}}

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
  gear.Relic.head                    = { name="Arch. Petasos +3", augments={'Increases Ancient Magic damage and magic burst damage',}}
  gear.Relic.body                    = { name="Arch. Coat +3", augments={'Enhances "Manafont" effect',}}
  gear.Relic.hands                   = { name="Arch. Gloves +3", augments={'Increases Elemental Magic accuracy',}}
  gear.Relic.legs                    = { name="Arch. Tonban +3", augments={'Increases Elemental Magic debuff time and potency',}}
  gear.Relic.feet                    = { name="Arch. Sabots +3", augments={'Increases Aspir absorption amount',}}

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
  sets.status.Idle.DT = {
    ammo="Staunch Tathlum +1",
    head="Null Masque",
    body = gear.Empy.body,
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Mallquis Clogs +2",
    neck="Warder's Charm +1",
    waist="Null Belt",
    left_ear="Etiolation Earring",
    right_ear="Sanare Earring",
    left_ring="Defending Ring",
    right_ring="Shadow Ring",
    back = gear.AmbuCape.Nuke,
  }
  sets.status.Idle.Refresh = {
    ammo="Staunch Tathlum +1",
    head="Null Masque",
    body = gear.Empy.body,
    hands="Volte Gloves",
    legs="Volte Brais",
    feet="Mallquis Clogs +2",
    neck="Loricate Torque +1",
    waist="Null Belt",
    left_ear="Etiolation Earring",
    right_ear="Lugalbanda Earring",
    left_ring={name="Stikini Ring +1",bag="wardrobe",priority=1},
    right_ring={name="Stikini Ring +1",bag="wardrobe2",priority=2},
    back = gear.AmbuCape.Nuke,
  }
  sets.status.Melee = {
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear="Mache Earring +1",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back = gear.AmbuCape.Nuke,
  }
  sets.status.Sublimation = {
    waist="Embla Sash",
  }

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- PRECAST SETS -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


  sets.precast = {}
  sets.precast.FastCast = {
  -- 83% Fast Cast, 6% Quick Cast
    ammo="Impatiens",
    head = gear.Merlinic.head.FC,
    body="Agwu's Robe",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Volte Brais",
    feet = gear.Merlinic.feet.FC,
    neck="Orunmila's Torque",
    waist="Embla Sash",
    left_ear="Loquac. Earring",
    right_ear="Malignance Earring",
    left_ring="Weather. Ring +1",
    right_ring="Kishar Ring",
    back = gear.AmbuCape.FC
  }

  sets.precast.Impact = {
    ammo="Impatiens",
    head="Empty",
    body="Crepuscular Cloak",
    hands="Volte Gloves",
    legs="Volte Brais",
    feet = gear.Merlinic.feet.FC,
    neck="Orunmila's Torque",
    waist="Embla Sash",
    left_ear="Etiolation Earring",
    right_ear="Malignance Earring",
    left_ring="Weather. Ring +1",
    right_ring="Kishar Ring",
    back = gear.AmbuCape.FC
  }
  sets.precast.Manafont = {body = gear.Relic.body,}

	sets.precast.Myrkr = {
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Pixie Hairpin +1",
    body = gear.Amalric.body,
    hands="Agwu's Gages",
    legs = gear.Amalric.legs,
    feet = gear.Amalric.feet,
    neck="Sanctity Necklace",
    waist="Fucho-no-Obi",
    left_ear="Etiolation Earring",
    right_ear="Evans Earring",
    left_ring="Metamorph Ring +1",
    right_ring="Lebeche Ring",
    back = gear.AmbuCape.FC,
  }
	sets.precast.Cataclysm = {
	ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Archon Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back = gear.AmbuCape.Nuke,
  }



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- MIDCAST SETS -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


  sets.midcast = {}

  sets.midcast.Cures = {
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
    right_ring="Ephedra Ring",
  }
  sets.midcast.Nuke = {
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Agwu's Cap",
    body={ name="Agwu's Robe", augments={'Path: A',}},
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Sorcerer's Stole +1",
    waist="Sacro Cord",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Freke Ring",
    back = gear.AmbuCape.Nuke,
  }
  sets.midcast.OccultAcumen = {
    -- 929 TP return on Thunder6
    ammo="Seraphic Ampulla",
    head="Mall. Chapeau +2",
    body={ name="Merlinic Jubbah", augments={'"Mag.Atk.Bns."+6','"Occult Acumen"+11','CHR+4',}},
    hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+19','"Occult Acumen"+11','INT+5','Mag. Acc.+13',}},
    legs="Perdition Slops",
    feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+1','"Occult Acumen"+11','Mag. Acc.+14',}},
    neck="Combatant's Torque",
    waist="Oneiros Rope",
    left_ear="Telos Earring",
    right_ear="Dedition Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back = gear.AmbuCape.STP,
  }
  sets.midcast.MagicAccuracy = {
    head = gear.Relic.head,
    body = gear.Relic.body,
    hands = gear.Relic.hands,
    legs = gear.Relic.legs,
    feet = gear.Relic.feet,
    neck={ name="Src. Stole +1", augments={'Path: A',}},
    waist="Sacro Cord",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back = gear.AmbuCape.Nuke,
  }
  sets.midcast.MagicBurst = {
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Ea Hat +1",
    body = gear.Empy.body,
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Ea Slops +1",
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Sorcerer's Stole +1",
    waist="Sacro Cord",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Freke Ring",
    back = gear.AmbuCape.Nuke,
  }
  sets.midcast.DarkAffinity = {
    head="Pixie Hairpin +1",
    left_ring="Archon Ring",
  }
  sets.midcast.Burn = {
    head = gear.Relic.head,
    body = gear.Relic.body,
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Agwu's Slops",
    feet = gear.Relic.feet,
    neck={ name="Src. Stole +1", augments={'Path: A',}},
    waist="Sacro Cord",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Weather. Ring +1",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back = gear.AmbuCape.Nuke,
  }

  sets.midcast.Enfeeble = {
    ammo="Pemphredo Tathlum",
    head = gear.Relic.head,
    body = gear.AF.body,
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck={ name="Src. Stole +1", augments={'Path: A',}},
    waist="Sacro Cord",
    left_ear="Crep. Earring",
    right_ear="Malignance Earring",
    left_ring="Weather. Ring +1",
    right_ring="Kishar Ring",
    back = gear.AmbuCape.Nuke,
  }

  sets.midcast.Enhancing = {
    head = gear.Telchine.head,
    body = gear.Telchine.body,
    hands = gear.Telchine.hands,
    legs = gear.Telchine.legs,
    feet = gear.Telchine.feet,
    neck="Incanter's Torque",
    waist="Embla Sash",
  }

  sets.midcast.Death = {
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Pixie Hairpin +1",
    body = gear.Amalric.body,
    hands = gear.Amalric.hands,
    legs = gear.Amalric.legs,
    feet = gear.Amalric.feet,
    neck={ name="Src. Stole +1", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear="Barkaro. Earring",
    left_ring="Archon Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back = gear.AmbuCape.FC,
  }
  sets.midcast.Impact = {
    ammo="Pemphredo Tathlum",
    head="Empty",
    body="Crepuscular Cloak",
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet = gear.Relic.feet,
    neck={ name="Src. Stole +1", augments={'Path: A',}},
    waist="Sacro Cord",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Weather. Ring +1",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
  }

  sets.midcast.DrainAspir = {
    head="Pixie Hairpin +1",
    body="Agwu's Robe",
    hands = gear.Merlinic.hands.DrainAspir,
    feet={ name="Agwu's Pigaches", augments={'Path: A',}},
    neck="Erra Pendant",
    waist="Fucho-no-Obi",
    left_ring="Archon Ring",
    right_ring="Evanescence Ring",
  }
  sets.midcast.Stoneskin = {
    neck="Nodens Gorget",
    waist="Siegel Sash",
  }
  sets.midcast.Treasure = {
    ammo="Perfect Lucky Egg", -- +1
    head="Wh. Rarab Cap +1",  -- +1
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
  DoTs           = S {"Rasp", "Drown", "Choke", "Burn", "Frost", "Shock"}
  EraseNas       = S {"Paralyna", "Stona", "Poisona", "Blindna", "Viruna", "Silena", "Cursna", "Erase"}
  DrainSpells    = S {"Drain", "Aspir", "Aspir II", "Aspir III"}
  Storms         = S {"Sandstorm", "Windstorm", "Hailstorm", "Firestorm", "Rainstorm", "Thunderstorm", "Aurorastorm", "Voidstorm"}
  Treasure       = S {"Dia", "Dia II", "Bio", "Bio II"}
  Ancients       = S {"Quake", "Quake II", "Flood", "Flood II", "Tornado", "Tornado II", "Flare", "Flare II", "Freeze", "Freeze II", "Burst", "Burst II"}
  OccultAcumen   = S {"Stoneja", "Waterja", "Aeroja", "Firaja", "Blizzaja", "Thundaja", "Aero VI", "Blizzard VI", "Thunder VI", "Thunder V", "Thundaga III"}
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

  if spell.name == "Impact" then
    equip(sets.precast[spell.name])
  elseif spell.name == "Manafont" then
    equip(sets.precast.Manafont)
  elseif spell.skill == "Healing Magic" then
    equip(set_combine(sets.precast.FastCast, sets.precast.Cures))
  else
    equip(sets.precast.FastCast)
  end

  if spell.name == "Mana Wall" then
    equip({feet = gear.Empy.Feet})
  end

  if spell.name == "Vidohunir" then
    equip(sets.midcast.MagicAccuracy)
  elseif spell.name == "Myrkr" then
    equip(sets.precast.Myrkr)
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
      if MagicBurstFlag == 1 then
        equip(sets.midcast.MagicBurst)
      else
        equip(sets.midcast.Nuke)
      end
      if AoE:contains(spell.name) then
        equip({body=gear.AF.body})
      end
      if DoTs:contains(spell.name) then
        equip(sets.midcast.Burn)
      end
    end

    if (world.weather_element == spell.element and world.day_element == spell.element) or (world.weather_element == spell.element and weather_intensity == 2) then
      equip(gear.Obi)
    elseif distance < 7 then
      equip(gear.Orpheus)
    elseif world.weather_element == spell.element or world.day_element == spell.element then
      equip(gear.Obi)
    end
    if spell.element == "Earth" then
      equip({neck="Quanpur Necklace"})
    end

    if OccultAcumenFlag == 1 then
      if OccultAcumen:contains(spell.name) then
        equip(sets.midcast.OccultAcumen)
        if AoE:contains(spell.name) then
          equip({body=gear.AF.body})
        end
      end
    end

  elseif spell.skill == "Dark Magic" then
    if DrainSpells:contains(spell.name) then
      equip(set_combine(sets.midcast.MagicAccuracy, sets.midcast.DrainAspir))
    elseif spell.name == "Death" then
      equip(sets.midcast.Death)
    elseif spell.name == "Stun" then
      equip(sets.midcast.MagicAccuracy)
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
        equip(gear.Obi)
      end
    end

  elseif spell.skill == "Enfeebling Magic" then
    equip(set_combine(sets.midcast.MagicAccuracy, sets.midcast.Enfeeble))

  elseif spell.skill == "Enhancing Magic" then
    equip(sets.midcast.Enhancing)
    if spell.name == "Stoneskin" then
      equip(sets.midcast.Stoneskin)
    end
  end

  if spell.name == "Mana Wall" then
    equip({feet = gear.Empy.Feet})
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
        equip(sets.status.Idle.DT)
    else
      equip(sets.status.Idle.DT)
    end
    -- if spell.name == "Sublimation" then
    --   if not sublimation_up then
    --     equip(sets.status.Sublimation)
    --   end
    -- end
    -- if buffactive["Sublimation: Activated"] then
    --   equip(sets.status.Sublimation)
    -- end
    if spell.name == "Mana Wall" or buffactive["Mana Wall"] then
      equip({feet = gear.Empy.feet})
    end
  end
end

function status_change(new,old)
  deactivate_sublimation = buffactive['Sublimation: Activated'] or buffactive['Sublimation: Complete']
  if new == "Idle" then
    if player.mpp < 50  then
        equip(sets.status.Idle.DT)
    else
      equip(sets.status.Idle.DT)
    end
  end
  if new == "Idle" then
    if player.mpp < 50  then
      equip(sets.status.Idle.Refresh)
    else
      equip(sets.status.Idle.DT)
    end
  end
--   if buffactive["Sublimation: Activated"] then
--     equip(sets.status.Sublimation)
--   end
  if buffactive["Mana Wall"] then
    equip({feet = gear.Empy.feet})
  end
end
