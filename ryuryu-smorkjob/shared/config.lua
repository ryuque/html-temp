Config = {}

Config.Jobname = "smorkjob"
Config.Jobgrade = 3

Config = {

    Bossmenue = {
        Zone={ coords = vector3(0, 0, 0), radius = 2.0, debug = false, TargetLabel = "ボスメニュー"},
    },

    Duty = {
        Zone = { coords = vector3(0, 0, 0), radius = 0.5, debug = false, TargetLabel = "勤務開始"},
    },

    Sink = {
        Zone = {coords = vector3(0, 0, 0), radius = 2.0, debug = false, TargetLabel = "洗い場"},
        Craft = {
            id = Config.Jobname.."Sink",
            title = "洗い場",
            options = {
                {
                    Title = "コーヒーカップを洗う",
                    description = "必要アイテム: 汚れたコーヒーカップ",
                    image = "https://i.imgur.com/qZHnlrn.png",
                    metadata = {""},
                    RequiredItems = {
                        { item = "coffee_cup_dirty", count = 1, remove = true },
                    },
                    AddItems = {
                        { item = "coffee_cup ", count = 1 },
                    }
                },






            },
        },
    },


    Crafting1 = {
        Zone = {coords = vector3(0, 0, 0), radius = 2.0, debug = false, TargetIcon = "fas fa-warehouse", TargetLabel = "洗い場"},
    },

    Stashes = {
        Stash1 = {
            name = Config.Jobname.."stash1",
            label = "Stash #1",
            TargetIcon = "fas fa-warehouse",
            TargetLabel = "Stash",
            Slots = 400,
            Weight = 2000000, -- 200 KG
            coords = vector3(0, 0, 0),
            radius = 0.4,
            debug = false,
        },
    }











} 