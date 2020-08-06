jQuery(document).ready(function ($) {
    // Get current path and find target link
    var path = window.location.pathname.split("/").pop();
    console.log(path);
    // Account for home page with empty path
    switch (path) {
        case 'Login':
        case 'mainManagement':
            path = 'mainManagement';
            break;
        case 'createUserInformation':
        case 'updateUserInformation':
        case 'detailUserInformation':
            path = 'userManagement';
            break;
        case 'createLinkInformation':
        case 'updateLinkInformation':
        case 'detailLinkInformation':
            path = 'linkManagement';
            break;
        case 'createFacultyInformation':
        case 'updateFacultyInformation':
            path = 'facultyManagement';
            break;
        case 'createLevelInformation':
        case 'updateLevelInformation':
            path = 'levelManagement';
            break;
    }
    var target = $('nav a[href="' + path + '"]');
    // Add active class to target link
    target.addClass('active');
});
