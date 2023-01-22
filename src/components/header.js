import icon from "../assets/img/icon.png";

let Header = () => {
    return (
        <nav className="w-full fixed top-0 left-0 p-2 h-16 bg-white border-b flex flex-row space-x-3 border-gray-100">
           <img src={icon}></img>
           <font className="my-auto md:w-96 w-84 font-bold text-gray-800 text-xl md:text-2xl">Language Processor</font>
           <section className="w-full grid-cols-3 h-full grid gap-3">
                <div className="w-full md:col-span-2 flex">
                    <section className="hidden md:flex flex-row space-x-4 mx-auto">
                        <a href="#home" className="w-24 h-fit text-center my-auto transform transition-all duration-250 hover:text-blue-600 hover:font-bold cursor-pointer">Home</a>
                        <a href="#about" className="w-24 h-fit text-center my-auto transform transition-all duration-250 hover:text-red-600 hover:font-bold cursor-pointer">About</a>
                        <a href="#contact" className="w-24 h-fit text-center my-auto transform transition-all duration-250 hover:text-green-600 hover:font-bold cursor-pointer">Contact</a>
                        <a href="#developer" className="w-24 h-fit text-center my-auto transform transition-all duration-250 hover:text-yellow-600 hover:font-bold cursor-pointer">Developer</a>
                    </section>
                </div>
                <div className="w-full flex">
                    <button className="px-6 py-2 my-auto md:mx-auto bg-blue-600 text-white rounded-md">Download</button>
                </div>
           </section>
        </nav>
    );
}

export default Header;