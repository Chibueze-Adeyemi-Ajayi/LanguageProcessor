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
                <div className="w-full h-full">

                </div>
            </div>  

        </section>  
    );
}

export default Banner;