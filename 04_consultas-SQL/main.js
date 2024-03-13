function generarNumerosAleatorios(min, max) {
    const numeros = [];
    for (let i = 0; i < 100; i++) {
        numeros.push(Math.floor(Math.random() * (max - min + 1)) + min);
    }
    return numeros;
}

const numerosAleatorios = generarNumerosAleatorios(1, 20);
console.log(numerosAleatorios);
