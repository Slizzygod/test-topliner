import React, { Component } from "react";
import "./staff-list.css";

export default class StaffList extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { name } = this.props;
    return name.map((itemst) => (
      <div className="staff">
        <ul>
          <li className="branch__info staff__info">
            <p>
              Сотрудник <span>{itemst.fio}</span>
            </p>
            <p>
              Должность: <span>{itemst.position}</span>
            </p>
            <p>
              Работает в филиале <span>{itemst.name}</span>
            </p>
            <p>
              Находящийся по адресу <span>{itemst.address}</span>
            </p>
          </li>
        </ul>
      </div>
    ));
  }
}
