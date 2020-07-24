import React, { Component } from "react";
import StaffList from '../staff-list';
import './branch-list.css';

export default class BrenchList extends Component {

  constructor(props) {
    super(props);
    this.getStaffList = this.getStaffList.bind(this);
  }

  state = {
    error: null,
    isLoaded: false,
    isLoadedStaffList: false,
    items: [],
    itemsStaff: [],
  };

  componentDidMount() {
    fetch("http://test-arvis/api/branchList/", {mode: 'cors', method: 'GET'})
      .then((res) => res.json())
      .then(
        (result) => {
          this.setState({
            isLoaded: true,
            items: result,
          });
        },
        (error) => {
          this.setState({
            isLoaded: false,
          });
        }
      );
  }

  getStaffList(item){
    const itemId = item;
    fetch("http://test-arvis/api/staffList/?id="+itemId, {mode: 'cors', method: 'GET'})
      .then((res) => res.json())
      .then(
        (result) => {
          this.setState({
            isLoadedStaffList: true,
            itemsStaff: result,
          });
        },
        (errorLoadStaff) => {
          this.setState({
            isLoadedStaffList: false,
          });
        }
      );
  }

  render() {
    const { error, items, message, isLoaded } = this.state;
    const { itemsStaff, isLoadedStaffList } = this.state;
    if (error) {
      return <div>Ошибка: {message}</div>;
    } else if (isLoaded == false && isLoadedStaffList == false) {
      return <div>Загрузка...</div>;
    } else {
      return (<div >
        {items.map(item => (
          <div className="branch">
            <ul><li className="branch__info">{item.name}</li></ul>
            <button key={item.id} onClick={() => this.getStaffList(item.id)} className="branch__info__button">Подробнее</button>
          </div>
        ))}
        <StaffList name={ this.state.itemsStaff } />
        </div>);
    }
  }
}
