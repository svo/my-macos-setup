def run($arguments):
  {hooks: [{type: "command", command: "\($script) \($arguments)", timeout: 5}]};

def waiting: run("waiting 'Claude Code'");

def working: run("working");

def clear: run("clear");

def ours:
  {
    Stop: [waiting],
    StopFailure: [waiting],
    PermissionRequest: [waiting],
    PreToolUse: [{matcher: "AskUserQuestion|ExitPlanMode"} + waiting],
    Notification: [
      {matcher: "permission_prompt|idle_prompt|elicitation_dialog|elicitation_url_dialog"} + waiting
    ],
    UserPromptSubmit: [working],
    PostToolBatch: [working],
    SessionStart: [{matcher: "startup|resume"} + clear],
    SessionEnd: [clear]
  };

def calls_script: (.command? // "") | tostring | contains($script);

def without_ours:
  map(
    if any(.hooks[]?; calls_script)
    then .hooks |= map(select(calls_script | not)) | select(.hooks | length > 0)
    else .
    end
  );

(first(inputs) // {}) as $settings
| ($settings.hooks // {}) as $existing
| $settings
| .hooks = (
    reduce (ours | to_entries[]) as $entry
      ($existing | map_values(without_ours); .[$entry.key] += $entry.value)
    | with_entries(select((.value | length > 0) or ($existing[.key] | length == 0)))
  )
| if . == $settings then empty else . end
