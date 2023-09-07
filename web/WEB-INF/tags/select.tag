<%@ attribute name="list" required="true" rtexprvalue="true" type="java.util.List<java.lang.String>"
              description="it represents the columns titles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="position-relative custom-select-container">
    <input class="custom-select" placeholder="Ingresa una opción" aria-label="Select an option" type="text">
    <div class="position-absolute bottom flex-column w-100 custom-select-item-container d-none">
        <c:forEach var="item" items="${list}">
            <div class="custom-select-item px-2 py-1 border bg-white hover-bg-gray cursor-pointer">
                    ${item}
            </div>
        </c:forEach>
    </div>
</div>


<script defer>
    document.addEventListener("click", (e) => {
        console.log(e.target)
        const selectedOption = e.target.closest(".custom-select-item");
        console.log(selectedOption)
        if (!selectedOption) return;

        const customSelect = selectedOption.closest(".custom-select-container").firstElementChild;
        customSelect.value = selectedOption.textContent.trim();
    })

    document.addEventListener("input", (e) => {
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
        const [expected, old] = getExpectedAndCurrentSelectedIndex(customSelectItems)
        console.log({expected, old})

        // THE ORDER IS IMPORTANT SINCE OLD AND EXPECTED CAN BE THE SAME
        // if (old !== -1) customSelectItems[old].classList.remove("selected-item")
        customSelectContainer.querySelector(".selected-item")?.classList?.remove?.("selected-item")
        if (expected !== -1) possibilities[expected].classList.add("selected-item")

    })

    document.addEventListener("focus", (e) => {
        if (!e.target?.closest) return;

        const customSelectContainer =  e.target.closest(".custom-select-container");
        if (!customSelectContainer) return;


        const customSelectItemsContainer = customSelectContainer.querySelector(".custom-select-item-container");
        customSelectItemsContainer.classList.remove("d-none")
        customSelectItemsContainer.classList.add("d-flex")
        customSelectItemsContainer.firstElementChild.classList.add("selected-item")
    }, true)

    document.addEventListener("blur", (e) => {
        if (!e.target?.closest) return;

        const customSelect = e.target.closest(".custom-select")
        const customSelectContainer = customSelect.closest(".custom-select-container");
        if (!customSelectContainer) return

        const selectedOption = customSelect.value;
        const customSelectItems = [...customSelectContainer.querySelectorAll(".custom-select-item")]
        const customSelectItemsContainer = customSelectContainer.querySelector(".custom-select-item-container");

        if (customSelectItems.some((item) => item.innerText === selectedOption)) return;

        // if none matches
        customSelect.value = "";

        customSelectItemsContainer.classList.remove("d-flex")
        customSelectItemsContainer.classList.add("d-none")
    }, true)

    // returns [whatShouldBeTheSelectedIndex, whatCurrentlyIs]
    const getExpectedAndCurrentSelectedIndex = (customSelectItems) => {
    const oldIndex = customSelectItems.findIndex(item => item.classList.contains("selected-item"));

    // No item currently selected, so should be set to 0
    if (oldIndex === -1 && customSelectItems.some(item => !item.classList.contains("d-none"))) return [0, -1];

    let currentElementFound = false;
    let displayedItemsCount = 0;

    for (const [index, item] of customSelectItems.entries()) {
        if (item === customSelectItems[oldIndex]) currentElementFound = true;

        if (item.classList.contains("d-none")) continue;

        if (currentElementFound)  return [displayedItemsCount, oldIndex];

        displayedItemsCount++;
    }
    return [displayedItemsCount - 1, oldIndex];
}


    document.addEventListener("keydown", (e) => {
        const customSelect = e.target.closest(".custom-select")
        if (!customSelect) return;

        if (e.key !== "ArrowUp" && e.key !== "ArrowDown" && e.key !== "Enter") return;

        const customSelectContainer = customSelect.closest(".custom-select-container");
        const customSelectItems = [...customSelectContainer.querySelectorAll(".custom-select-item")]
        if (customSelectItems.length === 0) return;
        if (customSelectItems.every(item => item.classList.contains("d-none"))) return;
        const customSelectActiveItems = customSelectItems.filter(item => !item.classList.contains("d-none"))
        if (customSelectActiveItems.length === 0) return;


        const [selectedItemIndex, realSelectedIndex] = getExpectedAndCurrentSelectedIndex (customSelectItems);
        if (selectedItemIndex !== realSelectedIndex && realSelectedIndex !== -1) {
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
                if (selectedItemIndex === customSelectActiveItems.length - 1) return;

                customSelectActiveItems[selectedItemIndex].classList.remove("selected-item");
                customSelectActiveItems[selectedItemIndex + 1].classList.add("selected-item");
            },

            "Enter": () => {
                const dropdownSelectedOption = customSelectActiveItems[selectedItemIndex].textContent.trim();
                customSelect.value = dropdownSelectedOption;
            }
        }

        if (possibleKeys[e.key]) possibleKeys[e.key]();
    })
</script>