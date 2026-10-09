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
- Prefer guard clauses and early returns
- Flatten logical complexity before writing code
- Use data structures (Map, Object, Array) instead of long chains of if/else statements for lookups
- Prefer table-driven approaches where applicable for cleaner, more maintainable code

**Bad - Chain of conditionals:**
```typescript
function getShellType(path: string): string {
  if (path.includes('bash')) {
    return 'bash';
  } else if (path.includes('zsh')) {
    return 'zsh';
  } else if (path.includes('cmd')) {
    return 'cmd';
  } else if (path.includes('powershell')) {
    return 'powershell';
  }
  return 'unknown';
}
```

**Good - Map-based lookup:**
```typescript
const SHELL_TYPES = new Map([
  ['bash', 'bash'],
  ['zsh', 'zsh'],
  ['cmd', 'cmd'],
  ['powershell', 'powershell'],
]);

function getShellType(path: string): string {
  for (const [key, type] of SHELL_TYPES) {
    if (path.includes(key)) {
      return type;
    }
  }
  return 'unknown';
}
```

#### Constructor Parameters
- Use interface-based destructured constructor parameters for dependency injection
- Define parameter interfaces at the same level as the class that uses them
- Use shared base interfaces; avoid class-specific interfaces unless necessary
- When extending interfaces for subtypes, use intersection types (`&`) not inheritance (`extends`)
- Default values in destructuring are acceptable; use discretion
- Classes with zero dependencies should use empty constructors without parameter interfaces

**Bad:**
```typescript
class AILabsModule {
  private shell: IShell;
  private logger: ILogger;

  constructor() {
    this.shell = new Shell();
    this.logger = new Logger();
  }
}
```

**Good - Shared Interface:**
```typescript
interface IModuleDependencies {
  shell: IShell;
  logger: ILogger;
  platform: IPlatform;
}

class AILabsModule extends BaseModule {
  private shell: IShell;
  private logger: ILogger;
  private platform: IPlatform;

  constructor({
    shell = new Shell(),
    logger = new Logger(),
    platform = Platform.current()
  }: IModuleDependencies = {}) {
    super();
    this.shell = shell;
    this.logger = logger;
    this.platform = platform;
  }
}
```

**Good - Extended with Intersection:**
```typescript
type CertificateModuleDeps = IModuleDependencies & {
  certificateStore: ICertificateStore;
};

class CertificatesModule extends BaseModule {
  constructor({
    shell,
    logger,
    platform,
    certificateStore
  }: CertificateModuleDeps) {
    super();
    this.shell = shell;
    this.logger = logger;
    this.platform = platform;
    this.certificateStore = certificateStore;
  }
}
```

**Good - Zero Dependencies:**
```typescript
class StringHelper {
  constructor() {} // No params interface needed
}
```

#### Cyclomatic Complexity
- Rule of thumb: no function should exceed cyclomatic complexity of 3
- If complexity would exceed 3, STOP and prompt user for further instruction
- Do not attempt to refactor around the limit without user approval

#### Whitespace Management
- NEVER add trailing whitespace to any file unless explicitly authorized
- All lines must end cleanly without trailing spaces or tabs
- This applies to all file types: source code, configuration, documentation, etc.

#### Dependency Management
- Do NOT attempt to install new packages without first prompting the user
- Always ask before adding dependencies, even minor ones
- Include reasoning for why the package is necessary

#### Unit Testing Standards
- Prefer table-driven tests where applicable for cleaner, more maintainable code
- Use data arrays to test multiple scenarios with the same test logic
- Reduce code duplication by iterating over test cases
- Make test cases easy to add, modify, and understand

**Bad - Repetitive test cases:**
```typescript
describe('validateEmail', () => {
  it('should return true for valid email', () => {
    expect(validateEmail('user@example.com')).toBe(true);
  });

  it('should return false for email without @', () => {
    expect(validateEmail('userexample.com')).toBe(false);
  });

  it('should return false for email without domain', () => {
    expect(validateEmail('user@')).toBe(false);
  });

  it('should return false for empty string', () => {
    expect(validateEmail('')).toBe(false);
  });
});
```

**Good - Table-driven tests:**
```typescript
describe('validateEmail', () => {
  const testCases = [
    { input: 'user@example.com', expected: true, description: 'valid email' },
    { input: 'userexample.com', expected: false, description: 'email without @' },
    { input: 'user@', expected: false, description: 'email without domain' },
    { input: '', expected: false, description: 'empty string' },
    { input: 'user@domain.co.uk', expected: true, description: 'valid email with subdomain' },
  ];

  testCases.forEach(({ input, expected, description }) => {
    it(`should return ${expected} for ${description}`, () => {
      expect(validateEmail(input)).toBe(expected);
    });
  });
});
```

#### Test Removal Policy
- NEVER remove tests without explicit authorization
- If a test is flaky, timing out, or failing, FIX it - don't remove it
- If removal is absolutely necessary, STOP and ask the user for permission first
- Document why a test needs removal before requesting authorization
- Consider alternatives before removal:
  - Mock external dependencies (file system, network, sudo commands)
  - Use `.skip()` to temporarily disable while investigating
  - Refactor the test to be more reliable
  - Increase timeout for legitimately long-running operations
- Removing tests reduces code coverage and confidence in the codebase

#### Commit Message Format
- All commits MUST follow Conventional Commits specification
- Use standard commit types: `feat`, `fix`, `chore`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`
- Format: `<type>: <description>` or `<type>(<scope>): <description>`
- Examples:
  - `feat: add certificate management module`
  - `fix: resolve dependency injection in PackageManager`
  - `chore: update dependencies`
  - `refactor(core): implement constructor parameter pattern`
  - `docs: add API documentation for modules`

### User Interaction Style
- Direct, outcome-focused communication
- No performative or sycophantic responses
- Ask clarifying questions before making assumptions
- Respect user's technical expertise and preferences

