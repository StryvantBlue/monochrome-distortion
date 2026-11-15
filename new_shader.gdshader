shader_type canvas_item;

uniform float base_speed = 3.0;
uniform float density = 8.0; 
uniform float border_thickness = 0.15; // Controls how thick the hollow square outline is

float random(vec2 uv) {
    return fract(sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453123);
}

void fragment() {
    vec2 grid_uv = UV * vec2(density * 5.0, density); 
    float row_id = floor(grid_uv.y);
    float row_speed = base_speed + (random(vec2(row_id, 0.0)) * base_speed);
    
    grid_uv.x -= TIME * row_speed;
    
    vec2 square_id = floor(grid_uv);
    vec2 local_uv = fract(grid_uv); // Gets the coordinates strictly inside the current square
    
    float rand_val = random(square_id);
    float is_square = step(0.6, rand_val); 
    
    // Check if the current pixel is near the left, right, top, or bottom edge of the local square
    float is_border = step(local_uv.x, border_thickness) + 
                      step(1.0 - border_thickness, local_uv.x) + 
                      step(local_uv.y, border_thickness) + 
                      step(1.0 - border_thickness, local_uv.y);
                      
    // Clamp the value so the overlapping corners don't exceed an alpha of 1.0
    is_border = clamp(is_border, 0.0, 1.0);
    
    // Only draw the pixel if a square is supposed to exist here AND it is part of the border
    float final_alpha = is_square * is_border;
    
    COLOR = vec4(1.0, 1.0, 1.0, final_alpha);
}