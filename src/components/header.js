import icon from "../assets/img/icon.png";

let Header = () => {
    return (
        <nav className="w-full p-2 h-16 bg-white border-b flex flex-row space-x-3 border-gray-100">
           <img src={icon}></img>
           <font className="my-auto w-96 font-bold text-gray-800 text-2xl">Language Processor</font>
           <section className="w-full grid-cols-3 h-full grid gap-3">
                <div className="w-full col-span-2 flex flex-row space-x-4">

                </div>
           </section>
        </nav>
    );
}

export default Header;