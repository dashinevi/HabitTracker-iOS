# Cozy Habit Tracker
![habit_tracker](https://github.com/user-attachments/assets/cc4973c0-60c5-4335-a6e9-50b4c0ed454d)

#### Overview
This application is a cozy habit tracker designed for anyone aiming to develop new habits and monitor their progress. It combines my passion for coding with my need to maintain consistent habits.

## Inspiration
When I started building this app, I wanted to create something simple yet meaningful. The idea for this app was born during my programming journey in the CS50 course. I realized the importance of consistency and wanted a way to track my progress and check off tasks as they’re completed.

There were moments of frustration, like designing the UI from scratch without Figma designs, but every challenge taught me something valuable. Initially, I thought this project would be quick and simple—something I could finish in a few days. But after five days of coding, I realized it was much trickier than expected. Tracking habits, creating a smooth user experience, and calculating progress accurately turned out to be more complex than anticipated. This journey helped me appreciate the effort it takes to make something useful and well-designed.

---

## Key Features
### Add and Manage Habits
- Users can add new habits with titles, descriptions, and goals.
- A check-off mechanism allows users to mark habits as complete.

### Track Streaks
- Automatic streak tracking displayed in the statistics screen motivates users to maintain consistency.
- Visual streak indicators like flame icons for active streaks.

### Set Goals
- Flexible goal settings such as "5 times per week/month" or daily goals.

### Statistics View
- Visual insights into user progress.
- Calendar view in each habit card highlighting completed habits.

### Customizable Colors
- Personalize habit cards with gradient backgrounds for a unique interface.

---

## Technology Stack
- **Swift & SwiftUI**
- **SwiftData**: Manages data persistence for user habits.
- **AppStorage**: Stores the onboarding state and user name.
- **UIColor Extension**: Reads hex values for customizing habit card colors.
- **Recraft AI**: Generates illustrations for the UI.

---

## Requirements
- **Minimum iOS Version**: iOS 17.6.

---

## Design Highlights
- **Clean and Minimalist Aesthetic**: Rounded corners, gradients, and cozy typography.
- **Personalization**: Users can enter their name and customize habit cards for a tailored experience.
- **Responsive Layouts**: Adapts to different screen sizes.

---

## User Guide
#### Onboarding
- First launch greets users with an inspirational welcome message.
- The second page allows users to input their name for a personalized experience.

#### Main Screen
- Manage habits and check them off upon completion.
- Features a clear tab bar for seamless navigation (home, add habits, and statistics).

#### Add Habits Sheet
- Tap the central “Add Habit” button to fill in the habit’s title, optional description, and set a goal (e.g., "3 times per week").
- Customize the habit’s card color.

#### Statistics
- Navigate to the Statistics tab to see:
  - A detailed calendar view of completed days.
  - Current streaks and goal completion metrics.
