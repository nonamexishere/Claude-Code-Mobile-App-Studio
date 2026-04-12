# Quick Start — Claude Mobile Studio

## What Is This?

Claude Mobile Studio is an AI-powered virtual mobile development studio that runs
entirely inside **Claude Code**. It provides specialized agents and skills to help
you build mobile apps for iOS, Android, and cross-platform.

## First Steps

### 1. Start a New Project
```
/start
```
This walks you through platform selection, sets up your project structure, and
configures the development environment.

### 2. Brainstorm Your Idea
```
/brainstorm fitness tracker
```
Generates a product brief with features, target audience, and mobile-specific
opportunities.

### 3. Plan Your Features
```
/define-features
```
Creates a prioritized feature list with user stories and complexity estimates.

## Design Phase

```
/wireframe                    # Sketch your screens
/create-architecture          # Design app architecture
/setup-navigation             # Configure navigation structure
/setup-theme                  # Establish design system
```

## Build Phase

```
/create-screen HomeScreen     # Generate a complete screen
/create-component Avatar      # Create reusable components
/create-form LoginForm        # Build forms with validation
/create-list products         # Create performant lists
/add-animation fade-in        # Add animations
```

## Backend & Integration

```
/setup-firebase               # Set up Firebase services
/setup-supabase               # Set up Supabase services
/setup-auth social            # Implement authentication
/setup-push-notifications     # Configure push notifications
/setup-offline                # Implement offline support
/setup-deep-linking           # Configure deep links
/setup-permissions            # Handle runtime permissions
/setup-in-app-purchase        # Set up in-app purchases
/setup-analytics              # Add analytics tracking
/setup-crash-reporting        # Add crash reporting
```

## Quality Assurance

```
/write-tests                  # Write unit/widget/E2E tests
/code-review                  # Review code for mobile best practices
/audit-performance            # Check performance issues
/audit-security               # Security audit
/audit-accessibility          # Accessibility audit
/test-devices                 # Generate device testing matrix
```

## Release

```
/setup-cicd                   # Set up CI/CD pipeline
/setup-codepush               # Configure OTA updates
/build                        # Build the app
/publish-appstore             # Prepare for App Store
/publish-playstore            # Prepare for Play Store
/create-changelog             # Generate release notes
```

## Talking to Agents

You can talk to any agent directly for specialized help:

```
@mobile-architect Should I use React Native or Flutter?
@firebase-specialist Set up Firestore with offline persistence
@performance-engineer My list is janky, help me optimize
@store-specialist Will my app pass App Store review?
```

## Getting Help

```
/help                         # Overview
/help agents                  # See all agents
/help skills                  # See all skills
/help workflow                # Recommended workflow
```

## Typical Workflow

```
1. PLAN       /brainstorm → /define-features → /create-architecture
2. DESIGN     /wireframe → /setup-theme → /setup-navigation
3. BUILD      /create-screen → /create-component → /create-form
4. INTEGRATE  /setup-auth → /setup-push-notifications → /setup-offline
5. TEST       /write-tests → /audit-performance → /audit-accessibility
6. RELEASE    /setup-cicd → /build → /publish-appstore / /publish-playstore
```
