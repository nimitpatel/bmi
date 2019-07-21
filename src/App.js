import React from 'react';
import './App.css';

class App extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      weight: '',
      height: '',
      bmi: '',
      message: ''
    }
    this.handleWeight = this.handleWeight.bind(this);
    this.handleHeight = this.handleHeight.bind(this);
    this.compute = this.compute.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleWeight(e) {
    e.preventDefault();
    this.setState({
      weight: e.target.value
    });
  }
  
  handleHeight(e) {
    e.preventDefault();
    this.setState({
      height: e.target.value
    });
  }

  compute() {
    var h = (this.state.height/3.281 * this.state.height/3.281);
    var w = (this.state.weight);
    var bmi = w / h;   
    var message = "";

    if( bmi >= 18.5 && bmi <= 24.99 ) {
      message = "Normal BMI";
    }
    if( bmi <= 18.4 ) {
      message = "Underweight BMI";
    }
    if( bmi >= 25 && bmi <= 29.99 ) {
      message = "Overweight BMI";
    }

    this.setState({
      bmi: Math.round(bmi)
    });
    this.setState({
      message: message
    });
  }

  handleSubmit(e) {
    e.preventDefault();
    this.compute();
  }

  render() {
    return (
      <>
        <div className="title">
          <h1>Body Mass Index</h1>
        </div>
        <div className="container">
          <div className="bmi-input">
            <div className="bmi-title">
              <h1>BMI Calculator</h1>
            </div>
            <Form 
              handleSubmit={this.handleSubmit}
              handleHeight={this.handleHeight}
              handleWeight={this.handleWeight}
            />
          </div>
          <div className="bmi-data">
            <div className="bmi-title">
              <h1>Your BMI Report</h1>
            </div>
            <p> Weight: <span>{ this.state.weight }</span> </p>
            <p> Height: <span>{ this.state.height }</span> </p>
            <p> BMI: <span>{ this.state.bmi }</span> </p>
            <p> Message: <span>{ this.state.message }</span> </p>
          </div>
        </div>
        <p>Developed by <a href="https://www.instagram.com/nimit.codes">Nimit Patel</a></p>
      </>
    );
  }
}


const Input = props => (
  <div className="form-group">
    <label> { props.label } </label>
    <input type="text" placeholder={ props.placeholder } onChange={ props.change } />
  </div>
)

const Form = props => (
  <form onSubmit={ props.handleSubmit }>
    <Input 
      label="Weight" 
      placeholder="Enter your weight in kg" 
      change={ props.handleWeight }
    />
    <Input 
      label="Height" 
      placeholder="Enter your height in feet" 
      change={ props.handleHeight }
    />
    <div className="btn">
      <input type="submit" value="Calculate" />
    </div>
  </form>
)

export default App;
