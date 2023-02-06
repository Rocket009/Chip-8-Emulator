#include "../include/Chip-8.h"
#include <raylib.h>

#define SCREEN_SCALE 10
#define DELAY_MS (1 / CLOCKSPEED) * 1000
#define WINDOWHEIGHT VIDEOHEIGHT * SCREEN_SCALE
#define WINDOWWIDTH VIDEOWIDTH * SCREEN_SCALE

int main(int argc, char* argv)
{
    if(argc == 1)
    {
        
    }
    
    
    
    InitWindow(VIDEOWIDTH * SCREEN_SCALE, VIDEOHEIGHT * SCREEN_SCALE, "Chip-8 Emulator");
    
    uint32_t *Chip8vram = Chip8init();

    Texture2D texture;
    texture.format = PIXELFORMAT_UNCOMPRESSED_R8G8B8A8;
    texture.height = VIDEOHEIGHT;
    texture.width = VIDEOWIDTH;

    while(!WindowShouldClose())
    {
        if(Fetch_Instruction() != 0) return 1;
        
        UpdateTexture(texture, Chip8vram);

        BeginDrawing();
            DrawTexture(texture, WINDOWWIDTH/2 , WINDOWHEIGHT/2, WHITE);
        EndDrawing();
    }

    Chip8quit();
    CloseWindow();
    return 0;
}