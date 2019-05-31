/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

 // ES6
import React, {Component} from 'react';
import {Platform, Text, View, Image} from 'react-native';

const instructions = Platform.select({
  ios: '你好，世界',
  android:
    'hello world',
});

class Greeting extends Component {
  render() {
    return (
      <View style={{alignItems: 'center', marginTop: 50}}>
        <Text>hello</Text>
      </View>
    );
  }
}

export default class App extends Component {
  render() {
    let pic = {
      uri: 'https://upload.wikimedia.org/wikipedia/commons/d/de/Bananavarieties.jpg'
    }
    return (
      // <View style={{flex:1, justifyContent:"center", alignItems: "center"}}>
      //   <Text>你好</Text>
      // </View>

      // 我们可以利用{}把js表达式嵌入到JSX语句中
      // 第四章：State（状态）
      <Image source={pic} style={{width: 193, height: 110}}/>
    );
  }
}