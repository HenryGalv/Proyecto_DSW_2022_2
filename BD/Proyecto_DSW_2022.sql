--DATABASE
CREATE DATABASE proyecto_dsw_2022
GO
--
USE proyecto_dsw_2022
GO
--CIUDAD
CREATE TABLE tb_ciudad(
	id_ciudad INT IDENTITY(1,1) PRIMARY KEY,
	nom_ciudad VARCHAR(30) NOT NULL,
)
GO
--
INSERT INTO tb_ciudad VALUES ('LIMA')
--DISTRITO
CREATE TABLE tb_distrito(
	id_dist INT IDENTITY(1,1) PRIMARY KEY,
	nom_dist VARCHAR(30) NOT NULL,
	id_ciudad INT REFERENCES tb_ciudad(id_ciudad),
)
GO
--
INSERT INTO tb_distrito VALUES ('EL AGUSTINO',1)
GO
--TIPO USUARIO
CREATE TABLE tb_tipo_usuario(
	id_tip_usu INT IDENTITY(1,1) PRIMARY KEY,
	nom_tip_usu VARCHAR(20) NOT NULL
)
GO
--
INSERT INTO tb_tipo_usuario VALUES ('ADMINISTRADOR'),
									('EMPLEADO'),
									('CLIENTE')
GO

--ROL
CREATE TABLE tb_rol(
	id_rol INT IDENTITY(1,1) PRIMARY KEY,
	nom_rol VARCHAR(30),
	desc_rol VARCHAR(120)
)
--
INSERT INTO tb_rol VALUES ('VENDEDOR', 'Realiza mantenimiento a productos y pedidos.'),
									('GERENTE', 'Visualiza los reportes de productos, empleados y ventas.')
GO
--USUARIO
CREATE TABLE tb_usuario(
	id_usu INT IDENTITY(1,1) PRIMARY KEY,
	id_tip_usu INT REFERENCES tb_tipo_usuario(id_tip_usu) NOT NULL,
	id_rol INT REFERENCES tb_rol(id_rol),
	nom_usu VARCHAR(30) NOT NULL,
	ape_usu VARCHAR(50) NOT NULL,
	correo_usu VARCHAR(30) NOT NULL,
	contra_usu VARCHAR(100) NOT NULL,
	celular_usu CHAR(9),
	id_ciudad INT REFERENCES tb_ciudad(id_ciudad),
	id_dist INT REFERENCES tb_distrito(id_dist),
	direccion_usu VARCHAR(50),
	fec_nac_usu DATETIME,
	intentos TINYINT,
	fec_bloq DATETIME,
)
GO
--
INSERT INTO tb_usuario VALUES (1,null,'Henry','Galvez','henry@gmail.com','123',null,null,null,null,null,null,null),
								(2,1,'Angel','Marin','angel@gmail.com','123',null,null,null,null,null,null,null),
								(2,2,'Maria','Buitron','maria@gmail.com','123',null,null,null,null,null,null,null),
								(3,null,'Karla','Torres','karla@gmail.com','123',null,null,null,null,null,null,null)
GO
--
--CATEGORIA
CREATE TABLE tb_categoria(
	id_cat INT IDENTITY(1,1) PRIMARY KEY,
	nom_cat VARCHAR(30)
)
GO
--
INSERT INTO tb_categoria
VALUES ('ROPA DE VERANO'),
		('ROPA DE INVIERNO'),
		('CALZADO DEPORTIVO'),
		('CALZADO DE VESTIR')
GO
--MARCA
CREATE TABLE tb_marca(
	id_mar INT IDENTITY(1,1) PRIMARY KEY,
	nom_mar VARCHAR(30)
)
GO
--
INSERT INTO tb_marca
VALUES ('NIKE'),
		('PUMA'),
		('VANS'),
		('LACOSTE')
GO
--PRODUCTO
CREATE TABLE tb_producto(
	id_pro INT IDENTITY(1,1) PRIMARY KEY,
	nom_pro VARCHAR(30),
	desc_pro VARCHAR(120),
	prec_pro DECIMAL(10,0),
	stock SMALLINT,
	id_cat INT REFERENCES tb_categoria(id_cat),
	id_mar INT REFERENCES tb_marca(id_mar)
)
GO
--
INSERT INTO tb_producto 
VALUES ('CORTEZ OG BASC SL', 'ZAPATILLA BLANCA TALLA 41', 120.50, 5, 3, 1),
		('WMNS AIR WINFLO 9', 'ZAPATILLA TRAINING PARA MUJER', 290.50, 10, 3, 1),
		('OLD SKOOL VN05KRSMUL', 'ZAPATILLA URBANAS HOMBRE', 209, 8, 3, 3)
GO
--RECLAMO
CREATE TABLE tb_reclamo(
	id_recl INT IDENTITY(1,1) PRIMARY KEY,
	desc_recl VARCHAR(30),
	fec_recl DATETIME,
	estado TINYINT,
	id_usu INT REFERENCES tb_usuario(id_usu)
)
GO
--
INSERT INTO tb_reclamo
VALUES('DESCRIPCION DEL RECLAMO PRUEBA',4)
GO
--PEDIDO
CREATE TABLE tb_pedido(
	id_ped INT IDENTITY(1,1) PRIMARY KEY,
	fec_ped DATETIME,
	estado TINYINT,
	fec_entre_ped DATETIME,
	costo_envio DECIMAL(10,0),
	id_usu_vend INT REFERENCES tb_usuario(id_usu),
	id_usu_cli INT REFERENCES tb_usuario(id_usu)
)
GO
--DETALLE PEDIDO
CREATE TABLE tb_detalle_pedido(
	id_det_ped INT IDENTITY(1,1) PRIMARY KEY,
	cant_ped INT,
	precio_unidad DECIMAL(10,0),
	desct_ped DECIMAL(10,0),
	id_ped INT REFERENCES tb_pedido(id_ped),
	id_prod INT REFERENCES tb_producto(id_pro)
)
GO
--
--PROCEDURES
--LISTAR PRODUCTOS
CREATE OR ALTER PROC usp_productos_cat_mar
AS
	SELECT p.id_pro, p.nom_pro,p.id_cat, c.nom_cat,p.id_mar, m.nom_mar, p.desc_pro, p.prec_pro, p.stock
	FROM tb_producto p JOIN tb_categoria c 
			ON p.id_cat = c.id_cat JOIN tb_marca m 
			ON m.id_mar = p.id_mar
			
GO
--
EXEC usp_productos_cat_mar
GO
--
--ELIMINAR BASE DE DATOS
USE master
GO
--
DROP DATABASE proyecto_dsw_2022
GO
--ELIMINAR TABLA
DROP TABLE tb_producto
GO
--SELECCIONAR TABLA
SELECT * FROM tb_REClamo
GO
