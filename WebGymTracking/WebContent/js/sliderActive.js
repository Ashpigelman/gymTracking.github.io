var sliderSets = document.getElementById("sliderSets");
var sliderReps = document.getElementById("sliderReps");
var inputSets = document.getElementById("inputSets");
var inputReps = document.getElementById("inputRets");

///value updation from input to slider
//function input update to slider
function sliderSetsInput(){//input udate slider Sets
	sliderSets.value = inputSets.value;
}
function sliderRepsInput(){//input update slider Reps
	sliderReps.value = (inputReps.value);
}

//calling function on change of inputs to update in slider
inputSets.addEventListener("change",sliderSetsInput);
inputReps.addEventListener("change",sliderRepsInput);

///value updation from slider to input
//functions to update from slider to inputs 
function inputSetsSliderSets(){//slider update inputs
   inputSets.value = sliderSets.value;
}
function inputRepsSliderReps(){//slider update inputs
   inputReps.value = sliderReps.value;
}
sliderSets.addEventListener("change",inputSetsSliderSets);
sliderReps.addEventListener("change",inputRepsSliderReps);