/// @description pal_swap_init_system(shader,enable indexing <optional>)
/// @function pal_swap_init_system
/// @param shader
/// @param enable indexing <optional>
//Initiates the palette system.  Call once at the beginning of your game somewhere.
//---
//Enabiling "indexing" allows you to use pal_swap_get_pal_color() which will return the rgb color
//of the given palette.  Additionally, that palette must be indexed.  This is not really recommended,
//but if you need it, it's there.

global.pal_shader = argument[0];
global.pal_texel_size = shader_get_uniform(argument[0], "texel_size");
global.pal_uvs = shader_get_uniform(argument[0], "palette_UVs");
global.pal_index = shader_get_uniform(argument[0], "palette_index");
global.pal_texture = shader_get_sampler_index(argument[0], "palette_texture");

if(argument_count>1 && argument[1])
{
    global.pal_map = ds_map_create();
}
