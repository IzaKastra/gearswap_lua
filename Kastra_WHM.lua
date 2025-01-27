include("organizer-lib")
enable("main", "sub", "ranged")

function file_unload()
    send_command("unbind f9")
    send_command("unbind f10")
    send_command("unbind f11")
    send_command("unbind f12")
    send_command("unbind ^f9")
    send_command("unbind ^f10")
    send_command("unbind ^f11")
    send_command("unbind ^f12")
    send_command("unbind !f9")
    send_command("unbind !f10")
    send_command("unbind !f11")
    send_command("unbind !f12")
    send_command("unbind !^f9")
    send_command("unbind !^f10")
    send_command("unbind !^f11")
    send_command("unbind !^f12")
end

function get_sets()

    maps()
    
    WeaponLock = 0

    send_command("bind f11 gs c equip Criers")
    send_command("bind f12 gs c Equip DT")

    send_command("bind ^f12 gs c Equip Refresh")

    send_command("bind !^f9 gs c Mjollnir")
    send_command("bind !^f10 gs c Maxentius")
    send_command("bind !^f11 gs c Yagrush")
    send_command("bind !^f12 gs c toggle WeaponLock")

end


function self_command(command)

    if command == "toggle WeaponLock" then
        if WeaponLock == 0 then
            WeaponLock = 1
            send_command("@input //gs disable main sub ranged")
        elseif WeaponLock == 1 then
            WeaponLock = 0
            send_command("@input //gs enable main sub ranged")
            enable("main", "sub", "ranged")
        end
    end

    if command == "Mjollnir" then
        if WeaponLock == 1 then
            enable("main", "sub", "ranged")
        end
        equip({main="Mjollnir"})
        if player.sub_job=="NIN" or player.sub_job=="DNC" then
            equip({sub="Sindri"})
        else
            equip({sub="Genmei Shield"})
        end
        if WeaponLock == 1 then
            disable("main", "sub", "ranged")
        end
        send_command("@input /echo Mjollnir equipped.")
    end

    if command == "Maxentius" then
        if WeaponLock == 1 then
            enable("main","sub","ranged")
        end
        equip({main="Maxentius"})
        if player.sub_job=="NIN" or player.sub_job=="DNC" then
            equip({sub="Sindri"})
        else
            equip({sub="Genmei Shield"})
        end
        if WeaponLock == 1 then
            disable("main", "sub", "ranged")
        end
        send_command("@input /echo Maxentius equipped.")
    end

    if command == "Yagrush" then
        if WeaponLock == 1 then
            enable("main", "sub", "ranged")
        end
        equip({main="Yagrush"})
        if player.sub_job=="NIN" or player.sub_job=="DNC" then
            equip({sub="Sindri"})
        else
            equip({sub="Genmei Shield"})
        end
        if WeaponLock == 1 then
            disable("main", "sub", "ranged")
        end
        send_command("@input /echo Yagrush equipped.")
    end

    if command == "Equip DT" then
        equip(sets.status.Idle.DT)
        send_command("@input /echo Damage Taken idle set equipped.")
    end
    if command == "Equip Refresh" then
        equip(sets.status.Idle.Refresh)
        send_command("@input /echo Refresh idle set equipped.")
    end

    if command == "equip Criers" then
        equip({feet="Crier's Gaiters"})
        send_command("@input /echo Crier\'s Gaiters Equipped.")
    end

