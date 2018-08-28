/// @description free surfaces and sprites
if (surface_exists(pal_surface)) {
	surface_free(pal_surface)
}
if (sprite_exists(pal_sprite)) {
	sprite_delete(pal_sprite)
}