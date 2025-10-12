include('organizer-lib')
enable("main", "sub", "ranged")

function get_sets()

    maps()

    MagicBurstFlag     = 1
    WeaponLock         = 0
    -- ! == alt
    -- ^ == ctrl

    send_command('bind f9 gs c toggle MagicBurst')
    send_command('bind f10 gs c Free1')
    send_command('bind f11 gs c equip movement')
    send_command('bind f12 gs c Equip DT')

    send_command('bind ^f9 gs c Equip Crocea')
    send_command('bind ^f10 gs c Equip Maxentius')
    send_command('bind ^f11 gs c Free3')
    send_command('bind ^f12 gs c Equip Refresh')


    send_command('bind !^f9 gs c Equip Naegling')
    send_command('bind !^f10 gs c Equip Excalibur')
    send_command('bind !^f11 gs c Equip Mandau')

    send_command('bind !^f12 gs c toggle WeaponLock')

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
        send_command('unbind !^f9')
        send_command('unbind !^f10')
        send_command('unbind !^f11')
        send_command('unbind !^f12')

        send_command('unbind ^c')
    end



function check_param()
        print('-------------------------')
        if MagicBurstFlag == 0 then
            print('Magic Burst:........OFF')
        elseif MagicBurstFlag == 1 then
            print('Magic Burst:.........ON')
        end
        if WeaponLock == 0 then
            print('Weapon Lock:........OFF')
        elseif WeaponLock == 1 then
            print('Weapon Lock:.........ON')
        end
        print('-------------------------')
end

function self_command(command)

    -- player = windower.ffxi.get_player()

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

    if command == 'toggle WeaponLock' then
        if WeaponLock == 0 then
            WeaponLock = 1
            send_command('@input //gs disable main sub ranged')
        elseif WeaponLock == 1 then
            WeaponLock = 0
            send_command('@input //gs enable main sub ranged')
            enable("main","sub","ranged")
        end
        check_param()
    end

    if command == 'Equip DT' then
        equip(sets.status.Idle.DT)
        send_command('@input /echo Damage Taken set equipped.')
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

    if command == 'warp' then
        send_command('@input /equip Ring2 "Warp Ring"')
        send_command('@input /equip main "Warp Cudgel"')
    end

    if command == 'Equip Refresh' then
        equip(sets.status.Idle.Refresh)
        send_command('@input /echo Idle Refresh set equipped.')
    end

    if command == 'equip movement' then
        equip({ring2="Shneddick Ring +1"})
        send_command('@input /echo Movement+ Equipped.')
    end

    if command == 'Equip Mandau' then
        if WeaponLock == 1 then
            enable("main","sub","ranged")
        end
        equip({main="Mandau",})
        if player.sub_job=="NIN" or player.sub_job=="DNC" then
            equip({sub="Gleti's Knife"})
        end
        if WeaponLock == 1 then
            disable("main","sub","ranged")
        end
        send_command('@input /echo Mandau equipped.')
        -- send_command('@input /lockstyleset 37')
    end

    if command == 'Equip Naegling' then
        if WeaponLock == 1 then
            enable("main","sub","ranged")
        end
        equip({main="Naegling"})
        if player.sub_job=="NIN" or player.sub_job=="DNC" then
            equip({sub="Thibron"})
        end
        if WeaponLock == 1 then
            disable("main","sub","ranged")
        end
        send_command('@input /echo Naegling equipped.')
        -- send_command('@input /lockstyleset 39')
    end

    if command == 'Equip Crocea' then
        if WeaponLock == 1 then
            enable("main","sub","ranged")
        end
        equip({main="Crocea Mors"})
        if player.sub_job=="NIN" or player.sub_job=="DNC" then
            equip({sub="Crepuscular Knife"})
        else
            equip({sub="Ammurapi Shield"})
        end
        if WeaponLock == 1 then
            disable("main","sub","ranged")
        end
        send_command('@input /echo Crocea Mors equipped.')
    end

    if command == 'Equip Maxentius' then
        if WeaponLock == 1 then
            enable("main","sub","ranged")
        end
        equip({main="Maxentius"})
        if player.sub_job=="NIN" or player.sub_job=="DNC" then
            equip({sub="Thibron"})
        end
        if WeaponLock == 1 then
            disable("main","sub","ranged")
        end
        send_command('@input /echo Maxentius equipped.')
    end

    if command == 'Equip Excalibur' then
        if WeaponLock == 1 then
            enable("main","sub","ranged")
        end
        equip({main="Excalibur"})
        if player.sub_job=="NIN" or player.sub_job=="DNC" then
            equip({sub="Gleti's Knife"})
        end
        if WeaponLock == 1 then
            disable("main","sub","ranged")
        end
        send_command('@input /echo Excalibur equipped.')
        -- send_command('@input /lockstyleset 40')
    end


