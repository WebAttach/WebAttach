window.onload = function() {
    // Array of color values (dark gray shades with variations)
    const colors = [ '#2c2c2c'];
    let currentIndex = 0;

    // Function to change the background color
 function changeColor() {
  const outerTdElement = document.querySelector("td.clsBBarRaised");
  const actionBarTdElements = document.querySelectorAll("#ActionBar td");
  const innerTdElement = document.querySelector("a#webAttachLink").closest("td");
  const panelButtons = document.querySelectorAll('td.clsBtnOff');

  if (innerTdElement) {
    innerTdElement.style.setProperty('background-color', colors[currentIndex], 'important');
  }

  if (outerTdElement) {
    outerTdElement.style.setProperty('background-color', colors[currentIndex], 'important');
  }

  actionBarTdElements.forEach(td => {
    td.style.setProperty('background-color', colors[currentIndex], 'important');
    console.log("Changed ActionBar color: " + colors[currentIndex]);
  });

  panelButtons.forEach(button => {
    button.style.setProperty('background-color', colors[currentIndex], 'important');
    console.log("Changed Button color: " + colors[currentIndex]);
  });

  currentIndex = (currentIndex + 1) % colors.length; // Loop through colors
}


    // Change the color every 30 seconds (30000 milliseconds)
    setInterval(changeColor, 10000);
};


function showIframe() {
    event.preventDefault();  // Prevent any default anchor behavior
    document.getElementById('panel-container').style.display = 'none';
    //document.getElementById('form-container').style.display = 'block';
    document.getElementById('iframe-container').style.display = 'block';
}
function showForm() {
    event.preventDefault();  // Prevent any default anchor behavior
    document.getElementById('panel-container').style.display = 'none';
    document.getElementById('form-container').style.display = 'block';
    document.getElementById('iframe-container').style.display = 'none';
}

function showBudgetConsole() {
    var shinyAppUrl = "https://posit.cloud/spaces/571199/content/9033978";
    window.open(shinyAppUrl, '_blank');  // Opens in a new tab
}


function goBackToPanels() {
    event.preventDefault();  // Prevent default anchor behavior
     location.reload();
}
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


