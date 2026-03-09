## Features

RippleContainer provides a versatile Box widget that can apply a ripple effect in Flutter applications.

Key Features:

* Apply ripple effect
* Simple and intuitive usage
* Various customization options (background color, ripple color, speed, size, etc.)
* Compatible with all Flutter projects

## How to Use

Decoration은 `ContainerDecoration`, 제스처는 `RippleCallbacks`로 전달합니다. Container처럼 `width`/`height`/`child`와 함께 사용할 수 있습니다.

```dart
RippleContainer(
  width: 200,
  height: 100,
  decoration: ContainerDecoration(
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
  ),
  rippleCallbacks: RippleCallbacks(
    onTap: () => tapTest('Button OnTap'),
    onLongPress: () => tapTest('Button OnLongPress'),
  ),
  child: const Text('Hi'),
)
```

제스처가 필요 없으면 `rippleCallbacks`를 생략하면 됩니다. 터치 시 ripple 효과만 보이고 콜백은 호출되지 않습니다.

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
  decoration: ContainerDecoration(
    backgroundColor: Colors.blueAccent,
    margin: const EdgeInsets.all(10),
    borderRadius: BorderRadius.circular(30),
    splashColor: Colors.amber,
    border: const Border.fromBorderSide(BorderSide(color: Colors.grey)),
    boxShadow: [...],
  ),
  rippleCallbacks: RippleCallbacks(
    onTap: () => tapTest('Button OnTap'),
    onLongPress: () => tapTest('Button OnLongPress'),
  ),
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