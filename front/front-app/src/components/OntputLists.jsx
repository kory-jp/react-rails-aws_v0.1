import React from "react";

export const OutputList = (props) => {
  const { lists } = props;

  return(
    <>
      <p>リスト一覧</p>
      {lists.map((list)=> {
        return(
          <div key={list.id}>
            {list.id} :
            {list.title}
          </div>
        )
      })}
    </>
  );
}

export default OutputList;