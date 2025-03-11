import { BrowserRouter as Router, Routes, Route, Link } from "react-router-dom";
import { useState, useEffect } from "react";
import axios from "axios";
import "tailwindcss/tailwind.css";

const Navbar = () => (
  <nav className="bg-blue-600 p-4 text-white flex justify-between">
    <Link to="/" className="font-bold text-lg">College Connect</Link>
    <div>
      <Link to="/colleges" className="mx-2">Colleges</Link>
      <Link to="/reviews" className="mx-2">Reviews</Link>
      <Link to="/messages" className="mx-2">Messages</Link>
      <Link to="/login" className="mx-2">Login</Link>
    </div>
  </nav>
);

const CollegeList = () => {
  const [colleges, setColleges] = useState([]);

  useEffect(() => {
    axios.get("http://localhost:5000/colleges").then((res) => setColleges(res.data));
  }, []);

  return (
    <div className="p-4">
      <h2 className="text-xl font-bold">Colleges</h2>
      <ul>
        {colleges.map((college) => (
          <li key={college.college_id} className="p-2 border-b">{college.name}</li>
        ))}
      </ul>
    </div>
  );
};

const ReviewList = () => {
  const [reviews, setReviews] = useState([]);

  useEffect(() => {
    axios.get("http://localhost:5000/reviews").then((res) => setReviews(res.data));
  }, []);

  return (
    <div className="p-4">
      <h2 className="text-xl font-bold">Reviews</h2>
      <ul>
        {reviews.map((review) => (
          <li key={review.review_id} className="p-2 border-b">
            {review.comment} - {review.rating}★
          </li>
        ))}
      </ul>
    </div>
  );
};

const MessageList = () => {
  const [messages, setMessages] = useState([]);

  useEffect(() => {
    axios.get("http://localhost:5000/messages").then((res) => setMessages(res.data));
  }, []);

  return (
    <div className="p-4">
      <h2 className="text-xl font-bold">Messages</h2>
      <ul>
        {messages.map((msg) => (
          <li key={msg.message_id} className="p-2 border-b">
            {msg.sender_id} → {msg.receiver_id}: {msg.message_text}
          </li>
        ))}
      </ul>
    </div>
  );
};

const Login = () => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const handleLogin = async (e) => {
    e.preventDefault();
    const res = await axios.post("http://localhost:5000/login", { email, password });
    alert(res.data.message);
  };

  return (
    <div className="p-4">
      <h2 className="text-xl font-bold">Login</h2>
      <form onSubmit={handleLogin} className="flex flex-col gap-2">
        <input
          type="email"
          placeholder="Email"
          className="border p-2"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
        />
        <input
          type="password"
          placeholder="Password"
          className="border p-2"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
        />
        <button className="bg-blue-600 text-white p-2">Login</button>
      </form>
    </div>
  );
};

const App = () => (
  <Router>
    <Navbar />
    <Routes>
      <Route path="/" element={<h1 className="text-center mt-10 text-2xl">Welcome to College Connect</h1>} />
      <Route path="/colleges" element={<CollegeList />} />
      <Route path="/reviews" element={<ReviewList />} />
      <Route path="/messages" element={<MessageList />} />
      <Route path="/login" element={<Login />} />
    </Routes>
  </Router>
);

export default App;
