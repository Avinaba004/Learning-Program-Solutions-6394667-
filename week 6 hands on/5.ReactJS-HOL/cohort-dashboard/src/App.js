import React from 'react';
import CohortDetails from './CohortDetails';

function App() {
  return (
    <div className="App">
      <CohortDetails
        name="React Beginner Cohort"
        status="ongoing"
        duration="6 weeks"
        trainer="Mr. A"
      />
      <CohortDetails
        name="Java Advanced Cohort"
        status="completed"
        duration="8 weeks"
        trainer="Ms. B"
      />
    </div>
  );
}

export default App;
