# SeriousSam2-Coop-Cutscenes
Co-op cutscenes patch for Serious Sam 2 version 2.224.00:747079.
Serious Sam 2 — Co-op Cutscenes
================================

A small patch for Serious Sam 2 that restores cutscenes in co-op mode.

In the regular multiplayer game, some cutscenes before and after levels do not play
the same way they do in single-player. This patch fixes that behavior for both the
host and the client: cutscenes play for both players, level transitions behave more
smoothly, and the single-player statistics screen no longer appears after a cutscene.


What this patch does
--------------------

• Enables story cutscenes in co-op for both the host and the connected player.
• Shows cutscenes before a level starts and when moving to the next level.
• Removes the extra “Statistics” screen after cutscenes in multiplayer.
• Increases network timeouts so the second player is not disconnected during long cutscenes.
• Creates backups of the modified files, so the patch can be removed later.

The patch does not modify saves, levels, game resources, or movie files.


Compatibility
-------------

This patch is made for Serious Sam 2 version 2.224.00:747079.

If you have a different game version, the installer should refuse to apply the patch
instead of silently damaging your files.

Important: the patch must be installed by every co-op player. If only the host or only
the client installs it, behavior may differ between players: one player may see the
cutscene while the other may get disconnected.


Installation
------------

1. Completely close Serious Sam 2.
2. Extract the patch files into the root Serious Sam 2 folder.

   This is the folder that contains the `Bin` and `Content` directories.

3. Run `INSTALL_COOP_CUTSCENES.cmd`.
4. Repeat the installation for the second player.
5. Start the game and create a regular co-op session.


Checking the installation
-------------------------

For a quick status check, run this command from the game folder:

`powershell -ExecutionPolicy Bypass -File .\CoopCutscenesPatch.ps1 -Action Status`

If everything is installed correctly, both game DLL files should be shown as patched,
and the network timeouts should be shown as increased to 600 seconds.

The easiest real test is to play a co-op level until an automatic level transition:

• the cutscene should appear for both players;
• the client should not disconnect during the cutscene;
• the “Statistics” screen should not appear after the cutscene;
• the transition to the next level should continue automatically.


Uninstalling
------------

If you want to restore the game to its original state, completely close the game and run:

`REMOVE_COOP_CUTSCENES.cmd`

The script will restore the backup files created during installation.


If something goes wrong
-----------------------

• Make sure the patch is installed by every player.
• Make sure everyone has the same game version: 2.224.00:747079.
• Do not install this patch over DLL files already modified by other mods.
• If the game still crashes or the client still disconnects, remove the patch with
  `REMOVE_COOP_CUTSCENES.cmd`, then install it again on clean game files.

Serious Sam 2 — кооперативные катсцены
=======================================

Небольшой патч для Serious Sam 2, который возвращает катсцены в кооперативный режим.

В обычной сетевой игре некоторые ролики перед уровнем и после уровня не показываются так,
как это происходит в одиночной игре. Этот патч исправляет поведение для хоста и клиента:
катсцены запускаются у обоих игроков, переходы между уровнями проходят спокойнее, а экран
одиночной статистики не появляется после ролика.


Что делает патч
---------------

• Включает сюжетные катсцены в кооперативе у хоста и у подключившегося игрока.
• Показывает ролики перед началом уровня и при переходе на следующий уровень.
• Убирает лишний экран «Статистика» после катсцены в сетевой игре.
• Увеличивает сетевые тайм-ауты, чтобы второго игрока не выкидывало во время долгого ролика.
• Ставит резервные копии изменяемых файлов, чтобы патч можно было удалить.

Патч не меняет сохранения, уровни, ресурсы игры и файлы с роликами.


Совместимость
-------------

Патч рассчитан на Serious Sam 2 версии 2.224.00:747079.

Если у вас другая версия игры, установщик должен отказаться от установки вместо того,
чтобы молча портить файлы.

Важно: патч должен быть установлен у всех участников кооператива. Если поставить его
только хосту или только клиенту, поведение может отличаться: у одного игрока ролик будет,
а второго может выбросить из игры.


Установка
---------

1. Полностью закройте Serious Sam 2.
2. Распакуйте файлы патча в корневую папку игры.

   Это папка, где лежат каталоги `Bin` и `Content`.

3. Запустите `INSTALL_COOP_CUTSCENES.cmd`.
4. Повторите установку у второго игрока.
5. Запустите игру и создайте обычную кооперативную сессию.


Проверка
--------

Для быстрой проверки можно запустить в папке игры:

`powershell -ExecutionPolicy Bypass -File .\CoopCutscenesPatch.ps1 -Action Status`

Если всё установлено, оба игровых DLL-файла должны отображаться как пропатченные,
а сетевые тайм-ауты — как увеличенные до 600 секунд.

После этого проще всего проверить патч в кооперативе на переходе между уровнями:

• катсцена должна появиться у обоих игроков;
• клиент не должен отключиться во время ролика;
• после ролика не должен появляться экран «Статистика»;
• переход на следующий уровень должен продолжиться автоматически.


Удаление
--------

Если нужно вернуть игру в исходное состояние, полностью закройте игру и запустите:

`REMOVE_COOP_CUTSCENES.cmd`

Скрипт восстановит резервные копии файлов, созданные при установке.


Если что-то пошло не так
-----------------------

• Убедитесь, что патч стоит у всех игроков.
• Проверьте, что у всех одинаковая версия игры: 2.224.00:747079.
• Не устанавливайте патч поверх уже изменённых DLL из других модов.
• Если игра всё равно вылетает или клиент отключается, удалите патч через
  `REMOVE_COOP_CUTSCENES.cmd`, затем установите его заново на чистые файлы игры.

