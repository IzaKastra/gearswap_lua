include('organizer-lib')

function get_sets()
  maps()
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ----------- TOGGLES ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  TPFlag             = 0
  attack2            = 6000 -- This LUA will equip "high buff" WS sets if the attack value of your TP set is higher than this value
  -- ! == alt
  -- ^ == ctrl
  --
  send_command('bind f9 gs c cycle TP mode')
  send_command('bind f10 gs c Free')
  send_command('bind f11 gs c Equip Movement')
  send_command('bind f12 gs c Equip DT')

  send_command('bind ^f9 gs c Equip Treasure Hunter')
  send_command('bind ^f10 gs c Free')
  send_command('bind ^f11 gs c Equip Caladbolg')
  send_command('bind ^f12 gs c Equip Foenaria')

  send_command('bind !f9 gs c Equip Apocalypse')
  send_command('bind !f10 gs c Equip Liberator')
  send_command('bind !f11 gs c Equip Redemption')
  send_command('bind !f12 gs c Equip Anguta')

  send_command('bind ^!f12 gs c Equip Refresh')

  send_command('bind ^c gs c chocobo')

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
    send_command('unbind ^!f12')
    send_command('unbind ^f10')

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
      if command == 'Equip Refresh' then
        equip(sets.status.Refresh)
        send_command('@input /echo Refresh equipped.')
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
    if command == 'Equip Caladbolg' then
        equip({main = "Caladbolg", sub="Utu Grip"})
        send_command('@input /echo Caladbolg Equipped.')
        -- send_command('@input /lockstyleset 11')
      end
      if command == 'Equip Foenaria' then
        equip({main = "Foenaria", sub="Utu Grip"})
        send_command('@input /echo Foenaria Equipped.')
        -- send_command('@input /lockstyleset 11')
      end

      if command == 'chocobo' then
        mounts = {"Chocobo", "Chocobo", "Chocobo", "'Noble Chocobo'", "Phuabo", "Phuabo", "Xzomit", "Warmachine", "'Spectral Chair'", "Fenrir"}
        if windower.ffxi.get_mob_by_target('me').status == 5 or windower.ffxi.get_mob_by_target('me').status == 85 then
            send_command('@input /echo Dismount')
            send_command('@input /dismount')
        elseif windower.ffxi.get_mob_by_target('me').status == 0 then
            mount = mounts[math.random(#mounts)]
            send_command('@input /echo ' .. mount)
            send_command('@input /mount '.. mount)
        end
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
    gear.Empy.body                     = { name="Heath. Cuirass +3"}
    gear.Empy.hands                    = { name="Heath. Gauntlets +3"}
    gear.Empy.legs                     = { name="Heath. Flanchard +3"}
    gear.Empy.feet                     = { name="Heath. Sollerets +3"}


    gear.AmbuCape = {}
    gear.AmbuCape.STP                   = { name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}}
    gear.AmbuCape.DAstr                 = { name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}}
    gear.AmbuCape.WSDstr                = { name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%',}}
    gear.AmbuCape.WSDvit                = { name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%',}}
    gear.AmbuCape.FC                    = { name="Ankou's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','"Fast Cast"+10',}}
  
    gear.AF = {}
    gear.AF.head                       = {}
    gear.AF.body                       = { name="Ignominy Cuirass +3"}
    gear.AF.hands                      = { name="Ig. Gauntlets +2"}
    gear.AF.legs                       = { name="Ig. Flanchard +3",}
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
    head="Null Masque",
    body="Sakpata's Plate",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Warder's Charm +1",
    waist="Null Belt",
    left_ear="Etiolation Earring",
    right_ear="Sanare Earring",
    left_ring="Defending Ring",
    right_ring="Shadow Ring",
    back="Shadow Mantle"
  }

    sets.status.Refresh = {
        neck="Bale Choker",
        left_ring={name="Stikini Ring +1",bag="wardrobe",priority=1},
        right_ring={name="Stikini Ring +1",bag="wardrobe2",priority=2},
    }

  sets.status.Melee = {}
  sets.status.Melee.Standard = {
    ammo="Coiste Bodhar",
    head="Flam. Zucchetto +2",
    body="Hjarrandi Breast.",
    hands="Sakpata's Gauntlets",
    legs="Ig. Flanchard +3",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +1",
    -- neck = "Vim Torque +1",
    waist="Ioskeha Belt +1",
    ear1="Dedition Earring",
    ear2="Schere Earring",
    ring1="Lehko's ring",
    ring2="Niqmaddu Ring",
    back = gear.AmbuCape.STP,
  }
  sets.status.Melee.Liberator_AM3 = {
    ammo="Coiste Bodhar",
    head="Flam. Zucchetto +2",
    body="Hjarrandi Breast.",
    hands="Sakpata's Gauntlets",
    legs="Flamma Dirs +2",
    feet="Flam. Gambieras +2",
    neck="Abyssal Beads +1",
    waist="Sailfi Belt +1",
    ear1="Dedition Earring",
    ear2="Schere Earring",
    ring1="Lehko's ring",
    ring2="Niqmaddu Ring",
    back = gear.AmbuCape.STP,
  }
  sets.status.Melee.Caladbolg_AM3 = {
    main="Caladbolg",
    sub="Utu Grip",
    ranged=Empty,
    ammo="Coiste Bodhar",
    head="Sakpata's Helm",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck="Abyssal Beads +1",
    waist="Sailfi Belt +1",
    ear1="Brutal Earring",
    ear2="Schere Earring",
    ring1="Niqmaddu Ring",
    ring2="Lehko's ring",
    back = gear.AmbuCape.STP,
  }

  
  sets.status.Melee.Redemption_AM3 = {
    ammo="Coiste Bodhar",
    head="Sakpata's Helm",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Ig. Flanchard +3",
    feet="Sakpata's Leggings",
    neck="Abyssal Beads +1",
    waist="Sailfi Belt +1",
    ear1="Brutal Earring",
    ear2="Schere Earring",
    ring1="Lehko's ring",
    ring2="Niqmaddu Ring",
    back = gear.AmbuCape.DAstr,
  }
  sets.status.Melee.SubtleBlow = {
    -- main={ name="Redemption", augments={'Path: A',}},
    -- sub="Utu Grip",
    ammo="Coiste Bodhar",
    -- head={ name="Sakpata's Helm", augments={'Path: A',}},
    head = gear.Empy.head,
    body="Dagon Breast.",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
    feet={ name="Sakpata's Leggings", augments={'Path: A',}},
    -- neck={ name="Abyssal Beads +1", augments={'Path: A',}},
    neck="Bathy Choker",
    waist="Ioskeha Belt +1",
    ear1="Dignitary's Earring",
    ear2="Schere Earring",
    ring1="Lehko's ring",
    ring2="Niqmaddu Ring",
    back="Null Shawl",
    -- back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},
  }
  sets.status.Melee.Hybrid = {
    ammo="Coiste Bodhar",
    head="Hjarrandi Helm",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Flam. Gambieras +2",
    neck={ name="Abyssal Beads +1", augments={'Path: A',}},
    neck="Vim Torque +1",
    waist="Ioskeha Belt +1",
    ear1="Brutal Earring",
    ear2="Schere Earring",
    ring1="Lehko's ring",
    ring2="Niqmaddu Ring",
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
    -- 80% Fast Cast
    ammo="Sapience Orb", -- 2%
    head = gear.Carmine.head, -- 12%
    body="Sacro Breastplate", -- 10%
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}}, -- 8%
    legs="Enif Cosciales", -- 8%
    feet={ name="Odyssean Greaves", augments={'"Fast Cast"+4','MND+8','"Mag.Atk.Bns."+6',}}, -- 9%
    neck="Orunmila's Torque", -- 5%
    left_ear="Malignance Earring", -- 4%
    right_ear="Loquac. Earring", -- 2%
    left_ring="Weather. Ring +1", -- 6%
    right_ring="Kishar Ring", -- 4%
    back = gear.AmbuCape.FC, -- 10%
}
  sets.precast.Impact = {
    -- 56% Fast Cast
    ammo="Sapience Orb", -- 2%  
    head=Empty,
    body="Crepuscular Cloak",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}}, -- 8%
    legs={ name="Odyssean Cuisses", augments={'Attack+24','"Fast Cast"+6',}}, -- 6%
    feet={ name="Odyssean Greaves", augments={'"Fast Cast"+4','MND+8','"Mag.Atk.Bns."+6',}}, -- 9%
    neck="Orunmila's Torque", -- 5%
    waist="Plat. Mog. Belt",
    left_ear="Malignance Earring", -- 4%
    right_ear="Loquac. Earring", -- 2%
    left_ring="Weather. Ring +1", -- 6%
    right_ring="Kishar Ring", -- 4%
    back = gear.AmbuCape.FC, -- 10%
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
    

    sets.WeaponSkill.MidAtk["Torcleaver"] = {
        ammo="Knobkierrie",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet = gear.Empy.feet,
        neck="Abyssal Beads +1",
        waist="Sailfi Belt +1",
        ear1="Moonshade Earring",
        ear2="Thrud Earring",
        ring1="Regal Ring",
        ring2="Niqmaddu Ring",
        back = gear.AmbuCape.WSDvit,
      }
      sets.WeaponSkill.HighAtk["Torcleaver"] = {
        ammo="Knobkierrie",
        head = gear.Empy.head,
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
        feet = gear.Empy.feet,
        neck={ name="Abyssal Beads +1", augments={'Path: A',}},
        waist="Fotia Belt",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear={ name="Heath. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Weapon skill damage +2%',}},
        left_ring="Sroda Ring",
        right_ring="Niqmaddu Ring",
        back = gear.AmbuCape.WSDvit,
    }
    

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
    right_ear="Heath. Earring +1",
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
    left_ear = gear.Moonshade,
    right_ear="Heath. Earring +1",
    left_ring="Sroda Ring",
    right_ring="Niqmaddu Ring",
    back = gear.AmbuCape.DAstr,
}

