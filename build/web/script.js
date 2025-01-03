// Catch and log any unhandled promise rejections
window.addEventListener('unhandledrejection', function(event) {
  console.error('Unhandled promise rejection:', event.reason);
});

// Function to check if the app is running in desktop mode on a mobile browser
function isMobileDesktopMode() {
  return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini|Opera/i.test(navigator.userAgent)
         && window.innerWidth >= 1024;
}

// Function to apply fixes for mobile browsers in desktop mode
function applyMobileDesktopFixes() {
  if (isMobileDesktopMode()) {
    console.log('Applying fixes for mobile browser in desktop mode');
    // Add any specific fixes here
    document.body.style.width = '100vw';
    document.body.style.height = '100vh';
    document.body.style.overflow = 'auto';
  }
}

// Call the fix function when the page loads and on resize
window.addEventListener('load', applyMobileDesktopFixes);
window.addEventListener('resize', applyMobileDesktopFixes);

