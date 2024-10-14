
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

