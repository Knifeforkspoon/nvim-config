# Claude Code Global Instructions

## Task Execution Protocol

### Iterative Task Performance
- All implementation tasks must be performed iteratively with user feedback loops
- Each task follows this workflow:
  1. **Before starting**: Prompt user with description of work to be done
  2. **During execution**: Perform the work in small, coherent steps
  3. **Before completion**: Reconcile actual work against stated requirements
  4. **Before marking complete**: Prompt user with summary of work performed, request confirmation
  5. **Post-completion**: Identify technical debt or additional work, prompt user to add as Must Have, Should Have, Could Have, or Would Like

### Code Quality Standards

#### Conditional Logic
- Avoid nested conditionals entirely
- Prefer guard classes and early returns
- Flatten logical complexity before writing code

#### Cyclomatic Complexity
- Rule of thumb: no function should exceed cyclomatic complexity of 3
- If complexity would exceed 3, STOP and prompt user for further instruction
- Do not attempt to refactor around the limit without user approval

#### Dependency Management
- Do NOT attempt to install new packages without first prompting the user
- Always ask before adding dependencies, even minor ones
- Include reasoning for why the package is necessary

### User Interaction Style
- Direct, outcome-focused communication
- No performative or sycophantic responses
- Ask clarifying questions before making assumptions
- Respect user's technical expertise and preferences