end


    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    gear = {}

    gear.Artifact = {}
    gear.Artifact.head  = {}
    gear.Artifact.body  = {}
    gear.Artifact.hands = { name="Theophany Mitts +3"}
    gear.Artifact.legs  = { name="Th. Pant. +3"}
    gear.Artifact.feet  = { name="Theo. Duckbills +3"}

    gear.Relic = {}
    gear.Relic.head  = { name="Piety Cap +3", augments={'Enhances "Devotion" effect',}}
    gear.Relic.body  = { name="Piety Bliaut +3", augments={'Enhances "Benediction" effect',}}
    gear.Relic.hands = { name="Piety Mitts +3", augments={'Enhances "Martyr" effect',}}
    gear.Relic.legs  = { name="Piety Pantaln. +3", augments={'Enhances "Afflatus Misery" effect',}}
    gear.Relic.feet  = { name="Piety Duckbills +3", augments={'Enhances "Afflatus Solace" effect',}}

    gear.Empyrean = {}
    gear.Empyrean.head  = { name="Ebers Cap +2"}
    gear.Empyrean.body  = { name="Ebers Bliaut +2"}
    gear.Empyrean.hands = { name="Ebers Mitts +2"}
    gear.Empyrean.legs  = { name="Ebers Pant. +3"}
    gear.Empyrean.feet  = { name="Ebers Duckbills +3"}

    gear.AmbuCape = {}
    gear.AmbuCape.Idle = { name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10','Damage taken-5%',}}
    gear.AmbuCape.FC   = { name="Alaunus's Cape", augments={'"Fast Cast"+10',}}
    gear.AmbuCape.TP   = { name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
    gear.AmbuCape.WSD  = { name="Alaunus's Cape", augments={'MND+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}

    gear.Telchine = {}
    gear.Telchine.head  = { name="Telchine Cap", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}}
    gear.Telchine.body  = { name="Telchine Chas.", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}}
    gear.Telchine.hands = { name="Telchine Gloves", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +9',}}
    gear.Telchine.legs  = { name="Telchine Braconi", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}}
    gear.Telchine.feet  = { name="Telchine Pigaches", augments={'"Fast Cast"+5','Enh. Mag. eff. dur. +10',}}


    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


    sets.status = {}

    sets.status.Idle = {}
    sets.status.Idle.DT = {
        main="Daybreak",
        sub="Genmei Shield",
        ammo="Homiliary",
        head="Null Masque",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Warder's Charm +1",
        waist="Null Belt",
        ear1="Etiolation Earring",
        ear2="Ebers Earring +1",
        ring1="Defending Ring",
        ring2="Shadow Ring",
        back=gear.AmbuCape.Idle,
    }
    sets.status.Idle.Refresh = {
        main="Daybreak",
        sub="Genmei Shield",
        ammo="Homiliary",
        head="Null Masque",
        body = gear.Empyrean.body,
        hands="Inyanga Dastanas +2",
        legs="Volte Brais",
        feet="Inyan. Crackows +2",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Null Belt",
        ear1="Etiolation Earring",
        ear2="Ebers Earring +1",
        ring1={name="Stikini Ring +1",bag="wardrobe",priority=1},
        ring2={name="Stikini Ring +1",bag="wardrobe2",priority=2},
        back=gear.AmbuCape.Idle,
    }

    sets.Melee = {
        ranged=Empty,
        ammo="Amar Cluster",
        head="Bunzi's Hat",
        body="Nyame Mail",
        hands="Bunzi's Gloves",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Combatant's Torque",
        waist="Windbuffet Belt +1",
        ear1="Cessance Earring",
        ear2="Telos Earring",
        ring1={name="Chirich Ring +1",bag="wardrobe",priority=1},
        ring2="Lehko's ring",
        back="Null Shawl",
    }


    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


    sets.precast = {}
    sets.precast.FastCast = {
        -- +72% fast cast, +11% Quick Cast
        ammo="Impatiens", -- 0%, 2%
        head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}}, -- 10%, 0%
        body="Inyanga Jubbah +2", -- 14%, 0%
        hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +10','"Conserve MP"+7','"Fast Cast"+7',}}, -- 7%, 0%
        legs="Volte Brais", -- 8%, 0%
        feet="Volte Gaiters", -- 6%, 0%
        neck="Orunmila's Torque", -- 5%, 0%
        waist="Witful Belt", -- 3%, 3%
        ear1="Etiolation Earring", -- 1%, 0%
        ear2="Loquac. Earring", -- 2%, 0%
        ring1="Weather. Ring +1", -- 6%, 4%
        ring2="Lebeche Ring", -- 0%, 2%
        back=gear.AmbuCape.FC, -- 10%
    }

    sets.precast.Healing = {
        main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
        head = gear.Relic.head,
        legs = gear.Empyrean.legs,
        ear1="Nourish. Earring +1",
    }

    sets.precast.Benediction = {body = gear.Relic.body}
    sets.precast.Devotion = {head = gear.Relic.head}

    sets.precast.Dispelga = set_combine(sets.precast.FastCast, {main="Daybreak"})
    sets.precast.Impact = set_combine(sets.precast.FastCast, {head="Empty", body="Crepuscular Cloak",})


    sets.WeaponSkill = {}
    sets.WeaponSkill["Randgrith"] = {
        ammo="Oshasha's Treatise",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Rep. Plat. Medal",
        waist="Grunfeld Rope",
        ear1="Brutal Earring",
        ear2="Telos Earring",
        ring1="Shukuyu Ring",
        ring2={name="Chirich Ring +1",bag="wardrobe2",priority=1},
        back=gear.AmbuCape.WSD,
    }
    sets.WeaponSkill["Realmrazer"] = {
        ammo="Oshasha's Treatise",
        head="Piety Cap +3",
        body="Nyame Mail",
        hands="Bunzi's Gloves",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        ear1="Malignance Earring",
        ear2="Regal Earring",
        ring1="Rufescent Ring",
        ring2="Metamor. Ring +1",
        back="Alaunus's Cape",
        back=gear.AmbuCape.WSD,
    }
    sets.WeaponSkill["Black Halo"] = {
        ammo="Oshasha's Treatise",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Rep. Plat. Medal",
        waist="Grunfeld Rope",
        ear1="Moonshade Earring",
        ear2="Regal Earring",
        ring1="Shukuyu Ring",
        ring2="Metamor. Ring +1",
        back=gear.AmbuCape.WSD,
    }
    sets.WeaponSkill["Mystic Boon"] = {
        ammo="Oshasha's Treatise",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Rep. Plat. Medal",
        waist="Fotia Belt",
        ear1="Brutal Earring",
        ear2="Moonshade Earring",
        ring1="Shukuyu Ring",
        ring2="Metamor. Ring +1",
        back=gear.AmbuCape.WSD,
    }
    sets.WeaponSkill["Seraph Strike"] = {
        ammo="Oshasha's Treatise",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Null Loop",
        waist="Orpheus's Sash",
        ear1="Moonshade Earring",
        ear2="Malignance Earring",
        ring1="Weather. Ring +1",
        ring2="Freke Ring",
        back=gear.AmbuCape.WSD,
    }
    sets.WeaponSkill["Judgment"] = {
        ammo="Oshasha's Treatise",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Rep. Plat. Medal",
        waist="Prosilio Belt +1",
        ear1="Moonshade Earring",
        ear2="Regal Earring",
        ring1="Shukuyu Ring",
        ring2="Rufescent Ring",
        back=gear.AmbuCape.WSD,
    }
    sets.WeaponSkill["True Strike"] = {
        ammo="Crepuscular Pebble",
        head="Blistering Sallet +1",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        ear1="Brutal Earring",
        ear2="Mache Earring +1",
        ring1="Hetairoi Ring",
        ring2="Rufescent Ring",
        back=gear.AmbuCape.WSD,
    }

    sets.WeaponSkill["Hexa Strike"] = {
        ammo="Amar Cluster",
        head="Blistering Sallet +1",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        ear1="Moonshade Earring",
        ear2="Telos Earring",
        ring1="Begrudging Ring",
        ring2="Lehko's ring",
        back=gear.AmbuCape.WSD,
    }

    sets.Treasure = {
        head="Volte Cap",
        hands="Volte Bracers",
        feet="Volte Boots",
        waist="Chaac Belt",
        ammo="Perfect Lucky Egg"
    }


    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


    sets.midcast = {}

    sets.midcast.Cures = {
        -- +51% Cure Potency, +6% Cure Potency II, +225 MND, +141 VIT, -45 Enmity, -45% PDT
        main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
        sub="Genmei Shield",
        ammo="Staunch Tathlum +1",
        head = gear.Empyrean.head,
        body = gear.Empyrean.body,
        hands = gear.Artifact.hands,
        legs = gear.Empyrean.legs,
        feet = gear.Relic.feet,
        neck="Cleric's Torque",
        waist="Emphatikos Rope",
        ear1="Glorious Earring",
        ear2="Ebers Earring +1",
        ring1="Defending Ring",
        ring2="Lebeche Ring",
        back = gear.AmbuCape.Idle,
    }

    sets.midcast.Enfeeble = {
        main="Daybreak",
        sub="Ammurapi Shield",
        ammo="Pemphredo Tathlum",
        head = gear.Empyrean.head,
        body = gear.Empyrean.body,
        hands = gear.Relic.hands,
        legs={ name="Chironic Hose", augments={'Mag. Acc.+26','MND+10',}},
        feet = gear.Artifact.feet,
        neck="Null Loop",
        waist="Null Belt",
        ear1="Malignance Earring",
        ear2="Regal Earring",
        ring1="Stikini Ring +1",
        ring2={ name="Metamor. Ring +1", augments={'Path: A',}},
        back="Null Shawl",
    }

    sets.midcast.Enhancing = {
        main="Beneficus",
        sub="Ammurapi Shield",
        ammo="Pemphredo Tathlum",
        head = gear.Telchine.head,
        body = gear.Telchine.body,
        hands = gear.Telchine.hands,
        legs = gear.Relic.legs,
        feet = gear.Artifact.feet,
        neck="Incanter's Torque",
        waist="Embla Sash",
        ear1="Mimir Earring",
        ear2="Regal Earring",
        ring1={name="Stikini Ring +1",bag="wardrobe",priority=1},
        ring2={name="Stikini Ring +1",bag="wardrobe2",priority=2},
        back={ name="Mending Cape", augments={'Healing magic skill +2','Enha.mag. skill +10','Mag. Acc.+1',}},
    }

    sets.midcast.EnhancingDuration = {
        sub="Ammurapi Shield",         -- +10%
        head = gear.Telchine.head,     -- +9%
        body = gear.Telchine.body,     -- +10%
        hands = gear.Telchine.hands,   -- +8%
        legs = gear.Telchine.legs,     -- +8%
        feet = gear.Artifact.feet,           -- +10%
        waist="Embla Sash",            -- +10%
    }

    sets.midcast.Cursna = {
        -- 33% Fast Cast, 29% Haste, +75 Cursna, +122 Healing Skill
        ammo="Sapience Orb",
        head="Ebers Cap +2",
        body="Ebers Bliaut +2",
        hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +10','"Conserve MP"+7','"Fast Cast"+7',}},
        legs={ name="Piety Pantaln. +3", augments={'Enhances "Afflatus Misery" effect',}},
        feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
        neck="Incanter's Torque",
        waist="Cornelia's Belt",
        ear1="Malignance Earring",
        ear2={ name="Ebers Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Damage taken-5%',}},
        ring1="Haoma's Ring",
        ring2="Haoma's Ring",
        back = gear.AmbuCape.FC,
    }

    sets.midcast.EraseNa = {
        main="Yagrush",
        head = gear.Empyrean.head,
        hands = gear.Empyrean.hands,
        neck="Cleric's Torque",
        back={ name="Mending Cape", augments={'Healing magic skill +2','Enha.mag. skill +10','Mag. Acc.+1',}},
    }

    sets.midcast.Regens = {
        main="Bolelabunga",
        head="Inyanga Tiara +2",
        body = gear.Relic.body,
        legs = gear.Artifact.legs,
        hands = gear.Empyrean.hands,
    }

    -- sets.midcast.Stoneskin = {
    --     neck="Nodens Gorget",
    --     -- legs="Shedir Seraweels",
    --     waist="Siegel Sash",
    -- }

    sets.midcast.Aquaveil = {
        -- main="Vadose Rod",
        head="Chironic Hat",
        -- hands="Regal Cuffs",
        -- legs="Shedir Seraweels",
        waist="Emphatikos Rope",
    }

    sets.midcast.Nuke = {
        main={ name="Bunzi's Rod", augments={'Path: A',}},
        sub="Ammurapi Shield",
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        body="Crepuscular Cloak",
        hands={ name="Bunzi's Gloves", augments={'Path: A',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Null Loop",
        waist="Sacro Cord",
        ear1="Malignance Earring",
        ear2="Regal Earring",
        ring1="Freke Ring",
        ring2={ name="Metamor. Ring +1", augments={'Path: A',}},
        back = gear.AmbuCape.Idle,
    }

    sets.midcast.UndeadBanish = {
        -- main="Mes'yohi Rod",
        -- head="Ipoca Beret",
        hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +10','"Conserve MP"+7','"Fast Cast"+7',}},
    }
    
    sets.midcast.Dispelga = set_combine(sets.midcast.Enfeeble, {main="Daybreak"})
    sets.midcast.Impact = set_combine(sets.midcast.Enfeeble, {head="Empty", body="Crepuscular Cloak",})


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


function maps()

    Cures          = S {"Cure", "Cure II", "Cure III", "Cure IV", "Cure V", "Cure VI", "Curaga", "Curaga II", "Curaga III", "Curaga IV", "Curaga V", "Cura", "Cura II", "Cura III"}
    EraseNas       = S {"Paralyna", "Stona", "Poisona", "Blindna", "Viruna", "Silena", "Erase", "Cursna", "Erase"}
    Regens         = S {"Regen", "Regen II", "Regen III", "Regen IV"}
    HighCost       = S {"Raise", "Raise II", "Raise III", "Arise", "Reraise", "Reraise II", "Reraise III", "Reraise IV"}
    Banishes       = S {"Banish", "Banish II", "Banish III", "Banishga", "Banishga II", "Holy"}
    TreasureHunter = S {"Dia", "Dia II", "Diaga",}
    Barspells      = S {"Barfira", "Barwatera", "Barthundra", "Barstonra", "Baraera", "Barblizzara", "Barparalyna", "Barpetra", "Barpoisonra", "Barblindra", "Barvira", "Barsilencra", "Barsleepra", "Baramnesra"}
    DurationSpells = S {"Haste", "Protectra V", "Shellra V", "Protect V", "Shell V", "Haste", "Aurorastorm", "Voidstorm", "Firestorm", "Rainstorm", "Thunderstorm", "Sandstorm", "Windstorm", "Hailstorm"}

end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


function precast(spell)
    if sets.precast[spell.name] then
            equip(sets.precast[spell.name])
    elseif spell.skill == "Healing Magic" then
        equip(set_combine(sets.precast.FastCast, sets.precast.Healing))
    elseif sets.WeaponSkill[spell.name] then
        equip(sets.WeaponSkill[spell.name])
    else
        equip(sets.precast.FastCast)
    end
end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


function midcast(spell)
    if sets.midcast[spell.name] then
        equip(sets.midcast[spell.name])

    elseif spell.skill == "Healing Magic" then
        if Cures:contains(spell.name) then
            equip(sets.midcast.Cures)
            if world.weather_element == spell.element or world.day_element == spell.element then
                equip({waist="Hachirin-no-Obi"})
            end
        elseif spell.name == "Cursna" then
            equip(sets.midcast.Cursna)
        elseif EraseNas:contains(spell.name) then
            equip(sets.midcast.EraseNa)
        end

    elseif spell.skill == "Enhancing Magic" then
        if EraseNas:contains(spell.name) then
            equip(sets.midcast.EraseNa)
        elseif spell.name == "Auspice" then
            equip(set_combine(sets.midcast.EnhancingDuration, {feet = gear.Empyrean.feet}))
        elseif Regens:contains(spell.name) then
            equip(set_combine(sets.midcast.EnhancingDuration, sets.midcast.Regens))
        elseif Barspells:contains(spell.name) then
            equip(sets.midcast.Enhancing)
        elseif DurationSpells:contains(spell.name) then
            equip(sets.midcast.EnhancingDuration)
        else
            equip(sets.midcast.Enhancing)
        end

    elseif spell.skill == "Enfeebling Magic" then
        equip(sets.midcast.Enfeeble)

    elseif spell.skill == "Divine Magic" then
        if Banishes:contains(spell.name) then
            equip(set_combine(sets.midcast.Nuke, sets.midcast.UndeadBanish))
            if world.weather_element == spell.element or world.day_element == spell.element then
                equip({waist="Hachirin-no-Obi"})
            end
        else
            equip(sets.midcast.Enfeeble)
        end

    elseif spell.skill == "Elemental Magic" then
        equip(sets.midcast.Nuke)
    end

    if TreasureHunter:contains(spell.name) then
        equip(sets.Treasure)
    end

end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function aftercast(spell)
    if player.status == "Idle"  then
        equip(sets.status.Idle.DT)
        if buffactive["Sublimation: Activated"] then
            equip({waist="Embla Sash"})
        end
        elseif player.status == "Engaged" then
        equip(sets.Melee)
    end
end

function status_change(new,old)
    if player.status == "Idle"  then
        equip(sets.status.Idle.DT)
        if buffactive["Sublimation: Activated"] then
            equip({waist="Embla Sash"})
        end
        elseif player.status == "Engaged" then
        equip(sets.Melee)
    end
end
