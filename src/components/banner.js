import logo from "../assets/img/logo.png";

const Banner = () => {
    return (
        <section id="home" className="w-full h-fit p-6 flex flex-col space-y-6">

            {/* heading section */}
            <h1 className="font-bold text-5xl md:flex  w-full text-center text-gray-800">Language Processor</h1>
            <font className="text-center font-5xl md:flex  font-semibold">Any word, any language, you can translate. The future of translation. </font>
            
            {/* logo & text section */}
            <div className="w-full h-[400px] grid md:grid-cols-2 gap-3">
                {/* image section */}
                <section className="w-full p-12 h-full hidden md:flex">
                    <img className="my-auto" src={logo}/>
                </section>
                
                {/* text section */}
                <div className="w-full flex md:mt-0 mt-24 font-bold text-5xl md:text-6xl h-full">
                    <font className="w-full flex flex-col space-y-4 my-auto text-center">
                       <font>Built on </font> 
                       <div className="md:text-8xl text-6xl">
                            <font className="text-blue-600">G</font>
                            <font className="text-red-600">o</font>
                            <font className="text-yellow-400">o</font>
                            <font className="text-blue-600">g</font>
                            <font className="text-green-600">l</font>
                            <font className="text-red-600">e</font>
                        </div>  
                       <font>translate engine</font> 
                    </font>
                </div>
            </div>  

        </section>  
    );
}

export default Banner;