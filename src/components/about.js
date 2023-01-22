import mock3 from "../assets/img/mock3.png";
import mock1 from "../assets/img/mock1.png";
import mock from "../assets/img/mock.png";

const GridSection = (params) => {
    return (
        params.reverse ? 
        <>
            <section className="w-full hidden h-fit md:grid md:grid-cols-2 gap-4">
                <div className="w-full mt-32 h-fit p-4 flex"> {params.right} </div>
                <div className="w-full h-fit p-4 flex"> {params.left} </div>
            </section>
            <section className="w-full md:hidden h-fit grid md:grid-cols-2 gap-4">
                <div className="w-full h-fit p-4 flex"> {params.left} </div>
                <div className="w-full mt-32 h-fit p-4 flex"> {params.right} </div>
            </section>
        </>
        :
        <section className="w-full h-fit grid md:grid-cols-2 gap-4">
            <div className="w-full h-fit p-4 flex"> {params.left} </div>
            <div className="w-full mt-32 h-fit p-4 flex"> {params.right} </div>
        </section>
    );
} 

const Image = (params) => {
    return <img className="mx-auto md:w-fit md:h-fit w-fit h-56" src={params.src}></img>
}

const Text = params => {
    return <section className="w-full my-auto p-6 rounded-3xl bg-white h-fit flex flex-col space-y-4">
        <h1 className="text-4xl font-bold">{params.title}</h1> <br></br>
        <hr></hr> <br></br>
        <section className="w-full flex flex-col h-fit space-y-5">
            <font className="text-3md">{params.content}</font><br></br>
        <hr></hr>
            <a href="#download" className="px-6 py-3 my-auto w-36 bg-blue-600 text-white rounded-md">Download</a>
        </section>
    </section>
}

const About = () => {
    return (
        <div id="about" className="w-full h-fit md:mt-0 mt-24 bg-gray-50">
            <section className="w-full h-fit p-3 md:p-6 flex flex-col space-y-6">
                <h1 className="w-full h-fit mx-auto md:text-left text-center text-5xl md:text-7xl font-extrabold text-gray-800">About App</h1>
                <br></br>
                <GridSection reverse={false} right={<Text content="Language Processor is a multi-lingual neural machine built into a mobile application, majorly for translating texts from one language to another. Officially 
                developed by Jilo Innovations" title="Translation"/>} left={<Image src={mock3}/>} />
                <section className="md:flex hidden md:h-12"></section>
                <GridSection reverse={true} right={<Text content="Language Processor helps you translate any of the following languages to each other: 
                English, Spanish, Chinese, Japanese, German, Greek, French, Hebrew, Hindi, Italian, Korean, Portuguese, Romanian, RUssian, and Turkish." title="Languages Supported"/>} left={<Image src={mock}/>} />
                <GridSection reverse={false} right={<Text content="Built on state of the art machine learning algorithm with over 80% precision. Every operations are processed over Google's Natural Language Process open source Software Development Kit (Google Translate SDK)" title="Accuracy"/>} left={<Image src={mock1}/>} />
                <br></br><br></br>
            </section>
        </div>
    );
}

export default About;