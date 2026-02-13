shader_type canvas_item;

// --- Parámetros ajustables ---
uniform float size : hint_range(1.0, 100.0) = 25.0;
uniform float speed : hint_range(0.0, 10.0) = 1.0;
uniform float direction_x : hint_range(-1.0, 1.0) = 1.0;
uniform float direction_y : hint_range(-1.0, 1.0) = 1.0;

// --- Texturas ---
uniform sampler2D background_texture;
uniform sampler2D tile_texture1;
uniform sampler2D tile_texture2;

// --- Tamaño actual de la pantalla (enviado desde GDScript) ---
uniform vec2 screen_size;

void fragment() {
    // Coordenadas de píxel normalizadas al tamaño de pantalla
    vec2 uv = FRAGCOORD.xy / screen_size;

    // Color base del fondo
    vec4 bg_color = texture(background_texture, uv);

    // Posición base para los tiles, ajustada a la escala deseada
    vec2 pos = (FRAGCOORD.xy / screen_size.x) * (100.0 / size);
    float time_offset = TIME * speed;

    // Movimiento direccional del patrón
    vec2 direction = normalize(vec2(direction_x, direction_y));
    vec2 movement = direction * time_offset;
    pos -= movement;

    // Calcular índice de tile y coordenada dentro del tile
    vec2 tile_index = floor(pos);
    vec2 tile_uv = fract(pos);

    // Patrón alternante tipo tablero
    float pattern_mask = mod(tile_index.x + mod(tile_index.y, 2.0), 2.0);

    // Elegir textura del tile según el patrón
    vec4 tile_color = mix(
        texture(tile_texture1, tile_uv),
        texture(tile_texture2, tile_uv),
        pattern_mask
    );

    // Mezclar el fondo con los tiles
    COLOR = mix(bg_color, tile_color, tile_color.a);
}
