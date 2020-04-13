import React, { Component } from 'react';
import todo1 from '../images/todo1.png';
export  default  class indexTodo extends Component {
    render(){
        return (
            <div>
                <center>

                    <h3>Xin chào các bạn đến với ứng dụng todoList</h3>
                    <br/>
                    Quản lí công việc thật dễ dàng và hiệu quả.
                    <br/>
                    <img src={todo1} width="400" height="430" alt="todo"/>
                </center>
     
            </div>
        );
    }


}
