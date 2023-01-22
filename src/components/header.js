import icon from "../assets/img/icon.png";

let Header = () => {
    return (
        <nav className="w-full p-2 h-16 bg-white border-b flex flex-row space-x-3 border-gray-100">
           <img src={icon}></img>
           <font className="my-auto font-bold text-gray-800 text-2xl">Language Processor</font>
           <section>
            
           </section>
        </nav>
    );
}

export default Header;