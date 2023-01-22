import './App.css';
import Header from './components/header';
import Banner from './components/banner';
import About from './components/about';

function App() {
  return (
    <>
      {/* app header */}
      <Header />
      <br></br><br></br><br></br>
      {/* banner */}
      <Banner />
      {/* about section */}
      <About />
    </>
  );
}

export default App;