end



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    gear = {}


    gear.Artifact = {}
    gear.Artifact.head  = { name="Atro. Chapeau +2"}
    gear.Artifact.body  = { name="Atrophy Tabard +2"}
    gear.Artifact.hands = { name="Atrophy Gloves +4"}
    gear.Artifact.legs  = { name="Atrophy Tights +1"}

    gear.Relic = {}
    gear.Relic.head  = { name="Viti. Chapeau +4"}
    gear.Relic.body  = { name="Viti. Tabard +3"}
    gear.Relic.hands = { name="Viti. Gloves +3"}
    gear.Relic.feet  = { name="Viti. Boots +4"}

    gear.Empyrean = {}
    gear.Empyrean.head  = { name="Leth. Chappel +3"}
    gear.Empyrean.body  = { name="Lethargy Sayon +3"}
    gear.Empyrean.hands = { name="Leth. Ganth. +3"}
    gear.Empyrean.legs  = { name="Leth. Fuseau +3"}
    gear.Empyrean.feet  = { name="Leth. Houseaux +3"}

    gear.Amalric = {}
    gear.Amalric.body  = { name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}
    gear.Amalric.hands = { name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}
    gear.Amalric.legs  = { name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}
    gear.Amalric.feet  = { name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}

    gear.AmbuCape = {}
    gear.AmbuCape.MND = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}}
    gear.AmbuCape.INT = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}}
    gear.AmbuCape.DW  = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}}
    gear.AmbuCape.WSD = { name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}

    gear.ReiveCape = { name="Ghostfyre Cape", augments={'Enfb.mag. skill +2','Enha.mag. skill +10','Mag. Acc.+6','Enh. Mag. eff. dur. +18',}}

    gear.Chironic = {}
    gear.Chironic.legs = {}
    gear.Chironic.legs.MNDfeeble = { name="Chironic Hose", augments={'Mag. Acc.+26','MND+10',}}
    gear.Chironic.legs.INTfeeble = { name="Chironic Hose", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','"Fast Cast"+3','INT+8','Mag. Acc.+4',}}


    gear.Merlinic = {}
    gear.Merlinic.feet = {}
    gear.Merlinic.feet.FC = { name="Merlinic Crackows", augments={'"Fast Cast"+6','"Mag.Atk.Bns."+1',}}

    gear.Telchine = {}
    gear.Telchine.head  = { name="Telchine Cap", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}}
    gear.Telchine.body  = { name="Telchine Chas.", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}}
    gear.Telchine.hands = { name="Telchine Gloves", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +9',}}
    gear.Telchine.legs  = { name="Telchine Braconi", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}}
    gear.Telchine.feet  = { name="Telchine Pigaches", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}}


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- STATUS SETS --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


    sets.status = {}
    sets.status.Idle = {}
    sets.status.Idle.DT = {
        main="Excalibur",
        sub='Sacro Bulwark',
        ammo="Staunch Tathlum +1",
        head = gear.Relic.head,
        body = gear.Empyrean.body,
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Warder's Charm +1",
        waist="Null Belt",
        ear1="Etiolation Earring",
        ear2="Sanare Earring",
        ring1="Murky Ring",
        ring2="Shadow Ring",
        back="Shadow Mantle",
    }
    sets.status.Idle.Refresh = {
        main="Daybreak",
        sub='Sacro Bulwark',
        ammo="Homiliary",
        head = gear.Relic.head,
        body = gear.Empyrean.body,
        hands="Nyame Gauntlets",
        -- hands="Volte Gloves",
        legs="Volte Brais",
        feet="Nyame Sollerets",
        -- feet="Volte Gaiters",
        neck="Warder's Charm +1",
        waist="Carrier's Sash",
        ear1="Etiolation Earring",
        ear2="Loquac. Earring",
        ring1={name="Stikini Ring +1",bag="wardrobe",priority=1},
        ring2={name="Stikini Ring +1",bag="wardrobe2",priority=2},
        back="Shadow Mantle",
    }
    sets.status.MeleeDW = {
        ammo="Coiste Bodhar",
        head="Bunzi's Hat",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Combatant's Torque",
        waist="Reiki Yotai",
        ear1="Suppanomimi",
        ear2="Eabani Earring",
        ring1="Hetairoi Ring",
        ring2="Lehko's ring",
        back = gear.AmbuCape.DW,
    }

    sets.status.Melee = {
        ranged="Empty",
        ammo="Coiste Bodhar",
        head="Bunzi's Hat",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Combatant's Torque",
        waist="Windbuffet Belt +1",
        ear1="Dedition Earring",
        ear2="Sherida Earring",
        ring1="Chirich Ring +1",
        ring2="Lehko's ring",
        back = gear.AmbuCape.DW,
    }

    sets.VagaryBurst = {
        main="Maxentius",
        ammo="Regal Gem",
        head="Malignance Chapeau",
        body = gear.Empyrean.body,
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Dls. Torque +2",
        waist="Null Belt",
        ear1="Crep. Earring",
        ear2="Lethargy Earring +1",
        ring1="Freke Ring",
        ring2="Stikini Ring +1",
        back="Null Shawl",
    }
    sets.VagaryWS = {
        ammo="Staunch Tathlum +1",
        head = gear.Telchine.head,
        body = gear.Telchine.body,
        hands = gear.Telchine.hands,
        legs="Shedir Seraweels",
        feet = gear.Telchine.feet,
        neck="Null Loop",
        waist="Null Belt",
        ear1="Crep. Earring",
        ear2="Lethargy Earring +1",
        ring1="Murky Ring",
        ring2="Chirich Ring +1",
        back="Null Shawl",
    }


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    sets.precast = {}
    sets.precast.FastCast = {
        main="Crocea Mors",
        sub='Sacro Bulwark',
        ammo="Impatiens",
        head = gear.Artifact.head,
        body = gear.Relic.body,
        hands="Leyline Gloves",
        legs="Volte Brais",
        feet = gear.Merlinic.feet.FC,
        neck="Orunmila's Torque",
        waist="Embla Sash",
        ear1="Loquac. Earring",
        ear2="Lethargy Earring +1",
        ring1="Weather. Ring +1",
        ring2="Lebeche Ring",
        back = gear.AmbuCape.MND,
    }
    sets.precast.Impact = {
        main="Crocea Mors",
        sub='Sacro Bulwark',
        ranged="Empty",
        ammo="Impatiens",
        head="Empty",
        body="Crepuscular Cloak",
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs="Volte Brais",
        feet = gear.Merlinic.feet.FC,
        neck="Orunmila's Torque",
        waist="Embla Sash",
        ear1="Loquac. Earring",
        ear2="Lethargy Earring +1",
        ring1="Weather. Ring +1",
        ring2="Kishar Ring",
        back = gear.AmbuCape.MND,
      }

    sets.precast.Enhancing = {waist="Siegel Sash",}
    sets.precast.Chainspell = {body = gear.Relic.body,}
    sets.precast.Enfeeble = {head = gear.Empyrean.head,}
    
    sets.WeaponSkill = {}
    sets.WeaponSkill["Chant du Cygne"] = {
        ammo="Yetshila +1",
        head="Blistering Sallet +1",
        body="Nyame Mail",
        hands="Malignance Gloves",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        ear1="Mache Earring +1",
        ear2="Sherida Earring",
        ring1="Ilabrat Ring",
        ring2="Lehko's ring",
        back = gear.AmbuCape.WSD,
    }
    sets.WeaponSkill["Requiescat"] = {
        ammo="Coiste Bodhar",
        head = gear.Relic.head,
        body="Nyame Mail",
        hands = gear.Empyrean.hands,
        legs="Nyame Flanchard",
        feet = gear.Empyrean.feet,
        neck="Fotia Gorget",
        waist="Fotia Belt",
        ear1="Moonshade Earring",
        ear2="Regal Earring",
        ring1="Metamor. Ring +1",
        ring2="Shukuyu Ring",
        back = gear.AmbuCape.WSD,
    }
    sets.WeaponSkill["Savage Blade"] = {
        ammo="Coiste Bodhar",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet = gear.Empyrean.feet,
        neck="Rep. Plat. Medal",
        waist="Sailfi Belt +1",
        ear1="Moonshade Earring",
        ear2="Sherida Earring",
        ring1="Sroda Ring",
        ring2="Shukuyu Ring",
        back = gear.AmbuCape.WSD,
    }
    sets.WeaponSkill["Black Halo"] = {
        ammo="Coiste Bodhar",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet = gear.Empyrean.feet,
        neck="Rep. Plat. Medal",
        waist="Sailfi Belt +1",
        ear1="Moonshade Earring",
        ear2="Sherida Earring",
        ring1="Sroda Ring",
        ring2="Shukuyu Ring",
        back = gear.AmbuCape.WSD,
    }

    -- sets.WeaponSkill["Black Halo"] = {
    --     ammo="Coiste Bodhar",
    --     head="Nyame Helm",
    --     body="Nyame Mail",
    --     hands="Nyame Gauntlets",
    --     legs="Nyame Flanchard",
    --     feet = gear.Empyrean.feet,
    --     neck="Null Loop",
    --     waist="Sailfi Belt +1",
    --     ear1="Moonshade Earring",
    --     ear2="Sherida Earring",
    --     ring1="Ilabrat Ring",
    --     ring2="Chirich Ring +1",
    --     back = gear.AmbuCape.WSD,
    -- }


    sets.WeaponSkill["Knights of Round"] = {
        ammo="Coiste Bodhar",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet = gear.Empyrean.feet,
        neck="Rep. Plat. Medal",
        waist="Sailfi Belt +1",
        ear1="Telos Earring",
        ear2="Sherida Earring",
        ring1="Sroda Ring",
        ring2="Shukuyu Ring",
        back = gear.AmbuCape.WSD,
    }

    sets.WeaponSkill["Flat Blade"] = {
        ammo="Coiste Bodhar",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Rep. Plat. Medal",
        waist="Sailfi Belt +1",
        ear1="Moonshade Earring",
        ear2="Sherida Earring",
        ring1="Sroda Ring",
        ring2="Shukuyu Ring",
        back = gear.AmbuCape.WSD,
    }
    sets.WeaponSkill["Death Blossom"] = {
        ammo="Coiste Bodhar",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Rep. Plat. Medal",
        waist="Sailfi Belt +1",
        ear1="Telos Earring",
        ear2="Sherida Earring",
        ring1="Sroda Ring",
        ring2="Shukuyu Ring",
        back = gear.AmbuCape.WSD,
    }
    sets.WeaponSkill["Mercy Stroke"] = {
        ammo="Coiste Bodhar",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet = gear.Empyrean.feet,
        neck="Rep. Plat. Medal",
        waist="Sailfi Belt +1",
        ear1="Brutal Earring",
        ear2="Sherida Earring",
        ring1="Sroda Ring",
        ring2="Shukuyu Ring",
        back = gear.AmbuCape.WSD,
    }

    sets.WeaponSkill["Sanguine Blade"] = {
        ammo="Oshasha's Treatise",
        head="Pixie Hairpin +1",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs = gear.Empyrean.legs,
        feet = gear.Empyrean.feet,
        neck="Sibyl Scarf",
        waist="Orpheus's Sash",
        ear1="Regal Earring",
        ear2="Malignance Earring",
        ring1="Freke Ring",
        ring2="Archon Ring",
        back = gear.AmbuCape.WSD,
    }
    sets.WeaponSkill["Red Lotus Blade"] = {
        ammo="Oshasha's Treatise",
        head = gear.Empyrean.head,
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet = gear.Empyrean.feet,
        neck="Sibyl Scarf",
        waist="Orpheus's Sash",
        ear1="Moonshade Earring",
        ear2="Malignance Earring",
        ring1="Freke Ring",
        ring2="Shiva Ring +1",
        back = gear.AmbuCape.WSD,
    }
    sets.WeaponSkill["Seraph Blade"] = {
        ammo="Oshasha's Treatise",
        head = gear.Empyrean.head,
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet = gear.Empyrean.feet,
        neck="Fotia Gorget",
        waist="Orpheus's Sash",
        ear1="Moonshade Earring",
        ear2="Malignance Earring",
        ring1="Freke Ring",
        ring2="Weather. Ring +1",
        back = gear.AmbuCape.WSD,
    }

    sets.WeaponSkill["Aeolian Edge"] = {
        ammo="Oshasha's Treatise",
        head = gear.Empyrean.head,
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs = gear.Empyrean.legs,
        feet = gear.Empyrean.feet,
        neck="Fotia Gorget",
        waist="Orpheus's Sash",
        ear1="Moonshade Earring",
        ear2="Malignance Earring",
        ring1="Freke Ring",
        ring2="Shiva Ring +1",
        back = gear.AmbuCape.WSD,
    }

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


    sets.midcast = {}

    sets.midcast.INTfeeble = {
        main="Bunzi's Rod",
        sub="Ammurapi Shield",
        ammo="Regal Gem",
        head = gear.Relic.head,
        body = gear.Empyrean.body,
        hands = gear.Empyrean.hands,
        legs = gear.Chironic.legs.INTfeeble,
        feet = gear.Relic.feet,
        neck="Dls. Torque +2",
        waist="Obstin. Sash",
        ear1="Snotra Earring",
        ear2="Malignance Earring",
        ring1={name="Stikini Ring +1",bag="wardrobe",priority=1}, -- Equip in order of decreasing priority: https://www.ffxiah.com/forum/topic/55679/gearswap-swap-order/
        ring2="Kishar Ring",
        back = gear.AmbuCape.INT,
    }
    sets.midcast.MNDfeeble = {
        main="Bunzi's Rod",
        sub="Ammurapi Shield",
        ammo="Regal Gem",
        head = gear.Relic.head,
        body = gear.Empyrean.body,
        hands = gear.Empyrean.hands,
        legs = gear.Chironic.legs.MNDfeeble,
        feet = gear.Relic.feet,
        neck="Dls. Torque +2",
        waist="Obstin. Sash",
        ear1="Snotra Earring",
        ear2="Malignance Earring",
        ring1={name="Stikini Ring +1",bag="wardrobe",priority=1},
        ring2="Kishar Ring",
        back = gear.AmbuCape.MND,
    }
    sets.midcast.Frazzle2 = {
        main="Bunzi's Rod",
        sub="Ammurapi Shield",
        range="Ullr",
        ammo="Empty",
        head = gear.Relic.head,
        body = gear.Empyrean.body,
        hands = gear.Empyrean.hands,
        legs = gear.Empyrean.legs,
        feet = gear.Relic.feet,
        neck="Dls. Torque +2",
        waist="Null Belt",
        ear1="Malignance Earring",
        ear2="Lethargy Earring +1",
        ring1={name="Stikini Ring +1",bag="wardrobe",priority=1},
        ring2={name="Stikini Ring +1",bag="wardrobe2",priority=2},
        back="Null Shawl",
    }
    sets.midcast.Impact = {
        main="Bunzi's Rod",
        sub="Ammurapi Shield",
        -- ranged="Ullr",
        ammo="Pemphredo Tathlum",
        head="Empty",
        body="Crepuscular Cloak",
        hands = gear.Empyrean.hands,
        legs = gear.Empyrean.legs,
        feet = gear.Empyrean.feet,
        neck="Null Loop",
        waist="Null Belt",
        ear1="Malignance Earring",
        ear2="Lethargy Earring +1",
        ring1={name="Stikini Ring +1",bag="wardrobe",priority=1},
        ring2={name="Stikini Ring +1",bag="wardrobe2",priority=2},
        back="Null Shawl",
      }
        sets.midcast.EnhancingOthers = {
        main="Colada",
        sub="Ammurapi Shield",
        head = gear.Empyrean.head,
        body = gear.Relic.body,
        hands = gear.Artifact.hands,
        legs = gear.Empyrean.legs,
        feet = gear.Empyrean.feet,
        neck="Dls. Torque +2",
        waist="Embla Sash",
        ear1="Mimir Earring",
        ear2="Lethargy Earring +1",
        ring1={name="Stikini Ring +1",bag="wardrobe",priority=1},
        ring2={name="Stikini Ring +1",bag="wardrobe2",priority=2},
        back = gear.AmbuCape.MND,
    }
    sets.midcast.EnhancingSelf = {
        main="Colada",
        sub="Ammurapi Shield",
        head = gear.Telchine.head,
        body = gear.Relic.body,
        hands = gear.Artifact.hands,
        legs = gear.Telchine.legs,
        feet = gear.Empyrean.feet,
        neck="Dls. Torque +2",
        waist="Embla Sash",
        ear1="Mimir Earring",
        ear2="Lethargy Earring +1",
        ring1={name="Stikini Ring +1",bag="wardrobe",priority=1},
        ring2={name="Stikini Ring +1",bag="wardrobe2",priority=2},
        back = gear.AmbuCape.MND,
        }

    sets.midcast.EnhancingSkill = {
        head="Befouled Crown",
        body = gear.Relic.body,
        hands = gear.Relic.hands,
        legs="Carmine Cuisses +1",
        feet = gear.Empyrean.feet,
        neck="Incanter's Torque",
        waist="Cascade Belt",
        ear1="Mimir Earring",
        ring1={name="Stikini Ring +1",bag="wardrobe",priority=1},
        ring2={name="Stikini Ring +1",bag="wardrobe2",priority=2},
        back = gear.ReiveCape,
        }

    sets.midcast.Nuke = {
        main="Bunzi's Rod",
        sub="Ammurapi Shield",
        ammo="Ghastly Tathlum +1",
        head = gear.Empyrean.head,
        body = gear.Empyrean.body,
        hands = gear.Empyrean.hands,
        legs = gear.Empyrean.legs,
        feet = gear.Relic.feet,
        neck="Sibyl Scarf",
        waist="Sacro Cord",
        ear1="Malignance Earring",
        ear2="Regal Earring",
        ring1="Freke Ring",
        ring2="Metamor. Ring +1",
        back = gear.AmbuCape.INT,
    }
    -- sets.midcast.NukeAcumen = {
    --     ammo="Aurgelmir Orb",
    --     head="Malignance Chapeau",
    --     body={ name="Merlinic Jubbah", augments={'"Mag.Atk.Bns."+6','"Occult Acumen"+11','CHR+4',}},
    --     hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+19','"Occult Acumen"+11','INT+5','Mag. Acc.+13',}},
    --     legs="Perdition Slops",
    --     feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+1','"Occult Acumen"+11','Mag. Acc.+14',}},
    --     neck="Combatant's Torque",
    --     waist="Oneiros Rope",
    --     ear1="Crep. Earring",
    --     ear2="Dedition Earring",
    --     ring1="Chirich Ring +1",
    --     ring2="Chirich Ring +1",
    --     back="Null Shawl",
    -- }

    sets.midcast.MagicBurst = {
        main="Bunzi's Rod",
        sub="Ammurapi Shield",
        ammo="Ghastly Tathlum +1",
        head="Ea Hat +1",
        body="Ea Houppe. +1",
        hands="Bunzi's Gloves",
        legs = gear.Empyrean.legs,
        feet = gear.Relic.feet,
        neck="Sibyl Scarf",
        waist="Sacro Cord",
        ear1="Malignance Earring",
        ear2="Regal Earring",
        ring1="Freke Ring",
        ring2="Metamor. Ring +1",
        back = gear.AmbuCape.INT,
    }

    sets.midcast.Aquaveil = {
        head="Chironic Hat",
        -- hands="Regal Cuffs",
        legs="Shedir Seraweels",
        waist="Emphatikos Rope",
      }

    sets.midcast.Cursna = {
        body = gear.Relic.head,
        legs = gear.Artifact.legs,
        feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
        neck="Incanter's Torque",
        ring1="Haoma's Ring",
        ring2="Haoma's Ring",
    }

    sets.midcast.Treasure = {
    -- +5 Treasure Hunter (caps at +4)
        ammo="Perfect Lucky Egg",
        head="Volte Cap",
        hands="Volte Bracers",  
        waist="Chaac Belt",
        feet="Volte Boots",
    }

    sets.midcast.AbsorbTP = {
        -- +42% Gear +38% Trait = 80% Fast Cast
        -- +29% Gear Haste
        sub="Ammurapi Shield",
        ammo="Regal Gem",
        head = gear.Artifact.head,
        body = gear.Empyrean.body,
        hands = gear.Empyrean.hands,
        legs = gear.Empyrean.legs,
        feet = gear.Empyrean.feet,
        neck="Null Loop",
        waist="Sailfi Belt +1",
        ear1="Malignance Earring",
        ear2="Lethargy Earring +1",
        ring1="Weather. Ring +1",
        ring2="Stikini Ring +1",
        back = gear.AmbuCape.FastCast,
        }
    
    sets.midcast.Phalanx = {
        main="Sakpata's Sword", -- +5
        head="Chironic Hat", -- +4
    }

    sets.midcast.Cures = {
        -- +49% Cure potency without main/sub
        -- -15 Enmity
        -- -24% DT without main/sub
        main="Daybreak",
        sub="Sacro Bulwark",
        ammo="Staunch Tathlum +1",
        head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
        body={ name="Vanya Robe", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
        hands = gear.Empyrean.hands,
        legs = gear.Chironic.legs.MNDfeeble,
        feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
        neck="Incanter's Torque",
        waist="Cascade Belt",
        ear1="Mendi. Earring",
        ear2="Regal Earring",
        ring1="Murky Ring",
        ring2={name="Stikini Ring +1",bag="wardrobe2",priority=2},
        back = gear.AmbuCape.MND,
    }
    
end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- SPELL/ABILITY LISTS ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function maps()

    Cures          = S {"Cure", "Cure II", "Cure III", "Cure IV","Curaga","Curaga II","Curaga III"}
    EraseNas       = S {"Paralyna", "Stona", "Poisona", "Blindna", "Viruna", "Silena", "Cursna", "Erase"}
    Gains          = S {"Gain-STR", "Gain-DEX", "Gain-VIT", "Gain-AGI", "Gain-INT", "Gain-MND", "Gain_CHR"}
    MNDfeeble      = S {"Addle", "Addle II", "Inundation", "Paralyze", "Paralyze II", "Silence", "Slow", "Slow II"}
    INTfeeble      = S {"Bind", "Blind", "Blind II", "Distract", "Distract II", "Distract III", "Frazzle", "Frazzle II", "Frazzle III", "Gravity", "Gravity II", "Sleep", "Sleep II", "Poison", "Poison II", "Break", "Dispel", "Sleepga", "Sleepga II"}
    EnhSkill       = S {"Temper", "Temper II","Phalanx","Phalanx II",
                        "Gain-STR", "Gain-DEX", "Gain-VIT", "Gain-AGI", "Gain-INT", "Gain-MND", "Gain_CHR",
                        "Enstone", "Enstone II", "Enwater", "Enwater II", "Enaero", "Enaero II", "Enfire", "Enfire II", "Enblizzard", "Enblizzard II", "Enthunder", "Enthunder II",
                        "Barfire", "Barwater", "Barthunder", "Barstone", "Baraero", "Barblizzard", "Barparalyze", "Barpetrify", "Barpoison", "Barblind", "Barvirus", "Barsilence", "Barsleep", "Baramnesia",}
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


function precast(spell)

    self = windower.ffxi.get_mob_by_target('me')
    target = windower.ffxi.get_mob_by_target('t') or windower.ffxi.get_mob_by_target('st') or self
    distance = math.sqrt((self.x - target.x)^2 + (self.y - target.y)^2)
    weather_intensity = gearswap.res.weather[world.weather_id].intensity
    in_vagary = false -- Manually change this, or find zone name and use    in_vagary = world.zone:contains("Vagary")


    if sets.WeaponSkill[spell.name] then
        equip(sets.WeaponSkill[spell.name])
        if in_vagary then
            equip(sets.VagaryWS)
        end

    elseif spell.skill == "Enfeebling Magic" then
        equip(set_combine(sets.precast.FastCast, sets.precast.Enfeeble))
    elseif spell.skill == "Enhancing Magic" then
        equip(set_combine(sets.precast.FastCast, sets.precast.Enhancing))
    elseif spell.skill == "Elemental Magic" then
        equip(sets.precast.FastCast)
        if spell.name == "Impact" then
            equip(sets.precast.Impact)
        end
    else
        equip(sets.precast.FastCast)
    end

end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- MIDCAST FUNCTION ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


function midcast(spell)

    if spell.skill == "Healing Magic" then
        if Cures:contains(spell.english) then
            equip(sets.midcast.Cures)
            if world.weather_element == spell.element or world.day_element == spell.element then
                equip({waist="Hachirin-no-Obi"})
            end
        elseif spell.name == "Cursna" then
            equip(set_combine(sets.midcast.MNDfeeble, sets.midcast.Cursna))
        end

    elseif spell.skill == "Enfeebling Magic" then
        if MNDfeeble:contains(spell.english) then
            equip(sets.midcast.MNDfeeble)
        elseif INTfeeble:contains(spell.english) then
            equip(sets.midcast.INTfeeble)
            if spell.name == "Frazzle II" or spell.name == "Frazzle" then
                equip(sets.midcast.Frazzle2)
            end
        end

    elseif spell.skill == "Enhancing Magic" then
        if spell.target.type ~= 'SELF' then
            equip(sets.midcast.EnhancingOthers)
        else
            equip(sets.midcast.EnhancingSelf)
            if EnhSkill:contains(spell.name) then
                equip(sets.midcast.EnhancingSkill)
            end
            if spell.name == "Aquaveil" then
                equip(sets.midcast.Aquaveil)
            end
            if spell.name == "Phalanx" or spell.name == "Phalanx II" then
                equip(sets.midcast.Phalanx)
            end
        end

    elseif spell.skill == "Elemental Magic" then
        equip(sets.midcast.Nuke)
        if MagicBurstFlag == 1 then
            equip(sets.midcast.MagicBurst)
        end
        if (world.weather_element == spell.element and world.day_element == spell.element) or (world.weather_element == spell.element and weather_intensity == 2) then
            equip({waist="Hachirin-no-Obi"})
        elseif distance < 7 then
            equip({waist="Orpheus's Sash"})
        elseif world.weather_element == spell.element or world.day_element == spell.element then
            equip({waist="Hachirin-no-Obi"})
        end
        if in_vagary then
            equip(sets.VagaryBurst)
        end
        if spell.name == "Impact" then
            equip(sets.midcast.Impact)
        end
    
    elseif spell.skill == "Dark Magic" then
        if spell.name == "Absorb-TP" then
            equip(sets.midcast.AbsorbTP)
        end

    end

    if spell.name == "Dia II" or spell.name == "Dia" or spell.name == "Diaga" or spell.name == "Sleepga" then
        equip(sets.midcast.Treasure)
    end

end

function aftercast(spell)
    if player.status == 'Idle' then
        if player.mpp < 30 then
            equip(sets.status.Idle.Refresh)
        else
            equip(sets.status.Idle.DT)
        end
    elseif player.status == "Engaged" then
        if player.sub_job=="NIN" or player.sub_job=="DNC" then
            equip(sets.status.MeleeDW)
        else
            equip(sets.status.Melee)
        end
    end
end

function status_change(new,old)
    if new == "Idle" then
        if player.mpp < 30 then
            equip(sets.status.Idle.Refresh)
        else
            equip(sets.status.Idle.DT)
        end
    elseif new == "Engaged" then
        if player.sub_job=="NIN" or player.sub_job=="DNC" then
            equip(sets.status.MeleeDW)
        else
            equip(sets.status.Melee)
        end
    elseif sets.status[new] then
        equip(sets.status[new])
    end
end
