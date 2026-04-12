---
name: create-list
description: "Generate a performant scrollable list with pagination, pull-to-refresh, and optimized rendering."
argument-hint: "<list-name> [--pagination cursor|offset|infinite]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project platform** from config files.

2. **Ask about the list** using `AskUserQuestion`:

   - Tab "Type" — "List type?"
     Options: Vertical list / Grid / Horizontal carousel / Sectioned list / Chat messages / Timeline
   - Tab "Pagination" — "Pagination strategy?"
     Options: Cursor-based (recommended) / Offset / Load more button / No pagination
   - Tab "Features" — "Include which features?"
     Options (multi): Pull to refresh / Search / Filter / Swipe actions / Selection mode / Sticky headers

3. **Generate the list** with:

   - **Virtualized list component**:
     - RN: FlashList (preferred) or FlatList with getItemLayout
     - Flutter: ListView.builder with AutomaticKeepAliveClientMixin
     - SwiftUI: LazyVStack with ScrollView
     - Compose: LazyColumn with key
   - **Performance optimizations**:
     - Item recycling / view holder pattern
     - Memoized item components (React.memo / const widgets)
     - Image lazy loading with placeholders
     - windowSize / initialNumToRender tuning (RN)
   - **Pagination**:
     - Infinite scroll with onEndReached threshold
     - Loading indicator at bottom
     - "No more items" state
     - Page/cursor state management
   - **Pull to refresh**: Native refresh control
   - **Empty state**: Illustration + message when no items
   - **Loading state**: Skeleton list items (shimmer)
   - **Error state**: Retry button
   - **Search/Filter**: Debounced search with highlighted results

4. **Generate supporting files**:
   - List item component
   - Data fetching hook / repository method
   - Test file

5. **Suggest next steps**:
   1. "Run `/create-component` for the list item design"
   2. "Run `/audit-performance` to verify list scrolling performance"
