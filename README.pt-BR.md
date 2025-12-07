[en-US](README.md)

# O que é

Este **Design System** é uma coleção de componentes prontos para uso no Flutter, desenvolvidos para simplificar, unificar e padronizar a interface do usuário em múltiplas aplicações. Os componentes são construídos a partir de tokens e integrados com o sistema de tema do Flutter, garantindo consistência visual, facilidade de manutenção e fornecendo fallback para estilos nativos quando necessário.

# Propósito

Para acelerar o desenvolvimento de aplicações Flutter, este Design System oferece uma coleção de widgets reutilizáveis, estilos predefinidos e diretrizes de design que seguem as melhores práticas do Flutter.

# Como usar

1. Siga os pré-requisitos:
    - Flutter 3.35.0 ou superior
        - Isso é necessário devido às atualizações do framework Flutter das quais o design system depende.
    - Dart SDK versão 3.9.0 ou superior
        - Já está incluído no Flutter 3.35.0

2. Adicione a dependência ao seu arquivo `pubspec.yaml`:

```yaml
dependencies:
  renan_design_system: ^0.0.1
```

3. Use os componentes em sua aplicação Flutter. Note que alguns componentes deste design system podem usar o mesmo nome de widgets nativos do Flutter, então é recomendado importá-lo com um alias de sua escolha (ex: `ds`) para evitar conflitos de nomenclatura:

```dart
import 'package:renan_design_system/renan_design_system.dart' as ds;

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Meu App com Design System'),
        ),
        body: Center(
        child: ds.Button(
            onPressed: () {
            // Fazer ação com clique do botão
            },
            label: 'Clique aqui',
        ),
        ),
    );
    }
}
```