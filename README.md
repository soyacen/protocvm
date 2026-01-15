# protocvm - Protoc Version Manager

`protocvm` 是一个命令行工具，用于管理多个 Protocol Buffer (protoc) 编译器版本。它允许您轻松地在不同版本之间切换，类似于 gvm (Go Version Manager)。

## 安装

### 方法一：使用安装脚本

```bash
curl -fsSL https://raw.githubusercontent.com/soyacen/protocvm/main/install.sh | bash
```

或者

```bash
wget -qO- https://raw.githubusercontent.com/soyacen/protocvm/main/install.sh | bash
```

然后按照提示将 protocvm 添加到 PATH 中：

```bash
export PATH="$PATH:$HOME/.protocvm"
```

### 方法二：手动安装

```bash
git clone https://github.com/soyacen/protocvm.git ~/.protocvm
cd ~/.protocvm
chmod +x protocvm
export PATH="$PATH:$HOME/.protocvm"
```

## 使用方法

```bash
Usage: protocvm [command]

Description:
  PROTOCVM is the Protoc Version Manager

Commands:
  version    - print the protocvm version number
  get        - gets the latest code (for debugging)
  use        - select a protoc version to use (--default to set permanently)
  help       - display this usage text
  implode    - completely remove protocvm
  install    - install protoc versions
  uninstall  - uninstall protoc versions
  list       - list installed protoc versions
  listall    - list available versions
```

### 示例

安装特定版本的 protoc：

```bash
protocvm install 3.20.3
```

使用特定版本的 protoc：

```bash
protocvm use 3.20.3
```

将某个版本设为默认版本：

```bash
protocvm use 3.20.3 --default
```

列出已安装的版本：

```bash
protocvm list
```

列出所有可用版本：

```bash
protocvm listall
```

卸载特定版本：

```bash
protocvm uninstall 3.20.3
```

## 环境变量

- `PROTOCVM_DIR` - protocvm 的安装目录 (默认为 `$HOME/.protocvm`)
- `PROTOCVM_ROOT_URL` - protoc 下载的根 URL (默认为 `https://github.com/protocolbuffers/protobuf/releases/download`)

## 贡献

欢迎提交 Issue 和 Pull Request 来改进此工具！

## 许可证

MIT