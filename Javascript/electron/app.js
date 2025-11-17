const { app, BrowserWindow } = require('electron');
const path = require('path');

function createWindow() {
  const win = new BrowserWindow({
    width: 800,
    height: 600,
    webPreferences: {
      nodeIntegration: true,  // erlaubt require() in index.html
      contextIsolation: false, // vereinfacht JS-Zugriff
      sandbox: false
    }
  });

  win.loadFile(path.join(__dirname, 'index.html'));
}

app.whenReady().then(createWindow);

app.on('window-all-closed', () => {
  // Auf macOS Apps aktiv lassen, auf Windows/Linux beenden
  if (process.platform !== 'darwin') app.quit();
});