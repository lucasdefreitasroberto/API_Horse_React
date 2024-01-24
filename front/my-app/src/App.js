import Header from "./components/header";
import Table from "./components/table";
import NewRegister from "./components/Produt/newRegister"

function App() {
  return (
    <div className="App">
      <Header />
      <div class="card">
        <div class="card-header"> <NewRegister/></div>
        <ul class="list-group list-group-flush">
          <li class="list-group-item"><Table /></li>
        </ul>
      </div>
    </div>
  );
}

export default App;
