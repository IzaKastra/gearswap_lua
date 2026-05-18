include("organizer-lib")

function get_sets()

    maps()

    MagicBurstFlag     = 1
    WeaponLock         = 0
    -- ! == alt
    -- ^ == ctrl

    -- send_command("bind f9 gs c free1")
    -- send_command("bind f10 gs c free2")
    send_command("bind f11 gs c equip movement")
    send_command("bind f12 gs c equip DT")

    send_command("bind ^f9 gs c equip warp")
    -- send_command("bind ^f10 gs c free4")
    -- send_command("bind ^f11 gs c free5")
    send_command("bind ^f12 gs c equip refresh")

    send_command("bind !^f9 gs c equip AoE")
    send_command("bind !^f10 gs c equip Maxentius")
    send_command("bind !^f11 gs c equip Naegling")
    -- send_command("bind !^f12 gs c equip Tizona")

    send_command("bind ^c gs c chocobo")

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

        send_command("unbind ^c")
    end

function self_command(command)

    -- player = windower.ffxi.get_player()

    if command == "equip DT" then
        equip(sets.status.DT)
        send_command("@input /echo Damage Taken set equipped.")
    end

    if command == "chocobo" then
        mounts = {"Chocobo", "Chocobo", "Chocobo", "'Noble Chocobo'", "Phuabo", "Phuabo", "Xzomit", "Warmachine", "'Spectral Chair'", "Fenrir"}
        if windower.ffxi.get_mob_by_target("me").status == 5 or windower.ffxi.get_mob_by_target("me").status == 85 then
            send_command("@input /echo Dismount")
            send_command("@input /dismount")
        elseif windower.ffxi.get_mob_by_target("me").status == 0 then
            mount = mounts[math.random(#mounts)]
            send_command("@input /echo " .. mount)
            send_command("@input /mount ".. mount)
        end
    end

    if command == "equip warp" then
        send_command("@input /equip ring2 \"Warp Ring\"")
        send_command("@input /equip main \"Warp Cudgel\"")
    end

    if command == "equip refresh" then
        equip(sets.status.Refresh)
        send_command("@input /echo Refresh set equipped.")
    end

    if command == "equip movement" then
        equip({ring2="Shneddick Ring +1"})
        send_command("@input /echo Movement+ Equipped.")
    end

    if command == "equip AoE" then
        equip({main="Naegling", sub="Bunzi's Rod"})
        send_command("@input /echo Naegling + Bunzi's Rod equipped.")
        send_command("@input /lockstyleset 34")
    end

    if command == "equip Naegling" then
        equip({main="Naegling", sub="Thibron"})
        send_command("@input /echo Naegling + Thibron equipped.")
        send_command("@input /lockstyleset 14")
    end

    if command == "equip Tizona" then
        equip({main="Tizona", sub="Thibron"})
        send_command("@input /echo Tizona + Thibron equipped.")
        send_command("@input /lockstyleset 14")
    end

    if command == "equip Maxentius" then
        equip({main="Maxentius", sub="Thibron"})
        send_command("@input /echo Maxentius + Thibron equipped.")
        send_command("@input /lockstyleset 36")
    end

end



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	gear = {}

	gear.AF = {}
	gear.AF.head  = {}
	gear.AF.body  = {}
	gear.AF.hands = {}
	gear.AF.legs  = {}
	gear.AF.feet  = {}

    gear.Relic = {}
	gear.Relic.head  = {}
	gear.Relic.body  = {}
	gear.Relic.hands = {name="Luh. Bazubands +1"} -- Azure Lore
	gear.Relic.legs  = {}
	gear.Relic.feet  = {name="Luhlaza Charuqs +1"} -- Diffusion

    gear.Empyrean = {}
	gear.Empyrean.head  = {name="Hashishin Kavuk +3"}
	gear.Empyrean.body  = {name="Hashishin Mintan +3"}
	gear.Empyrean.hands = {name="Hashi. Bazu. +3"}
	gear.Empyrean.legs  = {name="Hashishin Tayt +3"}
	gear.Empyrean.feet  = {}

	gear.AmbuCape = {}
    gear.AmbuCape.Nuke = { name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}
    gear.AmbuCape.WSD  = { name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	sets.status = {}

	sets.status.Refresh = {
        ammo="Staunch Tathlum +1",
        head="Null Masque",
		body=gear.Empyrean.body,
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Warder's Charm +1",
        waist="Null Belt",
        ear1="Etiolation Earring",
        ear2="Sanare Earring",
        ring1={name="Stikini Ring +1", bag="wardrobe", priority=1},
        ring2={name="Stikini Ring +1", bag="wardrobe2", priority=2},
        back="Shadow Mantle",
	}
    sets.status.DT = {
        ammo="Staunch Tathlum +1",
        head = "Null Masque",
		body=gear.Empyrean.body,
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Warder's Charm +1",
        waist="Null Belt",
        ear1="Etiolation Earring",
        ear2="Sanare Earring",
        ring1="Murky Ring",
        -- ring2="Shadow Ring",
        ring2="Shneddick Ring +1",
        back="Shadow Mantle",
    }

    sets.status.Melee = {
        ammo="Coiste Bodhar",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
        legs="Gleti's Breeches",
        feet="Malignance Boots",
        neck="Null Loop",
        waist="Reiki Yotai",
        ear1="Cessance Earring",
        ear2="Eabani Earring",
        ring1="Lehko's Ring",
        ring2="Epona's Ring",
        back="Null Shawl",
    }


    sets.precast = {}
    sets.midcast = {}

    -- Nyzul farming /ra
    sets.precast["Ranged Attack"] = {
        ranged="Chakram",
        ammo="Empty",
    }
    sets.midcast["Ranged Attack"] = {
        ranged="Chakram",
        ammo="Empty",
    }



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


	sets.precast.FastCast = {
        -- 47% Fast Cast
        -- 4% Quick Magic
        -- -16% Blue Magic casting time
        -- Erratic Flutter gives "Fast Cast III" for +20% Fast Cast
        ammo="Impatiens",
        head="Carmine Mask",
        body=gear.Empyrean.body,
        hands="Leyline Gloves",
        legs="Enif Cosciales",
        feet="Amalric Nails +1",
        neck="Orunmila's Torque",
        waist="Witful Belt",
        ear1="Etiolation Earring",
        ear2="Loquac. Earring",
        ring1="Lebeche Ring",
        ring2="Kishar Ring",
        back="Shadow Mantle",
    }

	sets.precast["Savage Blade"] = {
        ammo="Coiste Bodhar",
        head=gear.Empyrean.head,
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Rep. Plat. Medal",
        waist="Sailfi Belt +1",
        ear1="Moonshade Earring",
        ear2="Brutal Earring",
        ring1="Sroda Ring",
        ring2="Rufescent Ring",
        back = gear.AmbuCape.WSD,
    }

    sets.precast["Black Halo"] = sets.precast["Savage Blade"]
    sets.precast["Expiacion"] = sets.precast["Savage Blade"]
    sets.precast["Chant du Cygne"] = sets.precast["Savage Blade"]
    sets.precast["Requiescat"] = sets.precast["Savage Blade"]

    sets.precast["Azure Lore"] = {hands = gear.Relic.hands,}

	sets.precast["Sanguine Blade"] = {
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		body="Amalric Doublet +1",
		hands="Amalric Gages +1",
		legs="Amalric Slops +1",
		feet="Amalric Nails +1",
		neck="Sibyl Scarf",
		waist="Orpheus's Sash",
		ear1="Regal Earring",
		ear2="Friomisi Earring",
		ring1="Shiva Ring +1",
		ring2="Archon Ring",
		back="Null Shawl",
	}

    sets.precast["Holy Water"] = {
        neck="Nicander's Necklace",
        ring2="Purity Ring",
    }

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	sets.midcast.Nuke = {
		ammo="Pemphredo Tathlum",
		head=gear.Empyrean.head,
		-- body="Amalric Doublet +1",
		-- hands="Amalric Gages +1",
		-- legs="Amalric Slops +1",
		-- feet="Amalric Nails +1",
		body = gear.Empyrean.body,
		hands = gear.Empyrean.hands,
		legs = gear.Empyrean.legs,
		feet="Amalric Nails +1",
		neck="Sibyl Scarf",
		waist="Orpheus's Sash",
		ear1="Regal Earring",
		ear2="Friomisi Earring",
        ring1="Metamor. Ring +1",
		ring2="Shiva Ring +1",
		back="Null Shawl",
	}
	sets.midcast.DarkAffinity = {
		ring1="Archon Ring",
		head="Pixie Hairpin +1",
	}
	sets.midcast.LightAffinity = {
		ring1="Weather. Ring +1",
	}
	sets.midcast.EarthAffinity = {
		neck = "Quanpur Necklace",
	}

    sets.midcast.Healing = {
        ammo="Crepuscular Pebble",
        head="Null Masque",
        body="Hashishin Mintan +3",
        hands="Nyame Gauntlets",
        legs="Gyve Trousers",
        feet="Nyame Sollerets",
        neck="Orunmila's Torque",
        waist="Sacro Cord",
        ear1="Regal Earring",
        ear2="Loquac. Earring",
        ring1={name="Stikini Ring +1", bag="wardrobe", priority=1},
        ring2={name="Stikini Ring +1", bag="wardrobe2", priority=2},
        back="Shadow Mantle",
    }

    sets.midcast.MagicAccuracy = {
        ammo="Pemphredo Tathlum",
        head = gear.Empyrean.head,
        body = gear.Empyrean.body,
        hands="Malignance Gloves",
        legs="Amalric Slops +1",
        feet="Malignance Boots",
        neck="Null Loop",
        waist="Null Belt",
        ear1="Digni. Earring",
        ear2="Crep. Earring",
        ring1={name="Stikini Ring +1", bag="wardrobe", priority=1},
        ring2={name="Stikini Ring +1", bag="wardrobe2", priority=2},
        back="Null Shawl",
    }

    sets.midcast.BlueSkill = {
        -- +67 Blue Magic skill
        legs = gear.Empyrean.legs,
        feet = gear.Relic.feet,
        neck="Incanter's Torque",
        ring1={name="Stikini Ring +1", bag="wardrobe", priority=1},
        ring2={name="Stikini Ring +1", bag="wardrobe2", priority=2},
    }

end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function maps()

    -- Monster correlation effects: +25% damage/effect against strength, -25% against weakness
    -- Not always present
    -- Beast > Lizard > Vermin > Plantoid > Beast
    -- Bird > Aquan > Amorph > Bird
    -- Demon > Dragon > Demon
    -- Undead > Arcana > Undead

    Healing = S {"Cure", "Cure II", "Cure III", "Cure IV", "Magic Fruit", "Wild Carrot", "Pollen", "White Wind", "Healing Breeze", "Restoral", "Plenilune Embrace",}
    Enfeebles = S {
        "Sudden Lunge", "Blitzstrahl", "Whirl of Rage", "Tail Slap", "Frypan", "Head Butt", "Thunderbolt", -- Stun
        "Cruel Joke", "Mortal Ray", -- Doom
        "Dream Flower", "Sheep Song", "Soporific", "Yawn", -- Sleep
        "Enervation", "Benthic Typhoon", -- Defense and Magic Defense down
        "Corrosive Ooze", -- Attack and Defense down
        "Maelstrom", "Awful Eye", -- STR down
        "Stinking Gas", "Wild Oats", -- VIT down
        "Cold Wave", -- AGI down
        "Battle Dance", -- DEX down
        "Sound Blast", -- INT down
        "Geist Wall", "Blank Gaze", "Rending Deluge", "Droning Whirlwind", -- Dispel
        "Actinic Burst", "Sandspray", "Sandspin", "Barbed Crescent", "Spiral Spin", -- Accuracy Down 
        "Retinal Glare", -- Flash
        "Water Bomb", "Silent Storm", "Chaotic Eye", -- Silence
        "Acrid Scream", "Tearing Gust", -- Magic Defense down
        "Frightful Roar", "Sweeping Gouge", "Seedspray", "Tourbillion", -- Defense Down
        "Magic Hammer", -- MP Steal
        "Demoralizing Roar", "Saurian Slide", "Terror Touch", -- Attack down
        "Infrasonics", -- Evasion down
        "Regurgitation", "Ice Break", "Blast Bomb", "Polar Roar", -- Bind
        "Bilgestorm", -- Attack, Defense, and Accuracy down
        "Mind Blast", "Frost Breath", "Paralyzing Triad", "Sub-zero Smash", -- Paralyze
        "Temporal Shift", -- Stop, Terror, or Petrify
        "Absolute Terror", -- Terror
        "Embalming Earth", "Cimicine Discharge", "Filimented Hold", "Sprout Smack", -- Slow
        "Magnetite Cloud", "Mysterious Light", -- Gravity
        "Bad Breath", -- Everything
        "Radiant Breath", -- Slow and Silence
        "Auroral Drape", -- Silence and Blind
        "Thermal Pulse", "Hecatomb Wave", -- Blind
        "Lowing", -- Disease
        "Delta Thrust", "Cesspool", -- Plague
        "Voracious Trunk", -- Steal buff / dispel
        "Hydro Shot", -- Enmity down
        "Light of Penance", "Feather Tickle", "Reaving Wind", -- Reduce TP
        "Palling Salvo", -- Bio
    }

    FastCast = S {"Exuviation", "Winds of Promyvion"}

    Enhancing = S {
        "Erratic Flutter", "Battery Charge", "Barrier Tusk", "Diamondhide", "Cocoon",
        "Mighty Guard", "Uproot", "Harden Shell", "Carcharian Verve",
        "Saline Coat", "Regeneration", "Amplification", "Plasma Charge",
        "Warm-Up", "Metallic Body", "Animating Wail", "Zephyr Mantle", "Feather Barrier",
        "Refueling", "Reactor Cool", "Memento Mori", "Nat. Meditation", "O. Counterstance", 
        "Fantod", "Exuviation", "Triumphant Roar", 
    }

    BlueSkill = S {
        "Magic Barrier", "Occultation", "Pinecone Bomb", "Blood Drain", "Digest", "MP Drainkiss",
        "Blood Saber", "Osmosis", "Atra. Libations",
    }

end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function precast(spell)
    
	if sets.precast[spell.name] then
        equip(sets.precast[spell.name])
    elseif spell.type:contains("Magic") or spell.type=="Trust" or spell.type=="Ninjutsu" then
        equip(sets.precast.FastCast)
    elseif spell.type=="WeaponSkill" then
        equip(sets.precast["Savage Blade"])
    end

end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


function midcast(spell)

    weather_intensity = gearswap.res.weather[world.weather_id].intensity

    if sets.midcast[spell.name] then
        equip(set_combine(sets.status.DT, sets.midcast[spell.name]))

    elseif spell.type=="Trust" then
        equip(sets.status.DT)
    
    elseif Healing:contains(spell.name) then
        equip(sets.midcast.Healing)

	elseif Enfeebles:contains(spell.name) then
		equip(sets.midcast.MagicAccuracy)

    elseif BlueSkill:contains(spell.name) then
        equip(set_combine(sets.status.DT, sets.midcast.BlueSkill))

    elseif spell.skill=="Blue Magic" or spell.skill=="Elemental Magic" then
		equip(sets.midcast.Nuke)

		if spell.element == "Dark" then
			equip(sets.midcast.DarkAffinity)
        elseif spell.element == "Light" then
			equip(sets.midcast.LightAffinity)
        elseif spell.element == "Earth" then
			equip(sets.midcast.EarthAffinity)
		end

        if (world.weather_element == spell.element and world.day_element == spell.element) or (world.weather_element == spell.element and weather_intensity == 2) then
            equip({waist="Hachirin-no-Obi"})
        end

	elseif spell.type ~= "WeaponSkill" then
        equip(sets.status.DT)
    end

    if buffactive["Diffusion"] and spell.skill=="Blue Magic" then
        equip({feet = gear.Relic.feet})
    end

end

function aftercast(spell)

    if player.status == "Idle" then
        equip(sets.status.DT)
        if player.mpp < 50 then
           equip(sets.status.Refresh)
        end
    elseif player.status == "Engaged" then
        equip(sets.status.Melee)
	end
end

function status_change(new,old)
	if new == "Idle" then
        equip(sets.status.DT)
	elseif new == "Engaged" then
        equip(sets.status.Melee)
	end
end
