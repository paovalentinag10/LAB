---
## Front matter
lang: ru-RU
title: "Лабораторная работа №2"
subtitle: "Исследование протокола TCP и алгоритма управления очередью RED"
author:
  "Герра Гарсия Паола Валентина"
institute:
  "- Российский университет дружбы народов, Москва, Россия"

## i18n babel
##babel-lang: russian
##babel-otherlangs: english

## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
	name: english

## Formatting pdf
#toc: false
#toc-title: Содержание
slide_level: 2
aspectratio: 169
section-titles: true
theme: metropolis
header-includes:
 - \metroset{progressbar=frametitle,sectionpage=progressbar,numbering=fraction}
 - '\makeatletter'
 - '\beamer@ignorenonframefalse'
 - '\makeatother'
---

# Информация

## Докладчик

:::::::::::::: {.columns align=center}
::: {.column width="60%"}

  * Герра Гарсия Паола Валентина
  * студентка
  * Российский университет дружбы народов
  * [1032225472@pfur.ru](mailto:1032225472@pfur.ru)
  * <https://github.com/paovalentinag10/labs/tree/main>

:::
::: {.column width="25%"}

:::
::::::::::::::

## Цель работы

Исследовать протокол TCP и алгоритм управления очередью RED.

## Задание

1. Выполнить пример с дисциплиной RED;
2. Изменить в модели на узле s1 тип протокола TCP с Reno на NewReno, затем на
Vegas. Сравнить и пояснить результаты;
3. Внести изменения при отображении окон с графиками (изменить цвет фона,
цвет траекторий, подписи к осям, подпись траектории в легенде).

## Выполнение лабораторной работы

![График динамики размера окна TCP](image/1.png){#fig:001 width=50%}

## Выполнение лабораторной работы

![График динамики длины очереди и средней длины очереди](image/2.png){#fig:002 width=40%}

## Изменение протокола TCP

![График динамики размера окна TCP. Тип NewReno](image/3.png){#fig:003 width=40%}

## Изменение протокола TCP

![График динамики длины очереди и средней длины очереди. Тип NewReno](image/4.png){#fig:004 width=40%}

## Изменение протокола TCP

![График динамики размера окна TCP. Тип Vegas](image/5.png){#fig:005 width=40%}

## Изменение протокола TCP

![График динамики длины очереди и средней длины очереди. Тип Vegas](image/6.png){#fig:006 width=40%}

## Изменение отображения окон с графиками

![График динамики размера окна TCP с изменением отображения](image/7.png){#fig:007 width=40%}

## Изменение отображения окон с графиками

![График динамики длины очереди и средней длины очереди с изменением отображения](image/8.png){#fig:008 width=40%}

## Выводы

В процессе выполнения данной лабораторной работы я исследовала протокол TCP и алгоритм управления очередью RED.
