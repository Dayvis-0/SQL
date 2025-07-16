-- Ejemplo de trigger
CREATE TRIGGER trg_MensajeInsertCliente
ON Cliente

SELECT * FROM Clientes;