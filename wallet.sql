use wallet;

CREATE TABLE usuarios (
    user_id INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    email VARCHAR(100) not null,
    contraseña VARCHAR(100) not null,
    saldo int(11),
    PRIMARY KEY (user_id)
);
  
  CREATE TABLE transacciones (
    transaccion_id INT AUTO_INCREMENT,
    sender_user_id INT,
    receiver_user_id INT,
	monto DECIMAL(10, 2),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (transaccion_id),
    FOREIGN KEY (sender_user_id) REFERENCES usuarios(user_id),
    FOREIGN KEY (receiver_user_id) REFERENCES usuarios(user_id)
);

CREATE TABLE moneda ( 
   currency_id INT AUTO_INCREMENT,
   currency_name VARCHAR (100),
   currency_symbol VARCHAR (100),
   PRIMARY KEY (currency_id)
  
);

-- poblar tabla usuarios --
INSERT INTO usuarios (nombre, email, contraseña, saldo) VALUES ('juana martinez', 'correojuana@gmail.com', '1234', 0);
INSERT INTO usuarios (nombre, email, contraseña, saldo) VALUES ('tiare lopez', 'correotiare@gmail.com', '1234', 0);
INSERT INTO usuarios (nombre, email, contraseña, saldo) VALUES ('mario lillo', 'correomario@gmail.com', '1234', 0);
INSERT INTO usuarios (nombre, email, contraseña, saldo) VALUES ('teresa sandoval', 'correoteresa@gmail.com', '1234', 0);
INSERT INTO usuarios (nombre, email, contraseña, saldo) VALUES ('jose alvarez', 'correojose@gmail.com', '1234', 0);

-- poblar tabla transacciones --
INSERT INTO Transacciones (sender_user_id, receiver_user_id, monto) VALUES (1, 1, 250.00);
INSERT INTO Transacciones (sender_user_id, receiver_user_id, monto) VALUES (2, 1, 250.00);
INSERT INTO Transacciones (sender_user_id, receiver_user_id, monto) VALUES (3, 1, 250.00);
INSERT INTO Transacciones (sender_user_id, receiver_user_id, monto) VALUES (4, 1, 250.00);
INSERT INTO Transacciones (sender_user_id, receiver_user_id, monto) VALUES (5, 1, 250.00);
  
-- poblar tabla moneda --
INSERT INTO moneda (currency_name, currency_symbol) VALUES ('pesos', '$' );
INSERT INTO moneda (currency_name, currency_symbol) VALUES ('dolar', 'us$' );
INSERT INTO moneda (currency_name, currency_symbol) VALUES ('soles', 's/.' );
INSERT INTO moneda (currency_name, currency_symbol) VALUES ('pesos mexicanos', 'mex$' );

-- Consulta para obtener el nombre de la moneda elegida por un usuario específico
 
 SELECT usuarios.user_id,
moneda.currency_id FROM usuarios
INNER JOIN moneda ON usuarios.user_id = moneda.currency_id;

-- Consulta para obtener todas las transacciones registradas
SELECT transaccion_id, (SELECT nombre FROM usuarios where user_id =sender_user_id) as nombre_envia , monto
FROM transacciones;

-- Consulta para obtener todas las transacciones realizadas por un usuario específico

 SELECT transaccion_id, (SELECT nombre FROM usuarios where user_id = 1) nombre_envia, monto
FROM transacciones;

-- Sentencia DML para modificar el campo correo electrónico de un usuario específico

UPDATE usuarios
SET email = 'correotiarelopez@gmail.com'
WHERE user_id = 2;

-- Sentencia para eliminar los datos de una transacción (eliminado de la fila completa) 
DELETE FROM sender_user_id WHERE transaccion_id = 1;
 
 
