include('organizer-lib')

function get_sets()

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ----------- TOGGLES ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  MagicBurstFlag     = 0
  TPFlag             = 0
  HasteFlag          = 0
  -- ! == alt
  -- ^ == ctrl
  --
  send_command('bind f9 gs c cycle TP mode')
  send_command('bind f10 gs c Free')
  send_command('bind f11 gs c Equip Movement')
  send_command('bind f12 gs c Equip DT')

  send_command('bind ^f9 gs c Equip Treasure Hunter')
  send_command('bind ^f11 gs c Free')
  send_command('bind ^f12 gs c Free')
  send_command('bind ^f10 gs c Free')

  send_command('bind !f9 gs c Equip Apocalypse')
  send_command('bind !f10 gs c Equip Liberator')
  send_command('bind !f11 gs c Equip Anguta')
  send_command('bind !f12 gs c Free')
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

  end
  function self_command(command)
    function check_param()
        print('-------------------------')
        if TPFlag == 0 then
          print('TP Mode:............Default')
        elseif TPFlag == 1 then
          print('TP Mode:............Hybrid')
        end
        print('-------------------------')
    end

    if command == 'cycle TP mode' then
      if TPFlag == 0 then
        TPFlag = 1
        send_command('@input /echo TP mode: Hybrid')
      elseif TPFlag == 1 then
        TPFlag = 0
        send_command('@input /echo TP mode: Default')
      end
      check_param()
    end
    if command == 'Equip Treasure Hunter' then
      equip(sets.Treasure)
      send_command('@input /echo Treasure Hunter +4 Equipped')
    end

    if command == 'Equip DT' then
      equip(sets.status.Idle.DT)
      send_command('@input /echo Damage Taken set equipped.')
    end
    if command == 'Equip Apocalypse' then
      equip({main = "Apocalypse", sub="Utu Grip"})
      send_command('@input /echo Apocalypse Equipped.')
      -- send_command('@input /lockstyleset 11')
    end
    if command == 'Equip Liberator' then
      equip({main = "Liberator", sub="Utu Grip"})
      send_command('@input /echo Liberator Equipped.')
      -- send_command('@input /lockstyleset 12')
    end
    if command == 'Equip Anguta' then
      equip({main = "Anguta", sub="Utu Grip"})
      send_command('@input /echo Anguta Equipped.')
      -- send_command('@input /lockstyleset 11')
    end

    if command == 'Equip Movement' then
      equip(gear.Carmine.legs)
      send_command('@input /echo Carmine Cuisses +1 equipped.')
    end

  end


  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ----------- AUGMENTED/SPECIAL GEAR ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    gear = {}
    gear.Moonshade                     = { name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}}
    gear.Obi                           = { waist="Hachirin-no-Obi"}

    gear.Carmine = {}
    gear.Carmine.head                  = { name="Carmine Mask"}
    gear.Carmine.legs                  = { legs="Carmine Cuisses +1"}
    gear.Carmine.feet                  = { name="Carmine Greaves"}

    gear.Empy = {}
    gear.Empy.head                     = {}
    gear.Empy.body                     = { name="Heath. Cuirass +1",}
    gear.Empy.hands                    = { name="Heath. Gauntlets +1"}
    gear.Empy.legs                     = { name="Heath. Flanchard +1"}
    gear.Empy.feet                     = {}


    gear.AmbuCape = {}
    gear.AmbuCape.TP                   = { name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}}
    gear.AmbuCape.WSDstr               = { name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
    gear.AmbuCape.WSDacc               = { name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%',}}
    gear.AmbuCape.FC                   = { name="Ankou's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','"Fast Cast"+10',}}

    gear.AF = {}
    gear.AF.head                       = {}
    gear.AF.body                       = { name="Ignominy Cuirass +3"}
    gear.AF.hands                      = { name="Ig. Gauntlets +2"}
    gear.AF.legs                       = {}
    gear.AF.feet                       = {}

    gear.ReiveCape                     = { name="Niht Mantle", augments={'Attack+5','Dark magic skill +10','"Drain" and "Aspir" potency +25',}}

    gear.Relic = {}
    gear.Relic.head                    = { name="Fall. Burgeonet +3", augments={'Enhances "Dark Seal" effect',}}
    gear.Relic.body                    = { name="Fall. Cuirass +1", augments={'Enhances "Blood Weapon" effect',}}
    gear.Relic.hands                   = { name="Fall. Fin. Gaunt. +3", augments={'Enhances "Diabolic Eye" effect',}}
    gear.Relic.legs                    = { name="Fall. Flanchard +3", augments={'Enhances "Muted Soul" effect',}}
    gear.Relic.feet                    = {}


  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ----- STATUS SETS --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  sets.items = {}
  sets.items.HolyWater = {
    neck="Nicander's Necklace",
    right_ring="Purity Ring",
  }

  sets.status = {}
  sets.status.Idle = {}
  sets.status.Idle.DT = {
    ammo="Staunch Tathlum +1",
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
    back="Shadow Mantle"
  }

  sets.status.Melee = {}
  sets.status.Melee.Standard = {
    ammo="Coiste Bodhar",
    head="Sakpata's Helm",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck="Abyssal Beads +1",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Schere Earring",
    right_ear="Telos Earring",
    left_ring="Flamma Ring",
    right_ring="Niqmaddu Ring",
    -- left_ring="Chirich Ring +1",
    back = gear.AmbuCape.TP,
  }
  sets.status.Melee.AM3 = {
    ammo="Coiste Bodhar",
    head="Flam. Zucchetto +2",
    body="Flamma Korazin +2",
    hands="Sakpata's Gauntlets",
    legs={ name="Odyssean Cuisses", augments={'Accuracy+28','"Store TP"+5','AGI+8','Attack+7',}},
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +1",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Schere Earring",
    left_ring="Flamma Ring",
    right_ring="Niqmaddu Ring",
    back = gear.AmbuCape.TP,
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
    -- 64% Fast Cast
    -- Relic+3 Body or Alexander Body is +10%
    -- limbus+1 legs are +8%
    -- zitah legs are +5%
    ammo="Sapience Orb",
    head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
    body="Sacro Breastplate",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    feet={ name="Odyssean Greaves", augments={'"Fast Cast"+4','MND+8','"Mag.Atk.Bns."+6',}},
    neck="Orunmila's Torque",
    left_ear="Malignance Earring",
    right_ear="Loquac. Earring",
    left_ring="Weather. Ring +1",
    right_ring="Kishar Ring",
    back = gear.AmbuCape.FC,
}

  sets.precast['Blood Weapon'] = {body = gear.Relic.body}
  sets.precast.WeaponBash = {
    hands = gear.AF.hands,
  }
  sets.precast.Provoke = {
    ammo="Staunch Tathlum +1",
    head="Versa Celata",
    body="Emet Harness +1",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Zoar Subligar +1",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Unmoving Collar +1",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Friomisi Earring",
    right_ear="Cryptic Earring",
    left_ring="Eihwaz Ring",
    right_ring="Petrov Ring",
    back="Shadow Mantle",
  }

  sets.WeaponSkill = {}
  sets.WeaponSkill["Insurgency"] = {
    ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: A',}},
    body = gear.AF.body,
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Nyame Flanchard",
    feet="Rat. Sollerets +1",
    neck={ name="Abyssal Beads +1", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear = gear.Moonshade,
    right_ear="Thrud Earring",
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back = gear.AmbuCape.WSDacc,
  }
  sets.WeaponSkill["Catastrophe"] = {
    ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: A',}},
    body = gear.AF.body,
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Rat. Sollerets +1",
    neck={ name="Abyssal Beads +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Lugra Earring +1", augments={'Path: A',}},
    right_ear="Thrud Earring",
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back = gear.AmbuCape.WSDacc,
  }
  sets.WeaponSkill["Entropy"] = {
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body="Sakpata's Plate",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet="Sakpata's Leggings",
    neck={ name="Abyssal Beads +1", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Niqmaddu Ring",
    back = gear.AmbuCape.WSDacc,
  }
  sets.WeaponSkill["Shadow of Death"] = {
    ammo="Knobkierrie",
    head="Pixie Hairpin +1",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Friomisi Earring",
    left_ring="Archon Ring",
    right_ring="Metamorph Ring +1",
    back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%',}},
  }
  sets.WeaponSkill["Dark Harvest"] = sets.WeaponSkill["Shadow of Death"]
  sets.WeaponSkill["Infernal Scythe"] = sets.WeaponSkill["Shadow of Death"]
  sets.WeaponSkill.test = sets.WeaponSkill["Shadow of Death"]
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ----- MIDCAST SETS -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


  sets.midcast = {}

  sets.midcast.Drains = {
    ranged="Ullr",
    -- ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands = gear.Relic.hands,
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Rat. Sollerets +1",
    neck="Erra Pendant",
    waist="Orpheus's Sash",
    left_ear="Hirudinea Earring",
    right_ear="Static Earring",
    left_ring="Evanescence Ring",
    right_ring="Archon Ring",
    back = gear.ReiveCape,
  }
  sets.midcast.Absorbs = {
    -- head="Pixie Hairpin +1",
    hands="Pavor Gauntlets", -- +10% Potency
    feet="Rat. Sollerets +1",
    neck="Erra Pendant",
    -- left_ring="Archon Ring",
    right_ring="Kishar Ring",
    back="Chuparrosa Mantle", -- +20s and +10% Potency
  }
  sets.midcast.MagicAccuracy = {
    ammo="Pemphredo Tathlum",
    head="Flam. Zucchetto +2",
    body="Flamma Korazin +2",
    hands="Flam. Manopolas +2",
    legs="Flamma Dirs +2",
    feet="Rat. Sollerets +1",
    neck="Erra Pendant",
    waist="Eschan Stone",
    left_ear="Malignance Earring",
    right_ear="Crep. Earring",
    left_ring="Weather. Ring +1",
    right_ring="Kishar Ring",
    back = gear.ReiveCape,
  }
  sets.midcast['Dread Spikes'] = {
    -- stack Dread spikes+ and HP gear
    -- Ratri +1 and Moonlight cape/ring are best, but super expensive
    head = gear.Relic.head,
    body="Heath. Cuirass +1",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Rat. Sollerets +1",
    neck="Sanctity Necklace",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Regal Ring",
    right_ring="Eihwaz Ring",
    back='Reiki Cloak',
  }
  sets.midcast.Endark = {
    -- Stack Dark magic skill. 1:1 damage dealt into attack bonus. scales with Dark skill
    hands = gear.Relic.hands,
    legs = gear.Empy.legs,
    feet="Rat. Sollerets +1",
    neck="Erra Pendant",
    left_ring="Evanescence Ring",
    back = gear.ReiveCape,

  }
  sets.midcast.Nuke = {
    ammo="Ghastly Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Crematio Earring",
    left_ring="Metamorph Ring +1",
    right_ring="Shiva Ring +1",
    back = gear.AmbuCape.Nuke,
  }



end -- End of sets function



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- PRECAST FUNCTION ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


function precast(spell)

  self = windower.ffxi.get_mob_by_target('me')
  target = windower.ffxi.get_mob_by_target('t') or windower.ffxi.get_mob_by_target('st') or self
  distance = math.sqrt((self.x - target.x)^2 + (self.y - target.y)^2)
  weather_intensity = gearswap.res.weather[world.weather_id].intensity

  if sets.WeaponSkill[spell.name] then
      equip(sets.WeaponSkill[spell.name])
  end
  if spell.name == "Provoke" then
    equip(sets.precast.Provoke)
  elseif sets.precast[spell.name] then
    equip(sets[spell.name])
  end

  if spell.type=="WeaponSkill" then
    if sets.WeaponSkill[spell.name] then
      equip(sets.WeaponSkill[spell.name])
    else
      equip(sets.WeaponSkill['Insurgency'])
    end
  elseif spell.name == "Holy Water" then
    equip(set_combine(sets.status.Idle.DT,sets.items.HolyWater))
  elseif spell.name == "Weapon Bash" then
    equip(sets.precast.WeaponBash)
  else
    equip(sets.precast.FastCast)
  end


end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- MIDCAST FUNCTION ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function midcast(spell)


  if spell.name:contains("Absorb") then
    equip(set_combine(sets.midcast.MagicAccuracy, sets.midcast.Absorbs))
  end
  if spell.name == "Absorb-Attri" then
    equip(sets.midcast.MagicAccuracy)
  end
  if spell.name == "Absorb-TP" then
    equip({hands = gear.Empy.hands})
  elseif string.find(spell.name, "Drain") then
    equip(sets.midcast.Drains)
  elseif spell.name == "Dread Spikes" then
    equip(sets.midcast['Dread Spikes'])
    -- send_command("timers create Trials 840 down")
  elseif spell.name == "Endark II" then
    equip(sets.midcast.Endark)
  end
  if spell.skill == "Enfeebling Magic" then
    equip(sets.midcast.MagicAccuracy)
  end
  if spell.skill == "Elemental Magic" then
    equip(sets.midcast.Nuke)
  end
  if spell.skill == "Dark Magic" then
    equip({feet="Rat. Sollerets +1",})
  end
  if buffactive['Nether Void'] and spell.skill == "Dark Magic" then
    equip({legs = gear.Empy.legs})
  end
  if buffactive['Dark Seal'] and spell.skill == "Dark Magic" then
    equip({head = gear.Relic.head})
  end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- AFTERCAST FUNCTION -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function aftercast(spell)
  if player.status == "Idle" then
    equip(sets.status.Idle.DT)
  elseif player.status == "Engaged" then
    if TPFlag == 1 then
      equip(sets.status.Melee.Standard)
    elseif buffactive['Aftermath: Lv.3'] then
      equip(sets.status.Melee.AM3)
    else
      equip(sets.status.Melee.Standard)
    end
  end
end

function status_change(new,old)

  if new == "Idle" then
    equip(sets.status.Idle.DT)
  elseif player.status == "Engaged" then
    if TPFlag == 1 then
      equip(sets.status.Melee.Standard)
    elseif buffactive['Aftermath: Lv.3'] then
      equip(sets.status.Melee.AM3)
    else
      equip(sets.status.Melee.Standard)
    end
  elseif sets.status[new] then
    equip(sets.status[new])
  end

end
