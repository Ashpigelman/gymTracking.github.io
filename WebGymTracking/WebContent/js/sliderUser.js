var sliderWeight = document.getElementById("sliderWeight");
var sliderHeight = document.getElementById("sliderHeight");
var inputWeight = document.getElementById("inputWeight");
var inputHeight = document.getElementById("inputHeight");

///value updation from input to slider
//function input update to slider
function sliderWeightInput(){//input udate slider Weight
	sliderWeight.value = inputWeight.value;
}
function sliderHeightInput(){//input update slider Height
	sliderHeight.value = (inputHeight.value);
}

//calling function on change of inputs to update in slider
inputWeight.addEventListener("change",sliderWeightInput);
inputHeight.addEventListener("change",sliderHeightInput);

///value updation from slider to input
//functions to update from slider to inputs 
function inputWeightSliderWeight(){//slider update inputs
   inputWeight.value = sliderWeight.value;
}
function inputHeightSliderHeight(){//slider update inputs
   inputHeight.value = sliderHeight.value;
}
sliderWeight.addEventListener("change",inputWeightSliderWeight);
sliderHeight.addEventListener("change",inputHeightSliderHeight);