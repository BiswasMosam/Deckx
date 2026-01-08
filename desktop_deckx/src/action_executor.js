const open = require('open');
const keySender = require('node-key-sender');
const notifier = require('node-notifier');
const { exec } = require('child_process');

module.exports.ActionExecutor = {
  execute: (action) => {
    switch (action) {
      case 'action1':
        open('notepad');
        notifier.notify({ title: 'DeckX', message: 'Opened Notepad' });
        break;

      case 'action2':
        keySender.sendCombination(['control', 'c']);
        notifier.notify({ title: 'DeckX', message: 'Copied' });
        break;

      case 'action3':
        keySender.sendCombination(['control', 'v']);
        notifier.notify({ title: 'DeckX', message: 'Pasted' });
        break;

      case 'mute':
        exec('nircmd.exe mutesysvolume 1');
        notifier.notify({ title: 'DeckX', message: 'Muted system volume' });
        break;

      default:
        notifier.notify({ title: 'DeckX', message: `Unknown action: ${action}` });
        console.log('Unknown action:', action);
    }
  }
};
