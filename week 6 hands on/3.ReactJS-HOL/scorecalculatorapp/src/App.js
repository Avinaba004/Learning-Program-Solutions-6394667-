import CalculateScore from './Components/CalculateScore';
import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <div>
          <CalculateScore Name="Avinaba Ghosh"
          School="Mary Immaculate School"
          total={284}
          goal={3}
          />
        </div>
      </header>
    </div>
  );
}

export default App;
