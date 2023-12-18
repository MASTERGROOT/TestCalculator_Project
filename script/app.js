const displayElement = document.getElementById( 'calculator-display' )

const buttonpress = ( chatacter ) => {
    displayElement.value = displayElement.value + chatacter
}

const compute = () => {
    displayElement.value = eval(displayElement.value)
}

const del = () => {
    displayElement.value = displayElement.value.slice(0,-1)
    // pick value from first value to before last value
}

const Clear = () => {
    displayElement.value = '';
    
}
