document.addEventListener("click", (e) => {
    console.log(e.target)
    const selectedOption = e.target.closest(".custom-select-item");
    console.log(selectedOption)
    if (!selectedOption) return;

    const customSelect = selectedOption.closest(".custom-select-container").firstElementChild;
    customSelect.value = selectedOption.textContent.trim();
})

document.addEventListener("input", (e) => {
    console.log("Input event triggered")
    const customSelect = e.target.closest(".custom-select")
    if (!customSelect) return

    const searchTerm = customSelect.value.toLowerCase()
    const customSelectContainer = customSelect.closest(".custom-select-container");
    const customSelectItems = [...customSelectContainer.querySelectorAll(".custom-select-item")]

    customSelectItems.forEach(item => {
        item.classList.add("d-none");
    })
    const possibilities = customSelectItems.filter((item) => {
        // IMPORTANT
        console.log(item.textContent, {searchTerm})
        console.log(item.textContent.toLowerCase().match(searchTerm) !== null)
        return item.textContent.toLowerCase().match(searchTerm) !== null
    })
    console.log({possibilities})
    possibilities.forEach(item => {
        item.classList.remove("d-none")
        item.classList.add("d-flex")
    })
    const [expected, old] = getExpectedAndCurrentSelectedIndex(customSelectItems, possibilities)
    console.log({expected, old})

    // THE ORDER IS IMPORTANT SINCE OLD AND EXPECTED CAN BE THE SAME
    // if (old !== -1) customSelectItems[old].classList.remove("selected-item")
    customSelectContainer.querySelector(".selected-item")?.classList?.remove?.("selected-item")
    if (expected !== -1) possibilities[expected].classList.add("selected-item")

})

document.addEventListener("focus", (e) => {
    const customSelectContainer = e.target?.closest?.(".custom-select-container");
    if (!customSelectContainer) return;

    const customSelectItemsContainer = customSelectContainer.querySelector(".custom-select-item-container");
    customSelectItemsContainer.classList.remove("d-none");
    customSelectItemsContainer.classList.add("d-flex");
    customSelectItemsContainer.firstElementChild.classList.add("selected-item");
}, true);

document.addEventListener("blur", (e) => {
    const customSelectContainer = e.target?.closest?.(".custom-select-container");
    if (!customSelectContainer) return;

    // const didClickItem = customSelectContainer.contains(e.relatedTarget)
    // if (didClickItem) return;

    const customSelect = customSelectContainer.querySelector(".custom-select");
    const selectedOption = customSelect.value;
    const customSelectItems = [...customSelectContainer.querySelectorAll(".custom-select-item")];
    const customSelectItemsContainer = customSelectContainer.querySelector(".custom-select-item-container");

    if (customSelectItems.some((item) => item.innerText === selectedOption)) return;

    // if none matches
    customSelect.value = "";

    customSelectItemsContainer.classList.remove("d-flex");
    customSelectItemsContainer.classList.add("d-none");

}, true);


// returns [whatShouldBeTheSelectedIndex, whatCurrentlyIs]
const getExpectedAndCurrentSelectedIndex = (customSelectItems, activeItems) => {
    const oldIndex = customSelectItems.findIndex(item => item.classList.contains("selected-item"));
    console.log({oldIndex})
    // No item currently selected, so should be set to 0
    if (oldIndex === -1 && customSelectItems.some(item => !item.classList.contains("d-none"))) return [0, -1];

    let currentElementFound = false;
    let displayedItemsCount = 0;

    for (const [index, item] of customSelectItems.entries()) {
        if (item === customSelectItems[oldIndex]) currentElementFound = true;

        if (item.classList.contains("d-none")) continue;
        
        if (currentElementFound) {
                            console.log({displayedItemsCount, oldIndex})

            return [displayedItemsCount, oldIndex];
        }

        displayedItemsCount++;
    }
            console.log({displayedItemsCount, oldIndex})
    return [displayedItemsCount - 1, oldIndex];
}


document.addEventListener("keydown", (e) => {
    const customSelect = e.target?.closest?.(".custom-select")
    if (!customSelect) return;

    if (e.key !== "ArrowUp" && e.key !== "ArrowDown" && e.key !== "Enter") return;

    const customSelectContainer = customSelect.closest(".custom-select-container");
    const customSelectItems = [...customSelectContainer.querySelectorAll(".custom-select-item")]
    if (customSelectItems.length === 0) return;
    if (customSelectItems.every(item => item.classList.contains("d-none"))) return;
    const customSelectActiveItems = customSelectItems.filter(item => !item.classList.contains("d-none"))
    if (customSelectActiveItems.length === 0) return;


    const [selectedItemIndex, realSelectedIndex] = getExpectedAndCurrentSelectedIndex(customSelectItems, customSelectActiveItems);
    if (selectedItemIndex !== realSelectedIndex && realSelectedIndex !== -1) {
        console.log("WHUATTTTT")
        if (selectedItemIndex === customSelectActiveItems.length - 1 && e.key === "ArrowDown") return
        customSelectItems[realSelectedIndex].classList.remove("selected-item")
    }

    console.log({customSelectItems});
    console.log({selectedItemIndex})

    console.log({key: e.key, selectedItemIndex})

    const possibleKeys = {
        "ArrowUp": () => {
            if (selectedItemIndex === 0) return;

            customSelectActiveItems[selectedItemIndex].classList.remove("selected-item");
            customSelectActiveItems[selectedItemIndex - 1].classList.add("selected-item");
        },

        "ArrowDown": () => {
            console.log({selectedItemIndex, maxIndex: customSelectActiveItems.length - 1})
            if (selectedItemIndex >= customSelectActiveItems.length - 1) return;
            console.log("TRIGGERED")

            customSelectActiveItems[selectedItemIndex].classList.remove("selected-item");
            customSelectActiveItems[selectedItemIndex + 1].classList.add("selected-item");
        },

        "Enter": () => {
            const dropdownSelectedOption = customSelectActiveItems[selectedItemIndex].textContent.trim();
            customSelect.value = dropdownSelectedOption;

            customSelect.dispatchEvent(new Event("input", {bubbles: true}));
        }
    }
    console.log(customSelectContainer.querySelector(".selected-item"))
    if (possibleKeys[e.key]) possibleKeys[e.key]();
})