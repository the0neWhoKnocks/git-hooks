
// Test by running `./.git/hooks/pre-push` at the root of your repo

var exec = require('child_process').exec;
var proc = exec('{{escapeBackslashes command}}{{#if task}} {{escapeBackslashes task}}{{/if}}{{#if args}} {{{escapeBackslashes args}}}{{/if}}', {
  cwd: '{{escapeBackslashes gruntfileDirectory}}'
});

proc.stdout.on('data', function(data){
  console.log(data);
});

proc.stderr.on('data', function(data){
  console.error(data);
});

proc.on('close', function(exitCode){
  if( exitCode ){
    exitCode = -1;
    console.error('Error executing command.');
  }

  console.log("\n================================================================================\n");

  {{#unless preventExit}}process.exit(exitCode);{{/unless}}
});
