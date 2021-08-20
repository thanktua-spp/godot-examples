extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var input_value
var converted_value
var input_scale_selected
var output_scale_selected

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Button_pressed():
	input_value = float(get_parent().get_node("TempValueTextEdit").text)
	converted_value = _display_converted_temp(input_scale_selected, output_scale_selected, input_value)
	get_parent().get_node("OutputLabel").text = str(converted_value)


func _on_InputItemList_item_selected(index):
	input_scale_selected = get_parent().get_node("InputItemList").get_item_text(index)

func _on_OutputItemList_item_selected(index):
	output_scale_selected = get_parent().get_node("OutputItemList").get_item_text(index)

# Program logic
func _display_converted_temp(input_scale, output_scale, value):
	if input_scale == "Celsius" and output_scale == "Kelvin":
		return _celsius_to_kelvin(value)
	elif input_scale == "Celsius" and output_scale == "Fahrenheit":
		return _celsius_to_fahrenheit(value)
	elif input_scale == "Kelvin" and output_scale == "Celsius":
		return _kelvin_to_celsius(value)
	elif input_scale == "Kelvin" and output_scale == "Fahrenheit":
		return _kelvin_to_fahrenheit(value)
	elif input_scale == "Fahrenheit" and output_scale == "Celsius":
		return _fahrenheit_to_celsius(value)
	elif input_scale == "Fahrenheit" and output_scale == "Kelvin":
		return _fahrenheit_to_kelvin(value)
	else:
		return 0


#Celsius to others
func _celsius_to_kelvin(degree_celsius):
	return degree_celsius + 273.15
		
func _celsius_to_fahrenheit(degree_celsius):
	return (degree_celsius * 9/5) + 32
	
#Kelvin to others	
func _kelvin_to_celsius(degree_kelvin):
	return degree_kelvin - 273.15

func _kelvin_to_fahrenheit(degree_kelvin):
		return (degree_kelvin - 273.15) * 9/5 + 32
	
#Fahrenheit to others	
func _fahrenheit_to_celsius(degree_fahrenheit):
	return (degree_fahrenheit - 32) * 5/9

func _fahrenheit_to_kelvin(degree_fahrenheit):
	return (degree_fahrenheit - 32) * 5/9 + 273.15
