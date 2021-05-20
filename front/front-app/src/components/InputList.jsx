import React from "react";

export const InputList = (props) => {
  const {list, handleInputChange, onAddList} = props

  return(
    <>
      <input 
        type="text" 
        placeholder="入力してください"
        value={list}
        onChange={handleInputChange}
        name="title"
      />
      <button onClick={onAddList}>登録</button>
    </>
  )
}

export default InputList;