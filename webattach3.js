   document.addEventListener("DOMContentLoaded", function() {
        // Find the table header and change the content to 'Web Attach'
        var headerCell = document.querySelector("#Header td");

        if (headerCell && headerCell.textContent.includes("SunGard")) {
            // Replace content with 'Web Attach' and make it a link
            headerCell.innerHTML = '<a href="#" id="webAttachLink" style="color:white; text-decoration:none;">Web Attach</a>';
        }

        // Add a search box next to the Web Attach link
        var searchBox = document.createElement('input');
        searchBox.setAttribute('type', 'text');
        searchBox.setAttribute('placeholder', 'Search...');
        searchBox.setAttribute('id', 'panelSearch');
        searchBox.style.width = '40%';
        searchBox.style.marginLeft = '20px';
        searchBox.style.padding = '5px';

        // Append the search box after the Web Attach link
        headerCell.appendChild(searchBox);

        // Toggle visibility of the firstTable when the Web Attach link is clicked
        document.getElementById("webAttachLink").addEventListener("click", function(event) {
            event.preventDefault();
            var firstTable = document.getElementById("firstTable");
            if (firstTable) {
                firstTable.style.display = (firstTable.style.display === "none") ? "table" : "none";
            }
        });

        // Add functionality to filter panels dynamically
        searchBox.addEventListener("input", function() {
            var filter = searchBox.value.toLowerCase();
            var panels = document.querySelectorAll('.panel-container .card'); // Assuming .card is the panel class

            panels.forEach(function(panel) {
                var panelTitle = panel.querySelector('h3').textContent.toLowerCase();
                if (panelTitle.includes(filter)) {
                    panel.style.display = ''; // Show panel if it matches the search
                } else {
                    panel.style.display = 'none'; // Hide panel if it doesn't match
                }
            });
        });
    });

// Array of color values (dark gray shades with variations like brown-gray, blue-gray)
const colors = ['steelblue', '#2c2c2c', '#3b3b3b', '#4b4b4b', '#555555', '#5f5f5f', '#696969', '#707070']; // Add more colors if you want
let currentIndex = 0;

// Function to change the background color with smooth transitions
function changeColor() {
   alert("Line 53")
  // Select the ancestor <td> with the 'clsBBarRaised' class (outer strip for top and bottom)
  const outerTdElement = document.querySelector("td.clsBBarRaised");

  // Select the <td> elements inside Action Bar (including buttons)
  const actionBarTdElements = document.querySelectorAll("#ActionBar td");

  // Select the inner <td> that contains the <a> with id 'webAttachLink'
  const innerTdElement = document.querySelector("a#webAttachLink").closest("td");

  // Select all the button panel <td> elements with 'clsBtnOff'
  const panelButtons = document.querySelectorAll('td.clsBtnOff');

  // Select all the buttons with 'continue-btn' class inside 'card-footer' divs
  const cardFooterButtons = document.querySelectorAll('div.card-footer a.continue-btn');

  // Apply background color to both inner and outer parts of the WebAttach section
  if (innerTdElement) {
    innerTdElement.style.transition = 'background-color 10s ease'; // Ensure transition is applied
    innerTdElement.style.backgroundColor = colors[currentIndex];
  }

  // Apply background color change to the outer <td> strip (top section and ActionBar)
  if (outerTdElement) {
    outerTdElement.style.transition = 'background-color 10s ease';
    outerTdElement.style.backgroundColor = colors[currentIndex];
  }

  // Apply color transition to all inner ActionBar <td> elements
  actionBarTdElements.forEach(td => {
    td.style.transition = 'background-color 10s ease';
    td.style.backgroundColor = colors[currentIndex];
  });

  // Apply color transition to all button panel <td> elements (with 'clsBtnOff')
  panelButtons.forEach(button => {
    button.style.transition = 'background-color 10s ease';
    button.style.backgroundColor = colors[currentIndex];
  });

  // Apply color transition to all 'continue-btn' buttons inside 'card-footer' divs
  cardFooterButtons.forEach(btn => {
    btn.style.transition = 'background-color 10s ease';
    btn.style.backgroundColor = colors[currentIndex];
  });

  currentIndex = (currentIndex + 1) % colors.length; // Loop through the colors
}

// Change the color every 30 seconds (30000 milliseconds)
setInterval(changeColor, 3000);
