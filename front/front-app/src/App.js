import React, { useState, useEffect } from "react";
import axios from "axios";
import InputList from "./components/InputList";
import OutputList from "./components/OntputLists";

function App() {
  const [list, setList] = useState("");
  const [lists, setLists] = useState([]);

  const handleInputChange = (e) => {
    setList(e.target.value);
  };

  const onAddList = () => {
    let postData = {
      title: list,
    };
    axios
      .post("http://localhost:3001/api/v1/lists", postData)
      .then((res) => {
        setList({
          id: res.data.id,
          title: res.data.title,
        });
        setList("");
      })
      .catch((e) => {
        console.log(e);
      });
  };

  useEffect(() => {
    axios
      .get("http://localhost:3001/api/v1/lists")
      .then((res) => {
        console.log(res);
        setLists(res.data);
      })
      .catch((e) => {
        console.log(e);
      });
  }, [list]);

  return (
    <>
      <InputList
        list={list}
        handleInputChange={handleInputChange}
        onAddList={onAddList}
      />
      <OutputList lists={lists} />
    </>
  );
}

export default App;
