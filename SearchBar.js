var NativeModules, PropTypes, RNSearchBar, React, SearchBar, findNodeHandle;

React = require('react-native');

RNSearchBar = React.requireNativeComponent('RNSearchBar', null);

findNodeHandle = React.findNodeHandle;

PropTypes = React.PropTypes;

NativeModules = React.NativeModules;

SearchBar = React.createClass({
  propTypes: {
    placeholder: PropTypes.string,
    text: PropTypes.string,
    tintColor: PropTypes.string,
    showsCancelButton: PropTypes.bool,
    onChange: PropTypes.func,
    onChangeText: PropTypes.func,
    onFocus: PropTypes.func,
    onSearchButtonPress: PropTypes.func,
    onCancelButtonPress: PropTypes.func,
    hideBackground: PropTypes.bool
  },
  _onChange: function(e) {
    var base, base1;
    if (typeof (base = this.props).onChange === "function") {
      base.onChange(e);
    }
    return typeof (base1 = this.props).onChangeText === "function" ? base1.onChangeText(e.nativeEvent.text) : void 0;
  },
  _onPress: function(e) {
    var base, base1, button;
    button = e.nativeEvent.button;
    if (button === 'search') {
      return typeof (base = this.props).onSearchButtonPress === "function" ? base.onSearchButtonPress(e.nativeEvent.searchText) : void 0;
    } else if (button === 'cancel') {
      return typeof (base1 = this.props).onCancelButtonPress === "function" ? base1.onCancelButtonPress() : void 0;
    }
  },
  blur: function(e) {
    return NativeModules.RNSearchBarManager.dismissKeyboard(findNodeHandle(this.refs.theSearchBar));
  },
  render: function() {
    return <RNSearchBar
      ref='theSearchBar'
      style={{height: NativeModules.RNSearchBarManager.ComponentHeight}}
      onChange={this._onChange}
      onPress={this._onPress}
      {...this.props}
    />;
  }
});

module.exports = SearchBar;
