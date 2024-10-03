// Import the functions you need from the SDKs you need
import { initializeApp } from "https://www.gstatic.com/firebasejs/10.14.0/firebase-app.js";
import { collection, doc, getDocs, getFirestore, increment, updateDoc } from "https://www.gstatic.com/firebasejs/10.14.0/firebase-firestore.js";

// Your web app's Firebase configuration
const firebaseConfig = {
    apiKey: "AIzaSyAG4XuHF7m663p_xwW18WI7wNTofMBeOoA",
    authDomain: "most-awesome-polling-system.firebaseapp.com",
    projectId: "most-awesome-polling-system",
    storageBucket: "most-awesome-polling-system.appspot.com",
    messagingSenderId: "493749772683",
    appId: "1:493749772683:web:03d2cd9cccc2d8f9870f8e",
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const db = getFirestore(app);

const voteForAnimal = async (animalId) => {
    const animalRef = doc(db, 'baby_animals', animalId);
    await updateDoc(animalRef, {
        votes: increment(1)
    });
};

const getAnimals = async () => {
    const baby_animalsCol = collection(db, 'baby_animals');
    const animalsSnapshot = await getDocs(baby_animalsCol);

    const outputDiv = document.getElementById("output");
    outputDiv.innerHTML = "";

    animalsSnapshot.forEach((doc) => {
        const data = doc.data();

        const animalDiv = document.createElement('div');
        animalDiv.classList.add('baby_animals');

        const img = document.createElement('img');
        img.src = data.image_url;
        img.alt = data.Name;

        const nameElement = document.createElement('h2');
        nameElement.textContent = data.Name;

        const votesElement = document.createElement('p');
        votesElement.textContent = `${data.votes} votes`;

        const voteButton = document.createElement('button');
        voteButton.textContent = "vote";
        voteButton.onclick = () => {
            voteForAnimal(doc.id);
        }

        animalDiv.appendChild(img);
        animalDiv.appendChild(nameElement);
        animalDiv.appendChild(votesElement);
        animalDiv.appendChild(voteButton);

        outputDiv.append(animalDiv);

    });
};

getAnimals();
