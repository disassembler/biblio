import React, {Component} from 'react';
import PureRenderMixin from 'react-addons-pure-render-mixin';
import {Winner} from './Winner';
import {Vote} from './Vote';

export class Voting extends Component {
  constructor(props) {
    super(props);
    this.shouldComponentUpdate = PureRenderMixin.shouldComponentUpdate.bind(this);
  }
  render() {
    return <div>
      {this.props.winner ?
        <Winner ref="winner" winner={this.props.winner} /> :
        <Vote {...this.props} />}
    </div>;
  }
}
