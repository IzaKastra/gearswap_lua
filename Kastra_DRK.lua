include('organizer-lib')

function get_sets()

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ----------- TOGGLES ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  TPFlag             = 0
  attack2            = 6000 -- Attack with "high" buffs in TP set. Scythe has very high pdif (4.5 without crit, 5.5 with crit before gear
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
  send_command('bind !f11 gs c Equip Redemption')
  send_command('bind !f12 gs c Equip Anguta')
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
          print('TP Mode:..........Default')
        elseif TPFlag == 1 then
          print('TP Mode:...........Hybrid')
        elseif TPFlag == 2 then
          print('TP Mode:.......SubtleBlow')
        end
        print('-------------------------')
    end

    if command == 'cycle TP mode' then
      if TPFlag == 0 then
        TPFlag = 1
        send_command('@input /echo TP mode: Hybrid')
      elseif TPFlag == 1 then
        TPFlag = 2
        send_command('@input /echo TP mode: Subtle Blow')
      elseif TPFlag == 2 then
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
    if command == 'Equip Redemption' then
      equip({main = "Redemption", sub="Utu Grip"})
      send_command('@input /echo Redemption Equipped.')
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
    gear.Orpheus                       = { waist="Orpheus's Sash"}

    gear.Carmine = {}
    gear.Carmine.head                  = { name="Carmine Mask"}
    gear.Carmine.legs                  = { legs="Carmine Cuisses +1"}

    gear.Empy = {}
    gear.Empy.head                     = { name="Heath. Bur. +3"}
    gear.Empy.body                     = { name="Heath. Cuirass +2"}
    gear.Empy.hands                    = { name="Heath. Gauntlets +2"}
    gear.Empy.legs                     = { name="Heath. Flanchard +2"}
    gear.Empy.feet                     = { name="Heath. Sollerets +3"}


    gear.AmbuCape = {}
    gear.AmbuCape.STP                   = { name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}}
    gear.AmbuCape.DAstr                 = { name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}}
    gear.AmbuCape.WSDstr                = { name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%',}}
    gear.AmbuCape.FC                    = { name="Ankou's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','"Fast Cast"+10',}}

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
    body="Sakpata's Plate",
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
    back = gear.AmbuCape.STP,
  }
  sets.status.Melee.Liberator_AM3 = {
    ammo="Coiste Bodhar",
    head="Flam. Zucchetto +2",
    body="Flamma Korazin +2",
    body="Hjarrandi Breast.",
    hands="Sakpata's Gauntlets",
    legs={ name="Odyssean Cuisses", augments={'Accuracy+28','"Store TP"+5','AGI+8','Attack+7',}},
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +1",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Telos Earring",
    right_ear="Dedition Earring",
    left_ring="Flamma Ring",
    right_ring="Niqmaddu Ring",
    back = gear.AmbuCape.STP,
  }
  sets.status.Melee.Redemption_AM3 = {
    ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head="Sakpata's Helm",
    body="Hjarrandi Breast.",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck="Abyssal Beads +1",
    waist="Ioskeha Belt +1",
    left_ear="Schere Earring",
    right_ear="Brutal Earring",
    left_ring="Flamma Ring",
    right_ring="Niqmaddu Ring",
    back = gear.AmbuCape.DAstr,
  }
  sets.status.Melee.SubtleBlow = {
    ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
    head={ name="Sakpata's Helm", augments={'Path: A',}},
    body="Dagon Breast.",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    neck={ name="Abyssal Beads +1", augments={'Path: A',}},
    waist="Ioskeha Belt +1",
    left_ear="Schere Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Niqmaddu Ring",
    back = gear.AmbuCape.STP,
  }
  sets.status.Melee.Hybrid = {
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
    left_ring="Defending Ring",
    right_ring="Niqmaddu Ring",
    back = gear.AmbuCape.STP,
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
    -- 75% Fast Cast
    ammo="Sapience Orb",
    head = gear.Carmine.head,
    body="Sacro Breastplate",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Eschite Cuisses",
    feet={ name="Odyssean Greaves", augments={'"Fast Cast"+4','MND+8','"Mag.Atk.Bns."+6',}},
    neck="Orunmila's Torque",
    left_ear="Malignance Earring",
    right_ear="Loquac. Earring",
    left_ring="Weather. Ring +1",
    right_ring="Kishar Ring",
    back = gear.AmbuCape.FC,
}
  sets.precast.Impact = {
    ammo="Sapience Orb",
    body="Crepuscular Cloak",
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
  sets.precast['Weapon Bash'] = {
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
    sets.WeaponSkill.MidAtk = {} -- Assumed not capped attack
    sets.WeaponSkill.HighAtk = {} -- Assumed capped attack (6000+ attack in TP set)
    
    sets.WeaponSkill.MidAtk["Insurgency"] = {
    ammo="Knobkierrie",
    head = gear.Empy.head,
    body = gear.AF.body,
    -- body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet = gear.Empy.feet,
    neck={ name="Abyssal Beads +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear = gear.Moonshade,
    right_ear="Thrud Earring",
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back = gear.AmbuCape.DAstr,
  }
  sets.WeaponSkill.HighAtk["Insurgency"] = {
    ammo="Knobkierrie",
    head = gear.Empy.head,
    body={ name="Sakpata's Plate", augments={'Path: A',}},
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs="Sakpata's Cuisses",
    feet = gear.Empy.feet,
    neck={ name="Abyssal Beads +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Sroda Ring",
    right_ring="Niqmaddu Ring",
    back = gear.AmbuCape.DAstr,
}

sets.WeaponSkill.MidAtk["Cross Reaper"] = {
    ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: A',}},
    body = gear.AF.body,
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Nyame Flanchard",
    feet = gear.Empy.feet,
    neck={ name="Abyssal Beads +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear = gear.Moonshade,
    right_ear="Thrud Earring",
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back = gear.AmbuCape.WSDstr,
  }
  sets.WeaponSkill.HighAtk["Cross Reaper"] = {
    ammo="Knobkierrie",
    head = gear.Empy.head,
    body="Sakpata's Plate",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Nyame Flanchard",
    feet = gear.Empy.feet,
    neck={ name="Abyssal Beads +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear = gear.Moonshade,
    right_ear="Thrud Earring",
    left_ring="Sroda Ring",
    right_ring="Niqmaddu Ring",
    back = gear.AmbuCape.WSDstr,
  }

  sets.WeaponSkill.MidAtk["Quietus"] = {
    ammo="Knobkierrie",
    head = gear.Empy.head,
    body="Nyame Mail",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet = gear.Empy.feet,
    neck={ name="Abyssal Beads +1", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Schere Earring",
    right_ear="Thrud Earring",
    left_ring="Sroda Ring",
    right_ring="Niqmaddu Ring",
    back = gear.AmbuCape.WSDstr,
  }
  sets.WeaponSkill.HighAtk["Quietus"] = {
    ammo="Knobkierrie",
    head = gear.Empy.head,
    body="Nyame Mail",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet = gear.Empy.feet,
    neck={ name="Abyssal Beads +1", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Schere Earring",
    right_ear="Thrud Earring",
    left_ring="Sroda Ring",
    right_ring="Niqmaddu Ring",
    back = gear.AmbuCape.WSDstr,
  }

  sets.WeaponSkill.MidAtk["Catastrophe"] = {
    ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: A',}},
    body = gear.AF.body,
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet = gear.Empy.feet,
    neck={ name="Abyssal Beads +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Schere Earring",
    right_ear="Thrud Earring",
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back = gear.AmbuCape.WSDstr,
  }
  sets.WeaponSkill.HighAtk["Catastrophe"] = {
    ammo="Knobkierrie",
    head = gear.Empy.head,
    body = gear.AF.body,
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet = gear.Empy.feet,
    neck={ name="Abyssal Beads +1", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear="Lugra Earring +1",
    right_ear="Thrud Earring",
    left_ring="Sroda Ring",
    right_ring="Niqmaddu Ring",
    back = gear.AmbuCape.WSDstr,
  }

  sets.WeaponSkill.MidAtk["Entropy"] = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Heath. Bur. +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Schere Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Niqmaddu Ring",
    back = gear.AmbuCape.DAstr,
  }
  sets.WeaponSkill.HighAtk["Entropy"] = {
    ammo="Crepuscular Pebble",
    head = gear.Empy.head,
    body="Sakpata's Plate",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Abyssal Beads +1", augments={'Path: A',}},
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    right_ear={ name="Lugra Earring +1", augments={'Path: A',}},
    left_ring="Sroda Ring",
    right_ring="Niqmaddu Ring",
    back = gear.AmbuCape.DAstr,
  }

  sets.WeaponSkill.MidAtk["Spiral Hell"] = {
    ammo="Knobkierrie",
    head = gear.Empy.head,
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet = gear.Empy.feet,
    neck="Fotia Gorget",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back = gear.AmbuCape.WSDstr,
  }
  sets.WeaponSkill.HighAtk["Spiral Hell"] = {
    ammo="Knobkierrie",
    head = gear.Empy.head,
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet = gear.Empy.feet,
    neck={ name="Abyssal Beads +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Sroda Ring",
    right_ring="Niqmaddu Ring",
    back = gear.AmbuCape.WSDstr,
  }

  sets.WeaponSkill.MidAtk["Guillotine"] = { -- Stack Magic Accuracy to land Silence and TP Bonus to enhance duration. Nothing else matters.
    ammo="Pemphredo Tathlum",
    head = gear.Empy.head,
    body = gear.Empy.body,
    hands = gear.Empy.hands,
    legs = gear.Empy.legs,
    feet = gear.Empy.feet,
    neck="Erra Pendant",
    waist="Eschan Stone",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Crepuscular Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Weather. Ring +1",
    back = gear.AmbuCape.DAstr,
  }
  sets.WeaponSkill.HighAtk["Guillotine"] = sets.WeaponSkill.MidAtk["Guillotine"] 


  sets.WeaponSkill.MidAtk["Shadow of Death"] = {
    ammo={ name="Seeth. Bomblet +1", augments={'Path: A',}},
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
    right_ring="Shiva Ring +1",
    back = gear.AmbuCape.WSDstr,
  }
  sets.WeaponSkill.HighAtk["Shadow of Death"] = sets.WeaponSkill.MidAtk["Shadow of Death"] 

  sets.WeaponSkill.MidAtk["Dark Harvest"] = sets.WeaponSkill.MidAtk["Shadow of Death"]
  sets.WeaponSkill.HighAtk["Dark Harvest"] = sets.WeaponSkill.HighAtk["Shadow of Death"]

  sets.WeaponSkill.MidAtk["Infernal Scythe"] = set_combine(sets.WeaponSkill.MidAtk["Guillotine"], {ear1="Dignitary's Earring"}) -- Stack magic accuracy to land Attack Down.
  sets.WeaponSkill.HighAtk["Infernal Scythe"] = set_combine(sets.WeaponSkill.HighAtk["Guillotine"], {ear1="Dignitary's Earring"}) -- Stack magic accuracy to land Attack Down.


  sets.WeaponSkill.MidAtk["Spinning Scythe"] = {
    ammo="Knobkierrie",
    head = gear.Empy.head,
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet = gear.Empy.feet,
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Schere Earring",
    right_ear="Thrud Earring",
    left_ring="Regal Ring",
    right_ring="Niqmaddu Ring",
    back = gear.AmbuCape.WSDstr,
  }
  sets.WeaponSkill.HighAtk["Spinning Scythe"] = sets.WeaponSkill.MidAtk["Spinning Scythe"] 

  sets.WeaponSkill.test = sets.WeaponSkill["Shadow of Death"]


  sets.WeaponSkill.MidAtk["Judgment"] = {
    ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet = gear.Empy.feet,
    neck={ name="Abyssal Beads +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Sroda Ring",
    right_ring="Regal Ring",
    back = gear.AmbuCape.WSDstr,
  }
  sets.WeaponSkill.HighAtk["Judgment"] = {
    ammo="Knobkierrie",
    head = gear.Empy.head,
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet = gear.Empy.feet,
    neck={ name="Abyssal Beads +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Sroda Ring",
    right_ring="Regal Ring",
    back = gear.AmbuCape.WSDstr,
  }

  sets.WeaponSkill.MidAtk["Savage Blade"] = {
    ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet = gear.Empy.feet,
    neck={ name="Abyssal Beads +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Sroda Ring",
    right_ring="Regal Ring",
    back = gear.AmbuCape.WSDstr,
  }
  sets.WeaponSkill.HighAtk["Savage Blade"] = {
    ammo="Knobkierrie",
    head = gear.Empy.head,
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet = gear.Empy.feet,
    neck={ name="Abyssal Beads +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Thrud Earring",
    left_ring="Sroda Ring",
    right_ring="Regal Ring",
    back = gear.AmbuCape.WSDstr,
  }

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ----- MIDCAST SETS -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


  sets.midcast = {}

  sets.midcast.Drains = {
    -- ranged="Ullr",
    -- ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands = gear.Relic.hands,
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Rat. Sollerets +1",
    neck="Erra Pendant",
    waist="Eschan Stone",
    left_ear="Hirudinea Earring",
    right_ear="Static Earring",
    left_ring="Evanescence Ring",
    right_ring="Archon Ring",
    back = gear.ReiveCape,
  }
  sets.midcast.Absorbs = {
    hands="Pavor Gauntlets", -- +10% Potency
    feet="Rat. Sollerets +1", -- +25% Duration
    neck="Erra Pendant", -- +5% Potency
    right_ring="Kishar Ring", -- +10% Duration
    back="Chuparrosa Mantle", -- +20s and +10% Potency
  }
  sets.midcast.MagicAccuracy = {
    ammo="Pemphredo Tathlum",
    head = gear.Empy.head,
    body = gear.Empy.body,
    hands = gear.Empy.hands,
    legs = gear.Empy.legs,
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
    body = gear.Empy.body,
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
    -- Stack Dark magic skill. 1:1 damage dealt into attack bonus. scales with Dark Magic Skill
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
    body="Sacro Breastplate",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sibyl Scarf",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Malignance Earring",
    left_ring="Metamorph Ring +1",
    right_ring="Shiva Ring +1",
    back = gear.AmbuCape.Nuke,
  }
  sets.midcast.Impact = {
      ammo="Pemphredo Tathlum",
      body="Crepuscular Cloak",
      hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
      legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
      feet = gear.Empy.feet,
      neck="Erra Pendant",
      waist="Eschan Stone",
      left_ear="Malignance Earring",
      right_ear="Crep. Earring",
      left_ring="Weather. Ring +1",
      right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
      back="Chuparrosa Mantle",
}


end -- End of sets function

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- PRECAST FUNCTION ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


function precast(spell)


  attack = player.attack
  if attack > attack2 then
    AtkFlag = 2 -- Attack capped (>6000 Attack in TP set)
    active_ws = sets.WeaponSkill.HighAtk
  else
    AtkFlag = 0 -- Not Attack Capped
    active_ws = sets.WeaponSkill.MidAtk
  end
  
  self = windower.ffxi.get_mob_by_target('me')
  target = windower.ffxi.get_mob_by_target('t') or windower.ffxi.get_mob_by_target('st') or self
  distance = math.sqrt((self.x - target.x)^2 + (self.y - target.y)^2) -- Distance to target. Use this, together with the enemy model size, to determine when to cancel weapon skills if "too far."
  weather_intensity = gearswap.res.weather[world.weather_id].intensity -- Weather intensity: 2/1/0. 2 weather beats orpheus. 1 weather loses to orpheus.


  if active_ws[spell.name] then
    if distance > 7 then
      send_command('@input /echo Target too far away.')
      cancel_spell()
    end
    equip(active_ws[spell.name])
    if (world.weather_element == spell.element and world.day_element == spell.element) or (world.weather_element == spell.element and weather_intensity == 2) then
      equip(gear.Obi)
    elseif distance < 7 then
      equip(gear.Orpheus)
    elseif world.weather_element == spell.element or world.day_element == spell.element then
      equip(gear.Obi)
    end
      
  elseif spell.type=="WeaponSkill" then
    equip(sets.WeaponSkill["Cross Reaper"]) -- Default to the Cross Reaper set.
  elseif sets.precast[spell.name] then
    equip(sets.precast[spell.name])
  elseif spell.name == "Holy Water" then
    equip(set_combine(sets.status.Idle.DT,sets.items.HolyWater)) -- Specific Holy Water set.
  else
    equip(sets.precast.FastCast) 
  end


end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- MIDCAST FUNCTION ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function midcast(spell)


  if spell.skill == "Dark Magic" then
    if spell.name:contains("Absorb") then
      equip(set_combine(sets.midcast.MagicAccuracy, sets.midcast.Absorbs))
      if spell.name == "Absorb-Attri" then
        equip(sets.midcast.MagicAccuracy)
      elseif spell.name == "Absorb-TP" then
        equip({hands = gear.Empy.hands})
      end

    elseif string.find(spell.name, "Drain") then
      equip(sets.midcast.Drains)
      if (world.weather_element == spell.element and world.day_element == spell.element) or (world.weather_element == spell.element and weather_intensity == 2) then
        equip(gear.Obi)
      elseif distance < 7 then
        equip(gear.Orpheus)
      elseif world.weather_element == spell.element or world.day_element == spell.element then
        equip(gear.Obi)
      end  
    end

    if buffactive['Dark Seal'] then
      equip({head = gear.Relic.head})
    end
    if buffactive['Nether Void'] then
      equip({legs = gear.Empy.legs})
    end

    if spell.name == "Dread Spikes" then
      equip(sets.midcast['Dread Spikes'])
    elseif spell.name == "Endark II" then
      equip(sets.midcast.Endark)
    end


  elseif spell.skill == "Enfeebling Magic" then
    equip(sets.midcast.MagicAccuracy)


  elseif spell.skill == "Elemental Magic" then
    if spell.name == "Impact" then
      equip(sets.midcast.Impact)
    else
      equip(sets.midcast.Nuke)
      if (world.weather_element == spell.element and world.day_element == spell.element) or (world.weather_element == spell.element and weather_intensity == 2) then
        equip(gear.Obi)
      elseif distance < 7 then
        equip(gear.Orpheus)
      elseif world.weather_element == spell.element or world.day_element == spell.element then
        equip(gear.Obi)
      end  
    end
  end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- AFTERCAST FUNCTION -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function aftercast(spell)

  if not buffactive['Hasso'] and spell.name ~= "Hasso" then
    print("Hasso not up!")
  end

  if player.status == "Idle" then
    equip(sets.status.Idle.DT)
  elseif player.status == "Engaged" then
    if TPFlag == 0 then
      if buffactive['Aftermath: Lv.3'] then
        if player.equipment.main=="Liberator" then
          equip(sets.status.Melee.Liberator_AM3)
        elseif player.equipment.main=="Redemption" then
          equip(sets.status.Melee.Redemption_AM3)
        else
          equip(sets.status.Melee.Standard)
        end
      elseif buffactive['Aftermath: Lv.2'] or buffactive["Aftermath: Lv1"] then
        if player.equipment.main=="Redemption" then
          equip(sets.status.Melee.Redemption_AM3)
        else
          equip(sets.status.Melee.Standard)
        end
      else
        equip(sets.status.Melee.Standard)
      end
    elseif TPFlag == 1 then
      equip(sets.status.Melee.Hybrid)
    elseif TPFlag == 2 then
      equip(sets.status.Melee.SubtleBlow)
    end
  end
end

function status_change(new,old)

  if new == "Idle" then
    equip(sets.status.Idle.DT)
  elseif player.status == "Engaged" then
    if TPFlag == 0 then
      if buffactive['Aftermath: Lv.3'] then
        if player.equipment.main=="Liberator" then
          equip(sets.status.Melee.Liberator_AM3)
        elseif player.equipment.main=="Redemption" then
          equip(sets.status.Melee.Redemption_AM3)
        else
          equip(sets.status.Melee.Standard)
        end

      elseif buffactive['Aftermath: Lv.2'] or buffactive['Aftermath: Lv.1'] then
        if player.equipment.main=="Redemption" then
          equip(sets.status.Melee.Redemption_AM3)
        else
          equip(sets.status.Melee.Standard)
        end
      else
        equip(sets.status.Melee.Standard)
      end
    elseif TPFlag == 1 then
      equip(sets.status.Melee.Hybrid)
    elseif TPFlag == 2 then
      equip(sets.status.Melee.SubtleBlow)
    end
  elseif sets.status[new] then
    equip(sets.status[new])
  end

end
