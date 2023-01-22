import './App.css';
import Header from './components/header';
import Banner from './components/banner';
import About from './components/about';
import Developer from './components/developer';
import Contact from './components/contact';
import Download from './components/download';

function App() {
  return (
    <>
      {/* app header */}
      <Header />
      <br></br><br></br><br></br>
      {/* banner */}
      <Banner /><br></br><br></br><br></br>
      {/* about section */}
      <About />
      {/* download */}
      <Download />
      {/* contact section */}
      <Contact />
      {/* developer section */}
      <Developer />
    </>
  );
}

export default App;
