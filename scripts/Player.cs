using Godot;
using System;

public class Player : KinematicBody2D
{
    // constants
    float SPEED = 750f;
    float GRAVITY = 3600;
    float JUMP_SPEED = -1750f;
    float JUMP_BOOST = 2f;
    Vector2 FLOOR_DIRECTION = new Vector2(0,-1);
    int LEVEL_HEIGHT = 2500;  // in pixels
    float FRICTION = 0.2f;

    // configuration parameters, consider SO
     
    // private instance variables for state
    Vector2 motion = new Vector2();

    // cached references for readability

    // messages, then public methods, then private methods...
    public override void _Ready()
    {
        // Called every time the node is added to the scene.
        // Initialization here
        
    }

    public override void _PhysicsProcess(float delta)
    {
        if (Input.IsActionPressed("ui_right") && ! Input.IsActionPressed("ui_left")) {
            motion.x = SPEED; } 
        else if (Input.IsActionPressed("ui_left") && ! Input.IsActionPressed("ui_right")) {
            motion.x = -SPEED; }
        else {
            motion.x = Mathf.Lerp(motion.x, 0f, FRICTION); }
            
        MoveAndSlide(motion, FLOOR_DIRECTION);
    }

    public override void _Process(float delta)
    {
        
    }

//    public override void _Process(float delta)
//    {
//        // Called every frame. Delta is time since last frame.
//        // Update game logic here.
//        
//    }
}
