# JAAPIDemo

**A RESTful API abstraction layer demo app.**

![image](http://iamjo.sh/github-images/jaapidemo/1.png) ![image](http://iamjo.sh/github-images/jaapidemo/2.png)

## Overview
This is a sample iOS app intended as a demonstration of design patterns and architectural decisions for one approach of implementing a RESTful API abstraction layer.

## Discussion
This demo interfaces with the [StackOverflow API](http://api.stackoverflow.com/1.0/usage) using the networking library [AFNetworking](http://afnetworking.org).

The app contains two tabs which retrieve and display Newest Answers and Top iOS Users, respectively.

The API request path is composed of the `API_BASE_URL` preprocessor macro in `JAAPI.h` and a specific path off of that base URL, which is specified in the individual JAAPI endpoint methods.

**Contributions, corrections, and improvements are always appreciated!**

## Created By
Josh Avant

## License
This is licensed under a MIT/Beerware License:

    Copyright (c) 2012 Josh Avant

    Permission is hereby granted, free of charge, to any person obtaining a
    copy of this software and associated documentation files (the "Software"),
    to deal in the Software without restriction, including without limitation
    the rights to use, copy, modify, merge, publish, distribute, sublicense,
    and/or sell copies of the Software, and to permit persons to whom the
    Software is furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
    FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
    DEALINGS IN THE SOFTWARE.

    If we meet some day, and you think this stuff is worth it, you can buy me a
    beer in return.