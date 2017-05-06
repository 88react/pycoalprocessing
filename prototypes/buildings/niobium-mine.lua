local pipe_pictures = function(shift_north, shift_south, shift_west, shift_east)
    local north, south, east, west
    if shift_north then
        north =
        {
            filename = "__pycoalprocessing__/graphics/entity/niobium-mine/top.png",
            priority = "low",
            width = 231,
            height = 237,
            --shift = {0.03125, 0.3125}
            shift = shift_north
        }
    else
        north = Proto.empty_sprite
    end
    if shift_south then
        south =
        {
            filename = "__pycoalprocessing__/graphics/entity/niobium-mine/bottom.png",
            priority = "extra-high",
            width = 231,
            height = 237,
            --shift = {0.03125, -1.0625}
            shift = shift_south
        }
    else
        south = Proto.empty_sprite
    end
    if shift_west then
        west =
        {
            filename = "__pycoalprocessing__/graphics/entity/niobium-mine/left.png",
            priority = "very-low",
            width = 231,
            height = 237,
            --shift = {0.8125, 0}
            shift = shift_west
        }
    else
        west = Proto.empty_sprite
    end
    if shift_east then
        east =
        {
            filename = "__pycoalprocessing__/graphics/entity/niobium-mine/right.png",
            priority = "extra-high",
            width = 231,
            height = 237,
            --shift = {-0.78125, 0.15625}
            shift = shift_east
        }
    else
        east = Proto.empty_sprite
    end
    return {north=north, south=south, west=west, east=east}
end

-------------------------------------------------------------------------------
--[[Recipes]]--
local recipe1={
    type = "recipe",
    name = "niobium-mine",
    energy_requiered = 25,
    enabled = false,
    ingredients =
    {
        {"electric-mining-drill", 5},
        {"soil-extractormk01", 1},
        {"electronic-circuit", 30}, --updated-bob basic-electronic-circuit-board
        {"steel-plate", 30}, --updated-bob titanium-plate
        {"iron-gear-wheel", 15}, --updated-bob titanium-bearing

    },
    result= "niobium-mine",
}
-------------------------------------------------------------------------------
--[[Items]]--
local item1={
    type = "item",
    name = "niobium-mine",
    icon = "__pycoalprocessing__/graphics/icons/niobium-mine.png",
    flags = {"goes-to-quickbar"},
    subgroup = "coal-processing",
    order = "a-c[niobium-mine]",
    place_result = "niobium-mine",
    stack_size = 10,
}
-------------------------------------------------------------------------------
--[[Entites]]--
local entity1={
    type = "assembling-machine",
    name = "niobium-mine",
    icon = "__pycoalprocessing__/graphics/icons/niobium-mine.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 1, result = "niobium-mine"},
    fast_replaceable_group = "niobium-mine",
    max_health = 700,
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    collision_box = {{-3.3, -3.3}, {3.3, 3.3}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    module_specification =
    {
        module_slots = 4
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    crafting_categories = {"niobium"},
    crafting_speed = 0.3,
    energy_source =
    {
        type = "electric",
        usage_priority = "secondary-input",
        emissions = 0.05  / 3,
    },
    energy_usage = "430kW",
    ingredient_count = 4,

    animation ={
        layers={
            {
                filename = "__pycoalprocessing__/graphics/entity/niobium-mine/niobium-bottom.png",
                width = 221,
                height = 113,
                line_length = 8,
                frame_count = 136,
                animation_speed = 1,
                shift = {-0.07, 1.765},
            },
            {
                filename = "__pycoalprocessing__/graphics/entity/niobium-mine/niobium-top.png",
                width = 221,
                height = 113,
                line_length = 8,
                frame_count = 136,
                animation_speed = 1,
                shift = {-0.07, -1.765},
            },
        }
    },

    fluid_boxes =
    {
        --1
        {
            production_type = "input",
            pipe_picture = pipe_pictures({-2.9,3.9}, {3.1,-3.9}, {4.08,3.2}, {-3.9,-2.8}),
            pipe_covers = Proto.pipe_covers(true, true, true, true),
            base_area = 10,
            base_level = -1,
            pipe_connections = {{ type="input", position = {-3.0, 4.0} }}
        },

    },
    vehicle_impact_sound = { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
        sound = { filename = "__pycoalprocessing__/sounds/niobium-mine.ogg" },
        idle_sound = { filename = "__pycoalprocessing__/sounds/niobium-mine.ogg", volume = 0.85 },
        apparent_volume = 2.5,
    },
}
-------------------------------------------------------------------------------
--[[Extend Data]]--
if recipe1 then data:extend({recipe1}) end
if item1 then data:extend({item1}) end
if entity1 then data:extend({entity1}) end