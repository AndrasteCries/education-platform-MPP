// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require bootstrap
import "@hotwired/turbo-rails"
import "controllers"
import "channels"

document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.querySelector('.search-input');
    const studentList = document.querySelector('.student-list');

    searchInput.addEventListener('input', function() {
        const searchValue = this.value.toLowerCase();
        const students = studentList.querySelectorAll('label');

        students.forEach(function(student) {
            const fullName = student.textContent.toLowerCase();
            if (fullName.includes(searchValue)) {
                student.parentElement.style.display = 'block';
            } else {
                student.parentElement.style.display = 'none';
            }
        });
    });
});
