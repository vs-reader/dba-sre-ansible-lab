# Ansible lab

Установка `tree`, закрепление версии в APT и создание файла из шаблона на трёх Debian 13.

## Подготовка

[Установка Ansible и настройка SSH](docs/setup.txt).

На управляющем хосте:

```bash
git clone https://github.com/vs-reader/dba-sre-ansible-lab.git
cd dba-sre-ansible-lab
cp -n inventory.ini inventory.local.ini
nano inventory.local.ini
```

В `inventory.local.ini` укажите адреса своих ВМ и пользователя.
В `vars.yml` задайте версию `tree` из вывода `apt-cache policy tree` на целевых узлах.

## Запуск

```bash
just check
just ping
just apply db01
just show db01
just plan db01
just apply all
```

| Команда | Действие |
| --- | --- |
| `check` | Проверить синтаксис playbook |
| `ping` | Проверить подключения |
| `plan db01` | Показать план изменений |
| `apply db01` | Применить настройки |
| `show db01` | Вывести созданный файл |

Вместо `db01` можно указать `db02`, `db03` или `all`.
При sudo без пароля: `just --set sudo_flags '' apply db01`.

## Файлы

- `vars.yml`: сообщение, версия пакета и лимит для текстового примера.
- `configure_lab.yml`: проверки переменных и настройка узлов.
- `templates/`: описание узла и правило APT.
- `justfile`: команды проекта.

GitHub Actions запускает `just check` при push и pull request.
