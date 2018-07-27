using Godot;
using System;

public class GameOver : Control
{
    void OnTextureButtonPressed()
    {
        // TODO make global work for C# and GDScript or change way of doing things
        GetTree().ChangeScene("res://Scenes/Levels/Level1.tscn");
    }
}
