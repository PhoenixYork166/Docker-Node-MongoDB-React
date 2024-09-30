import React, { useState, useEffect } from 'react';

import GoalInput from './components/goals/GoalInput';
import CourseGoals from './components/goals/CourseGoals';
import ErrorAlert from './components/UI/ErrorAlert';

function App() {
  const [loadedGoals, setLoadedGoals] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState(null);
  const backendPort = '3001';

  // Keep watching data fetching
  useEffect(function () {

    // Declare an async function to fetch data
    async function fetchData() {
      // Initially, when data are NOT yet fetched
      // setIsLoading(true)
      setIsLoading(true);

      try {
        // fetching backend endpoint `http://localhost:${backendPort}/goals`
        const response = await fetch(`http://localhost:${backendPort}/goals`);

        // top level await
        const resData = await response.json();

        // if response.ok does NOT exist
        if (!response.ok) {
          throw new Error(resData.message || 'Fetching the goals failed.');
        }

        // else setState to store resData.goals 
        // to this.state.loadedGoals
        setLoadedGoals(resData.goals);
      } catch (err) {
        setError(
          err.message ||
            'Fetching goals failed - the server responsed with an error.'
        );
      }
      
      // Once loadedGoals are stored in this.state.loadedGoals
      // setState isLoading back to false
      setIsLoading(false);
    }

    // execute async fetchData callback
    fetchData();

    // append to a state array
  }, []);

  async function addGoalHandler(goalText) {
    setIsLoading(true);

    try {
      const response = await fetch(`http://localhost:${backendPort}/goals`, {
      // const response = await fetch(`http://localhost/goals`, {
        method: 'POST',
        body: JSON.stringify({
          text: goalText,
        }),
        headers: {
          'Content-Type': 'application/json'
        }
      });

      const resData = await response.json();

      if (!response.ok) {
        throw new Error(resData.message || 'Adding the goal failed.');
      }

      setLoadedGoals((prevGoals) => {
        const updatedGoals = [
          {
            id: resData.goal.id,
            text: goalText,
          },
          ...prevGoals,
        ];
        return updatedGoals;
      });
    } catch (err) {
      setError(
        err.message ||
          'Adding a goal failed - the server responsed with an error.'
      );
    }
    setIsLoading(false);
  }

  async function deleteGoalHandler(goalId) {
    setIsLoading(true);

    try {
      const response = await fetch(`http://localhost:${backendPort}/goals/` + goalId, {
      // const response = await fetch(`http://localhost/goals/` + goalId, {
        method: 'DELETE',
      });

      const resData = await response.json();

      if (!response.ok) {
        throw new Error(resData.message || 'Deleting the goal failed.');
      }

      setLoadedGoals((prevGoals) => {
        const updatedGoals = prevGoals.filter((goal) => goal.id !== goalId);
        return updatedGoals;
      });
    } catch (err) {
      setError(
        err.message ||
          'Deleting the goal failed - the server responsed with an error.'
      );
    }
    setIsLoading(false);
  }

  return (
    <div>
      {error && <ErrorAlert errorText={error} />}
      <GoalInput onAddGoal={addGoalHandler} />
      {!isLoading && (
        <CourseGoals goals={loadedGoals} onDeleteGoal={deleteGoalHandler} />
      )}
    </div>
  );
}

export default App;
