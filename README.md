## Features

RippleContainer provides a versatile Box widget that can apply a ripple effect in Flutter applications.

Key Features:

* Apply ripple effect
* Simple and intuitive usage
* Various customization options (background color, ripple color, speed, size, etc.)
* Compatible with all Flutter projects

## How to Use

```
RippleContainer(
	width: 200,
	height: 100,
	backgroundColor: Colors.blueAccent,
	margin: const EdgeInsets.all(10),
	borderRadius: BorderRadius.circular(30),
	splashColor: Colors.amber,
	border: const Border.fromBorderSide(BorderSide(color: Colors.grey)),
	boxShadow: [
		BoxShadow(
			color: Colors.black.withOpacity(0.5),
			offset: const Offset(0, 2),
			blurRadius: 10,
		)
	],
	onTap: () => tapTest('Button OnTap'),
	onLongPress: () => tapTest('Button OnLongPress'),
	child: const Text('Hi'),
)
```

## Example

<table style="border-collapse: collapse;border: 1px solid #dddddd;">
    <tr>
        <td>
            <img alt="" src="https://aqoong.github.io/readme-assets/ripple_container/example_img_RippleContainer.png"/>
        </td>
        <td width="50%">
            <pre><code>
RippleContainer(
	width: 200,
	height: 100,
	backgroundColor: Colors.blueAccent,
	margin: const EdgeInsets.all(10),
	borderRadius: BorderRadius.circular(30),
	splashColor: Colors.amber,
	border: const Border.fromBorderSide(BorderSide(color: Colors.grey)),
	boxShadow: [
		BoxShadow(
			color: Colors.black.withOpacity(0.5),
			offset: const Offset(0, 2),
			blurRadius: 10,
		)
	],
	onTap: () => tapTest('Button OnTap'),
	onLongPress: () => tapTest('Button OnLongPress'),
	child: const Text('Hi'),
)</code></pre>
        </td>
    </tr>
    <tr>
        <td>
            <img alt="" src="https://aqoong.github.io/readme-assets/ripple_container/example_img_Container.png"/>
        </td>
        <td width="50%">
            <pre><code>
Container(
              width: 200,
              height: 100,
              decoration: const BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(color: Colors.red))),
              child: const Text('Hi'),
            )</code></pre>
        </td>
    </tr>
</table>

## License

MIT License

Copyright (c) 2024 AQoong(cooldnjsdn@gmail.com)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.