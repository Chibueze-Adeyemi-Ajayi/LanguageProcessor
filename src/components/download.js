import mock3 from "../assets/img/mock3.png";
import appstore from "../assets/img/appstore.png";
import playstore from "../assets/img/playstore.png";
import app from "../assets/apk/app.apk";

const Download = () => {
    return (
        <section id="download" className="w-full h-full bg-white flex flex-col space-y-6 p-6">
            <h1 className="w-full h-fit mx-auto text-4xl md:text-7xl font-extrabold text-gray-800">App <br></br>Download</h1>
            <div className="w-full h-fit grid md:grid-cols-2">
                <section className="w-full h-fit flex p-3 md:p-12">
                    <img className="mx-auto w-40 md:h-fit h-72" src={mock3}></img>
                </section>
                <section className="w-full h-full flex">
                    <font className="text-gray-900 text-xl my-auto h-fit flex flex-col space-y-4">
                        <h1 className="text-4xl font-bold text-gray-900">Language Processor</h1> <br></br>
                        Translate any text from any language <br></br> to any language, at just a click. <br></br>
                        <br></br>
                        <section className="w-full h-fit grid grid-cols-2 gap-4">
                            <a href={app} download><img className="h-12" src={playstore}></img></a>
                            <img onClick={()=>{
                                alert("Coming soon");
                            }} className="h-12" src={appstore}></img>
                        </section>
                    </font>
                </section>
            </div>
        </section>
    );
}

export default Download;