sets.WeaponSkill.MidAtk["Cross Reaper"] = {
    ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: B',}},
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
    -- feet="Sakpata's Leggings",
    -- hands="Sakpata's Gauntlets",
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
    right_ear="Heath. Earring +1",
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
    waist="Sailfi Belt +1",
    left_ear = gear.Moonshade,
    right_ear="Thrud Earring",
    left_ring="Sroda Ring",
    right_ring="Niqmaddu Ring",
    back = gear.AmbuCape.WSDstr,
    -- feet="Sakpata's Leggings",
    -- hands="Sakpata's Gauntlets",
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
    left_ear="Thrud Earring",
    right_ear="Heath. Earring +1",
    left_ring="Sroda Ring",
    right_ring="Niqmaddu Ring",
    back = gear.AmbuCape.WSDstr,
  }

  sets.WeaponSkill.MidAtk["Catastrophe"] = {
    ammo="Knobkierrie",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body = gear.AF.body,
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet = gear.Empy.feet,
    neck={ name="Abyssal Beads +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Thrud Earring",
    right_ear="Heath. Earring +1",
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
    left_ear="Thrud Earring",
    right_ear="Heath. Earring +1",
    left_ring="Sroda Ring",
    right_ring="Niqmaddu Ring",
    back = gear.AmbuCape.WSDstr,
  }

  sets.WeaponSkill.MidAtk["Origin"] = {
    ammo="Knobkierrie",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Heath. Sollerets +3",
    neck="Abyssal Beads +1",
    -- neck="Bathy Choker",
    waist="Sailfi Belt +1",
    ear1="Moonshade Earring",
    ear2="Thrud Earring",
    ring1="Niqmaddu Ring",
    ring2="Regal Ring",
    -- ring2="Chirich Ring",
    back = gear.AmbuCape.WSDstr,
  }
  sets.WeaponSkill.HighAtk["Origin"] = {
    ammo="Knobkierrie",
    head = gear.Empy.head,
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Heath. Sollerets +3",
    neck="Abyssal Beads +1",
    -- neck="Bathy Choker",
    waist="Sailfi Belt +1",
    ear1="Moonshade Earring",
    ear2="Heath. Earring +1",
    ring1="Sroda Ring",
    ring2="Regal Ring",
    -- ring2="Chirich Ring",
    back = gear.AmbuCape.WSDstr,
  }

  sets.WeaponSkill.MidAtk["Entropy"] = {
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head = gear.Empy.head,
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear = gear.Moonshade,
    right_ear="Schere Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Niqmaddu Ring",
    back = gear.AmbuCape.DAstr,
    feet="Sakpata's Leggings",
    hands="Sakpata's Gauntlets",
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
    left_ear = gear.Moonshade,
    right_ear="Heath. Earring +1",
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
    left_ear = gear.Moonshade,
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
    left_ear = gear.Moonshade,
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
    neck="Null Loop",
    waist="Null Belt",
    left_ear = gear.Moonshade,
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
    left_ear = gear.Moonshade,
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
    left_ear="Thrud Earring",
    right_ear="Schere Earring",
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
    left_ear = gear.Moonshade,
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
    left_ear = gear.Moonshade,
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
    left_ear = gear.Moonshade,
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
    left_ear = gear.Moonshade,
    right_ear="Thrud Earring",
    left_ring="Sroda Ring",
    right_ring="Regal Ring",
    back = gear.AmbuCape.WSDstr,
  }


  sets.WeaponSkill.MidAtk["Armor Break"] = {
    ammo="Pemphredo Tathlum",
    head = gear.Empy.head,
    body = gear.Empy.body,
    hands = gear.Empy.hands,
    legs = gear.Empy.legs,
    feet = gear.Empy.feet,
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Malignance Earring",
    right_ear="Crep. Earring",
    left_ring="Weather. Ring +1",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back="Null Shawl",
  }
  sets.WeaponSkill.HighAtk["Armor Break"] = sets.WeaponSkill.MidAtk["Armor Break"]


  sets.Jump = {
    -- Stack accuracy, Store TP, and multi-attack.
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Flam. Zucchetto +2",
    body="Hjarrandi Breast.",
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Odyssean Cuisses", augments={'Accuracy+28','"Store TP"+5','AGI+8','Attack+7',}},
    feet="Flam. Gambieras +2",
    neck={ name="Vim Torque +1", augments={'Path: A',}},
    waist={ name="Kentarch Belt +1", augments={'Path: A',}},
    left_ear="Crep. Earring",
    right_ear="Dedition Earring",
    left_ring="Chirich Ring +1",
    right_ring="Lehko's Ring",
    back = gear.AmbuCape.STP,
    }

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ----- MIDCAST SETS -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


  sets.midcast = {}

  sets.midcast.Drains = {
    -- ranged="Ullr",
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands = gear.Relic.hands,
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Rat. Sollerets +1",
    neck="Null Loop",
    waist="Null Belt",
    ear1="Hirudinea Earring",
    ear2="Malignance Earring",
    ring1="Evanescence Ring",
    ring2="Archon Ring",
    back = gear.ReiveCape,
  }
  sets.midcast.Absorbs = {
    feet="Rat. Sollerets +1", -- +25% Duration
    left_ring="Stikini Ring +1",
    right_ring="Kishar Ring", -- +10% Duration
  }

--   sets.midcast.AbsorbTP = {
--     ammo="Pemphredo Tathlum",
--     head={ name="Sakpata's Helm", augments={'Path: A',}},
--     body="Sacro Breastplate",
--     hands="Heath. Gauntlets +3",
--     legs="Heath. Flanchard +3",
--     feet={ name="Odyssean Greaves", augments={'"Fast Cast"+4','MND+8','"Mag.Atk.Bns."+6',}},
--     neck="Null Loop",
--     waist="Null Belt",
--     left_ear="Malignance Earring",
--     right_ear="Crep. Earring",
--     left_ring="Weather. Ring +1",
--     right_ring="Stikini Ring +1",
--     back="Null Shawl",
--   }

  sets.midcast.MagicAccuracy = {
    ammo="Pemphredo Tathlum",
    head = gear.Empy.head,
    body = gear.Empy.body,
    hands = gear.Empy.hands,
    legs = gear.Empy.legs,
    feet = gear.Empy.feet,
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Malignance Earring",
    right_ear="Crep. Earring",
    left_ring="Weather. Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
  }
  sets.midcast['Dread Spikes'] = {
    -- stack Dread spikes+ and HP gear
    head="Hjarrandi Helm",
    body = gear.Empy.body,
    hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Rat. Sollerets +1",
    neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear="Tuisto Earring",
    right_ear="Odnowa Earring +1",
    left_ring={name="Moonlight Ring",bag="wardrobe",priority=1},
    right_ring={name="Moonlight Ring",bag="wardrobe2",priority=2},
    back='Reiki Cloak',
  }
  sets.midcast.Endark = {
    -- Stack Dark magic skill. 1:1 damage dealt into attack bonus. scales with Dark Magic Skill
    hands = gear.Relic.hands,
    legs = gear.Empy.legs,
    feet="Rat. Sollerets +1",
    neck="Erra Pendant",
    left_ring={name="Stikini Ring +1",bag="wardrobe",priority=1},
    right_ring={name="Stikini Ring +1",bag="wardrobe2",priority=2},
    back = gear.ReiveCape,

  }
  sets.midcast.Nuke = {
    ammo="Ghastly Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Sacro Breastplate",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet = gear.Empy.feet,
    neck="Sibyl Scarf",
    waist="Null Belt",
    left_ear="Friomisi Earring",
    right_ear="Malignance Earring",
    left_ring="Metamorph Ring +1",
    right_ring="Shiva Ring +1",
    back = gear.AmbuCape.Nuke,
  }
  sets.midcast.Impact = {
    -- Stack Store TP for a "Quick" AM3. Remember to remove Hasso for cast times.
    ranged=Empty,
    head=Empty,
    body="Crepuscular Cloak",
    hands="Sakpata's Gauntlets",
    legs={ name="Odyssean Cuisses", augments={'Accuracy+28','"Store TP"+5','AGI+8','Attack+7',}},
    feet="Heath. Sollerets +3",
    neck="Vim Torque +1",
    waist="Oneiros Rope",
    left_ear="Crep. Earring",
    right_ear="Dedition Earring",
    left_ring="Chirich Ring +1",
    right_ring="Lehko's ring",
    back = gear.AmbuCape.STP,
    }

end -- End of sets function

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- PRECAST FUNCTION ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function maps()
    elemental_ws = S {"Shadow of Death", "Infernal Scythe", "Dark Harvest"}
end

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
    -- if distance > 7 then
    --   send_command('@input /echo Target too far away.')
    --   cancel_spell()
    -- end
    equip(active_ws[spell.name])
    if elemental_ws:contains(spell.name) then
        if (world.weather_element == spell.element and world.day_element == spell.element) or (world.weather_element == spell.element and weather_intensity == 2) then
        equip(gear.Obi)
        elseif distance < 7 then
        equip(gear.Orpheus)
        elseif world.weather_element == spell.element or world.day_element == spell.element then
        equip(gear.Obi)
        end
    end
      
  elseif spell.type=="WeaponSkill" then
    equip(sets.WeaponSkill.MidAtk["Cross Reaper"]) -- Default to the Cross Reaper set.
  elseif sets.precast[spell.name] then
    equip(sets.precast[spell.name])
  elseif spell.name == "Holy Water" then
    equip(set_combine(sets.status.Idle.DT,sets.items.HolyWater)) -- Specific Holy Water set.
  elseif spell.name=="Jump" or spell.name=="High Jump" then
    equip(sets.Jump)
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
      if spell.name == "Absorb-TP" or spell.name=="Absorb-Attri" then
        equip(sets.midcast.MagicAccuracy)
      else
        equip(set_combine(sets.midcast.MagicAccuracy, sets.midcast.Absorbs))
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
    elseif spell.name == "Stun" then
        equip(sets.midcast.MagicAccuracy)
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

--   if not buffactive['Hasso'] and spell.name ~= "Hasso" then
--     print("Hasso not up!")
--   end

  if player.status == "Idle" then
    equip(sets.status.Idle.DT)
  elseif player.status == "Engaged" then
    if TPFlag == 0 then
      if buffactive['Aftermath: Lv.3'] then
        if player.equipment.main=="Liberator" then
          equip(sets.status.Melee.Liberator_AM3)
        elseif player.equipment.main=="Redemption" then
            equip(sets.status.Melee.Redemption_AM3)
        elseif player.equipment.main=="Caladbolg" then
            equip(sets.status.Melee.Redemption_AM3)
        else
          equip(sets.status.Melee.Standard)
        end
      elseif buffactive['Aftermath: Lv.2'] or buffactive["Aftermath: Lv1"] then
        if player.equipment.main=="Redemption" or player.equipment.main=="Caladbolg" then
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
        elseif player.equipment.main=="Redemption" or player.equipment.main=="Caladbolg" then
          equip(sets.status.Melee.Redemption_AM3)
        else
          equip(sets.status.Melee.Standard)
        end

      elseif buffactive['Aftermath: Lv.2'] or buffactive['Aftermath: Lv.1'] then
        if player.equipment.main=="Redemption" or player.equipment.main=="Caladbolg" then
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
