import logo from "../assets/img/logo.png";

const GridSection = (params) => {
    return (
        <section className="w-full h-fit grid grid-cols-2 gap-4">
            <div className="w-full h-fit p-4 flex"> {params.left} </div>
            <div className="w-full h-fit p-4 flex"> {params.right} </div>
        </section>
    );
} 

const Image = (params) => {
    return <img className="mx-auto" src={params.src}></img>
}

const About = () => {
    return (
        <div className="w-full h-fit  bg-gray-100 ">
            <section className="w-full h-fit p-6 flex flex-col space-y-6">
                <h1 className="w-full h-fit mx-auto text-4xl font-extrabold text-gray-800">About App</h1>
                <GridSection left={<Image src/>} />
            </section>
        </div>
    );
}

export default About;