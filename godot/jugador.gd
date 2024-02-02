{\rtf1\ansi\ansicpg1252\cocoartf2759
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww13440\viewh10200\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs28 \cf0 extends KinematicBody2D\
\
const ACCELERATION = 70\
const MAX_SPEED = 300\
const JUMP_H = -950\
const UP = Vector2(0, -1)\
const gravity = 40\
\
onready var sprite = $Sprite\
onready var animationPlayer = $AnimationPlayer\
\
var motion = Vector2()\
\
func _physics_process(delta):\
	motion.y += gravity\
	var friction = false\
	\
	if Input.is_action_pressed("ui_right"):\
		sprite.flip_h = true\
		animationPlayer.play("walk")\
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)\
	elif Input.is_action_pressed("ui_left"):\
		animationPlayer.play("walk")\
		sprite.flip_h = false\
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)\
	else:\
		animationPlayer.play("idle")\
		friction = true\
	\
	if is_on_floor():\
		\
		if Input.is_action_just_pressed("ui_accept"):\
			motion.y = JUMP_H\
		if friction == true:\
			motion.x = lerp(motion.x, 0, 0.5)\
	\
	else:\
		if friction == true:\
			motion.x = lerp(motion.x, 0, 0.01)\
	\
	motion = move_and_slide(motion, UP)}