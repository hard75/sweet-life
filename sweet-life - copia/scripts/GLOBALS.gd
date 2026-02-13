extends Node

var puedes_hablar = false
var dialogs : Array = ["viernes","nose que mas", "sabado"]

var hambre = 50
var sed = 50
var energia = 100
var salud = 100

var sombrero_texture : CompressedTexture2D = preload("res://sprites/player/sombreros/sombreros_0001.png")
var sombreros_guardados : Array[int] = [0,1,2,3,4,5,6,7,8,9]

var comida_sacia_cant = 10
var bebida_sacia_cant = 10
