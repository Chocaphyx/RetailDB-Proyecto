-- Paso 1: Primero creamos el directorio en Oracle:
CREATE OR REPLACE DIRECTORY backup_dir AS 'C:\Users\Edison\Desktop\oracle_backup';
DROP DIRECTORY backup_dir;

-- Paso 2: Permitir exportar e importar al usuario kenji con Data Pump:
GRANT READ, WRITE ON DIRECTORY backup_dir TO kenji;
GRANT EXP_FULL_DATABASE TO kenji;
GRANT IMP_FULL_DATABASE TO kenji;

-- Paso 3: Escribir el comando de exportación en el CMD del sistema:
expdp kenji/123@XE SCHEMAS=KENJI DIRECTORY=backup_dir DUMPFILE=kenji_backup.dmp LOGFILE=kenji_backup.log

-- Verificar el directorio:
SELECT directory_name, directory_path 
FROM dba_directories
WHERE directory_name = 'BACKUP_DIR';

