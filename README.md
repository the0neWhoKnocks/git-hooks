# git-hooks

This repo contains hooks I use while developing with GIT

---

`node.js.hb` can be used in conjunction with [grunt-githooks](https://www.npmjs.com/package/grunt-githooks).

A simple configuration for the hook would be:

```
module.exports = function(){
  var prePushTemplate = './grunt/hook-templates/node.js.hb';
  var prePushStart = '// ## GRUNT PRE-PUSH START ##';
  var prePushEnd = '// ## GRUNT PRE-PUSH END ##';

  return {
    install: {
      'pre-push': {
        taskNames: 'test',
        template: prePushTemplate,
        startMarker: prePushStart,
        endMarker: prePushEnd
      }
    }
  };
};
```

The above config assumes a structure that's using `load-grunt-config` to load
individual files per Grunt plugin.
