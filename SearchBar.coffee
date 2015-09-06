React = require 'react-native'

RNSearchBar = React.requireNativeComponent 'RNSearchBar', null

findNodeHandle = require 'findNodeHandle'

PropTypes = React.PropTypes

NativeModules = React.NativeModules


SearchBar = React.createClass

  propTypes:
    placeholder: PropTypes.string
    text: PropTypes.string
    tintColor: PropTypes.string
    showsCancelButton: PropTypes.bool
    onChange: PropTypes.func
    onChangeText: PropTypes.func
    onFocus: PropTypes.func
    onSearchButtonPress: PropTypes.func
    onCancelButtonPress: PropTypes.func
    hideBackground: PropTypes.bool

  _onChange: (e) ->
    @props.onChange? e
    @props.onChangeText? e.nativeEvent.text

  _onPress: (e) ->
    button = e.nativeEvent.button

    if button == 'search'
      @props.onSearchButtonPress? e.nativeEvent.searchText
    else if button == 'cancel'
      @props.onCancelButtonPress?()
  blur: (e) ->
      NativeModules.RNSearchBarManager.dismissKeyboard(findNodeHandle(@refs.theSearchBar))

  render: ->
    `<RNSearchBar
      ref='theSearchBar'
      style={{height: NativeModules.RNSearchBarManager.ComponentHeight}}
      onChange={this._onChange}
      onPress={this._onPress}
      {...this.props}
    />`

module.exports = SearchBar
