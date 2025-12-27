# 📱 Gerenciador de Tarefas - Flutter

Aplicativo de gerenciamento de tarefas desenvolvido em Flutter com persistência de dados usando SQLite. Projeto criado durante o **BootCamp Mobile Santander** em parceria com a **Alura** no curso "Flutter: aplicando persistência de dados".

## 📋 Sobre o Projeto

Este aplicativo permite aos usuários criar, visualizar e gerenciar suas tarefas diárias de forma simples e intuitiva. O projeto implementa conceitos fundamentais de desenvolvimento mobile com Flutter, incluindo:

- ✅ Gerenciamento de estado
- 💾 Persistência de dados com SQLite
- 🎨 Interface responsiva e intuitiva
- 📦 Arquitetura organizada com separação de responsabilidades

## 🚀 Funcionalidades

- ➕ Adicionar novas tarefas com nome, foto e dificuldade
- 📊 Visualizar lista de tarefas cadastradas
- ⭐ Sistema de níveis baseado na dificuldade das tarefas
- 💪 Barra de progresso para acompanhar o desenvolvimento de cada tarefa
- 💾 Persistência local de dados usando SQLite

## 🛠️ Tecnologias Utilizadas

- **Flutter** - Framework de desenvolvimento mobile
- **Dart** - Linguagem de programação
- **SQLite** (sqflite) - Banco de dados local para persistência
- **Material Design** - Componentes de interface

## 📦 Dependências

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  sqflite: ^2.4.2
```

## 🏗️ Estrutura do Projeto

```
lib/
├── main.dart                    # Ponto de entrada do aplicativo
├── components/                  # Componentes reutilizáveis
│   ├── difficulty.dart          # Widget de dificuldade
│   └── task.dart               # Widget de tarefa
├── data/                       # Camada de dados
│   └── task_inherited.dart     # Gerenciamento de estado
└── screens/                    # Telas do aplicativo
    ├── initial_screen.dart     # Tela inicial com lista de tarefas
    ├── form_screen.dart        # Formulário de criação de tarefas
    └── minha_primeira_tela.dart
```

## 🔧 Pré-requisitos

Antes de começar, certifique-se de ter instalado:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (>=2.16.2 <3.0.0)
- [Android Studio](https://developer.android.com/studio) ou [VS Code](https://code.visualstudio.com/)
- [Git](https://git-scm.com/)
- Emulador Android/iOS ou dispositivo físico

## 💻 Como Executar

1. **Clone o repositório**
```bash
git clone https://github.com/OYanEnrique/flutter-gerenciador-tarefas-alura.git
cd flutter-gerenciador-tarefas-alura
```

2. **Instale as dependências**
```bash
flutter pub get
```

3. **Execute o aplicativo**
```bash
flutter run
```

## 📱 Testando

Para executar os testes:

```bash
flutter test
```

## 🎓 Aprendizados

Durante o desenvolvimento deste projeto, foram aplicados conceitos importantes:

- **Widgets Stateful e Stateless**: Compreensão da diferença e quando usar cada tipo
- **Navegação**: Implementação de navegação entre telas com Navigator
- **Forms**: Criação e validação de formulários
- **Persistência de Dados**: Uso do SQLite para armazenar dados localmente
- **InheritedWidget**: Gerenciamento de estado compartilhado entre widgets
- **ListView**: Renderização eficiente de listas
- **Assets**: Gerenciamento de imagens e recursos

## 📸 Screenshots

> *Screenshots do aplicativo serão adicionados em breve*

## 🎯 Próximos Passos

Possíveis melhorias futuras:
- [ ] Implementar edição de tarefas
- [ ] Adicionar exclusão de tarefas com confirmação
- [ ] Implementar filtros e ordenação
- [ ] Adicionar categorias para tarefas
- [ ] Implementar busca de tarefas
- [ ] Adicionar temas claro/escuro
- [ ] Implementar notificações

## 👨‍💻 Autor

**Yan Enrique**
- GitHub: [@OYanEnrique](https://github.com/OYanEnrique)

## 📄 Licença

Este projeto foi desenvolvido para fins educacionais durante o BootCamp Mobile Santander.

## 🙏 Agradecimentos

- **Santander** - Pelo patrocínio do BootCamp
- **Alura** - Pela excelente qualidade do curso
- **Comunidade Flutter** - Pelo suporte e recursos disponíveis

---

⭐ Desenvolvido durante o BootCamp Mobile Santander em parceria com a Alura
