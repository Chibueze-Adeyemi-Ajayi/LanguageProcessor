import logo from "../assets/img/logo.png";

const Banner = () => {
    return (
        <section className="w-full h-fit p-6 flex flex-col space-y-6">

            {/* heading section */}
            <h1 className="font-bold text-5xl w-full text-center text-gray-800">Language Processor</h1>
            <font className="text-center font-5xl font-semibold">Any word, any language, you can translate. The future of translation. </font>
            
            {/* logo & text section */}
            <div className="w-full h-[400px] grid grid-cols-2 gap-3">
                {/* image section */}
                <section className="w-full p-12 h-full flex">
                    <img className="my-auto" src={logo}/>
                </section>
                
                {/* text section */}
                <div className="w-full flex font-bold text-6xl h-full">
                    <font className="w-full flex flex-col space-y-4 my-auto text-center">
                       <font>Built on </font> 
                       <div className="text-8xl">
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