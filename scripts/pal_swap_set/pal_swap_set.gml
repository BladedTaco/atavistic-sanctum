/// @description pal_swap_set(palette_sprite_index, palette_index,palette is surface);
/// @function pal_swap_set
/// @param palette_sprite_index
/// @param  palette_index
/// @param palette_is_surface
shader_set(global.pal_shader);
var _pal_sprite=argument[0];
var _pal_index=argument[1];

if(!argument[2]) { //Using a sprite based palette
    var tex = sprite_get_texture(_pal_sprite, 0);
    var UVs = sprite_get_uvs(_pal_sprite, 0);
    
    texture_set_stage(global.pal_texture, tex);
    gpu_set_texfilter_ext(global.pal_texture, 1)
    
    var texel_x = texture_get_texel_width(tex);
    var texel_y = texture_get_texel_height(tex);
    var texel_hx = texel_x * 0.5;
    var texel_hy = texel_y * 0.5;
    
    shader_set_uniform_f(global.pal_texel_size, texel_x, texel_y);
    shader_set_uniform_f(global.pal_uvs, UVs[0] + texel_hx, UVs[1] + texel_hy, UVs[2] + texel_hx, UVs[3] + texel_hy);
    shader_set_uniform_f(global.pal_index, _pal_index);
} else { //Using a surface based palette
    var tex = surface_get_texture(_pal_sprite);
    
    texture_set_stage(global.pal_texture, tex);
    gpu_set_texfilter_ext(global.pal_texture, 1)
    
    var texel_x = texture_get_texel_width(tex);
    var texel_y = texture_get_texel_height(tex);
    var texel_hx = texel_x * 0.5;
    var texel_hy = texel_y * 0.5;
    
    shader_set_uniform_f(global.pal_texel_size, texel_x, texel_y);
    shader_set_uniform_f(global.pal_uvs, texel_hx, texel_hy, 1.0+texel_hx, 1.0+texel_hy);
    shader_set_uniform_f(global.pal_index, _pal_index);
}
