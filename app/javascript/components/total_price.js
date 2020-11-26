const dailyRate = document.getElementById("daily_rate");
const price = document.getElementById("computed_price");
const startDateInput = document.getElementById("booking_start_date");
const endDateInput = document.getElementById("booking_end_date");
const numberOfPersonsInput = document.getElementById("booking_number_of_persons");
const inputs = document.querySelectorAll(".form-control")


const computePrice = () => {
  const computedPrice = () => {
    const dailyRateInt = parseInt(dailyRate.innerText.match(/\d+/)[0], 10);
    const numberOfPersonsInt = parseInt(numberOfPersonsInput.value, 10);
    let numberOfDays = (Date.parse(endDateInput.value) - Date.parse(startDateInput.value)) / (1000 * 60 * 60 * 24) + 1;
    return numberOfDays * dailyRateInt * numberOfPersonsInt
  }

    inputs.forEach((element) => {
      element.addEventListener('change', () => {
        if (isNaN(computedPrice())) {
          price.innerText = "";
        } else {
          price.innerText = `${computedPrice()} CHF`;
        }
      });
    });

}

export { computePrice };