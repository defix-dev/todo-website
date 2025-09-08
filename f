## **1. Базовый синтаксис**

```sql
-- Выборка данных
SELECT column1, column2
FROM table_name
WHERE condition
GROUP BY column
HAVING condition
ORDER BY column ASC|DESC
LIMIT n;

-- Все колонки
SELECT * FROM table_name;

-- Уникальные значения
SELECT DISTINCT column FROM table_name;
```

---

## **2. Фильтрация данных**

```sql
WHERE column = value           -- равно
WHERE column <> value          -- не равно
WHERE column > value           -- больше
WHERE column < value           -- меньше
WHERE column >= value
WHERE column <= value
WHERE column BETWEEN a AND b   -- в диапазоне
WHERE column IN (val1,val2)   -- в списке
WHERE column LIKE 'pattern'    -- шаблон, % = любая последовательность, _ = один символ
WHERE column IS NULL           -- проверка на NULL
WHERE column IS NOT NULL
```

---

## **3. Операторы AND/OR/NOT**

```sql
WHERE condition1 AND condition2
WHERE condition1 OR condition2
WHERE NOT condition
```

---

## **4. Работа с таблицами**

```sql
-- Создание таблицы
CREATE TABLE table_name (
    column1 datatype [PRIMARY KEY|UNIQUE|NOT NULL],
    column2 datatype,
    column3 datatype DEFAULT default_value
);

-- Удаление таблицы
DROP TABLE table_name;

-- Изменение таблицы
ALTER TABLE table_name
ADD column_name datatype;

ALTER TABLE table_name
DROP COLUMN column_name;

ALTER TABLE table_name
RENAME TO new_table_name;
```

---

## **5. Вставка и обновление данных**

```sql
-- Вставка
INSERT INTO table_name (column1, column2)
VALUES (value1, value2);

-- Вставка нескольких строк
INSERT INTO table_name (column1, column2)
VALUES (v1,v2), (v3,v4), (v5,v6);

-- Обновление
UPDATE table_name
SET column1 = value1, column2 = value2
WHERE condition;

-- Удаление
DELETE FROM table_name
WHERE condition;
```

---

## **6. JOIN (Объединение таблиц)**

```sql
-- INNER JOIN (только совпадающие)
SELECT *
FROM table1
INNER JOIN table2
ON table1.column = table2.column;

-- LEFT JOIN (все из table1 + совпадения из table2)
SELECT *
FROM table1
LEFT JOIN table2
ON table1.column = table2.column;

-- RIGHT JOIN (все из table2 + совпадения из table1)
SELECT *
FROM table1
RIGHT JOIN table2
ON table1.column = table2.column;

-- FULL OUTER JOIN (все строки из обеих таблиц)
SELECT *
FROM table1
FULL OUTER JOIN table2
ON table1.column = table2.column;

-- CROSS JOIN (декартово произведение)
SELECT *
FROM table1
CROSS JOIN table2;
```

---

## **7. Агрегации**

```sql
SELECT COUNT(*) FROM table;         -- количество
SELECT SUM(column) FROM table;      -- сумма
SELECT AVG(column) FROM table;      -- среднее
SELECT MIN(column) FROM table;      -- минимум
SELECT MAX(column) FROM table;      -- максимум

-- GROUP BY
SELECT column, COUNT(*) 
FROM table
GROUP BY column
HAVING COUNT(*) > 1;  -- фильтр на группы
```

---

## **8. Подзапросы (Subqueries)**

```sql
-- В WHERE
SELECT * FROM table1
WHERE column IN (SELECT column FROM table2 WHERE condition);

-- В FROM (как временная таблица)
SELECT sub.column, sub.val
FROM (SELECT column, SUM(val) as val FROM table GROUP BY column) sub;

-- EXISTS
SELECT * FROM table1 t1
WHERE EXISTS (SELECT 1 FROM table2 t2 WHERE t2.id = t1.id);
```

---

## **9. Индексы и производительность**

```sql
-- Создать индекс
CREATE INDEX idx_name
ON table(column);

-- Удалить индекс
DROP INDEX idx_name;
```

---

## **10. Типы данных (кратко)**

* **Числа**: INT, BIGINT, SMALLINT, DECIMAL/NUMERIC, FLOAT, DOUBLE
* **Строки**: CHAR(n), VARCHAR(n), TEXT
* **Дата/время**: DATE, TIME, DATETIME, TIMESTAMP
* **Логический**: BOOLEAN
* **NULL** — пустое значение

---

## **11. Трюки и полезные конструкции**

```sql
-- Конкатенация строк
SELECT column1 || column2 FROM table;    -- Postgres
SELECT CONCAT(column1, column2) FROM table; -- MySQL

-- CASE WHEN
SELECT
    CASE
        WHEN column > 0 THEN 'positive'
        WHEN column = 0 THEN 'zero'
        ELSE 'negative'
    END AS status
FROM table;

-- LIMIT/OFFSET (постраничная выдача)
SELECT * FROM table
LIMIT 10 OFFSET 20;
```
