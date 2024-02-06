const rotatingImage = document.getElementById('rotating-image');
const backImage = document.querySelector('.back-image');
let isMouseDown = false;
let initialMouseX = 0;
let initialMouseY = 0;
let initialRotateX = 0;
let initialRotateY = 0;

document.addEventListener('mousedown', (e) => {
    isMouseDown = true;
    initialMouseX = e.clientX;
    initialMouseY = e.clientY;
    initialRotateX = getRotateXValue(rotatingImage.style.transform);
    initialRotateY = getRotateYValue(rotatingImage.style.transform);
});

document.addEventListener('mouseup', () => {
    isMouseDown = false;
});

document.addEventListener('mousemove', (e) => {
    if (isMouseDown) {
        const deltaX = e.clientX - initialMouseX;
        const deltaY = e.clientY - initialMouseY;

        const newRotateX = initialRotateX + deltaY * 0.1;
        const newRotateY = initialRotateY + deltaX * 0.1;

        rotatingImage.style.transform = `
            perspective(1000px)
            rotateX(${newRotateX}deg)
            rotateY(${newRotateY}deg)
            translateZ(1px)
        `;

        backImage.style.transform = `
            perspective(1000px)
            rotateX(${newRotateX}deg)
            rotateY(${newRotateY + 180}deg)
            translateZ(0px)
        `;
    }
});

function getRotateXValue(transformValue) {
    const match = transformValue.match(/rotateX\(([^)]+)\)/);
    return match ? parseFloat(match[1]) : 0;
}

function getRotateYValue(transformValue) {
    const match = transformValue.match(/rotateY\(([^)]+)\)/);
    return match ? parseFloat(match[1]) : 0;
}