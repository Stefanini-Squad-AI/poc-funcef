# 🗄️ Base de Datos - POC FUNCEF

## 📋 Descripción

Este directorio contiene la configuración de base de datos Oracle para el POC de migración del módulo de Contabilidad de FUNCEF.

**Motor**: Oracle Express Edition (XE) 21c  
**Schema Principal**: `CM`  
**Schema Auditoría**: `LOGPLANUS`

---

## 🚀 Quick Start

### Pre-requisitos

- **Docker Desktop** instalado y funcionando
- **Cuenta en Oracle Container Registry** (gratis):
  1. Ir a https://container-registry.oracle.com
  2. Sign In / Sign Up
  3. Buscar "database/express"
  4. Aceptar términos y condiciones

### Setup en 3 pasos

```bash
# 1. Login en Oracle Container Registry
docker login container-registry.oracle.com
Username: tu-email@example.com
Password: tu-password

# 2. Levantar Oracle XE
cd database
docker-compose up -d

# 3. Esperar inicialización (2-3 minutos)
docker logs -f funcef-oracle-xe
# Buscar línea: "DATABASE IS READY TO USE!"
```

### Verificar instalación

```bash
# Conectar a SQL*Plus
docker exec -it funcef-oracle-xe sqlplus CM/cm_password@XEPDB1

SQL> SELECT COUNT(*) FROM PLANOCONTA;
# Debe mostrar ~32 cuentas

SQL> SELECT PLANOME FROM PLANOCONTA WHERE PLANO=1 AND PLAGRAU=1;
# Debe mostrar: ACTIVO, PASIVO, PATRIMONIO NETO, INGRESOS, GASTOS

SQL> EXIT
```

---

## 📂 Estructura de Archivos

```
database/
├── docker-compose.yml          # Configuración Docker Oracle XE
├── README.md                   # Este archivo
└── init-scripts/               # Scripts ejecutados automáticamente
    ├── 01-create-users.sql     # Usuarios CM y LOGPLANUS
    ├── 02-create-schema.sql    # Tablas, sequences, indices
    ├── 03-create-triggers.sql  # Triggers de auditoría
    └── 04-seed-data.sql        # Datos de prueba (32 cuentas)
```

---

## 🗂️ Esquema de Base de Datos

### Tablas Principales

#### 1. `CM.PLANO`
Plan contable de la entidad.

| Campo | Tipo | Descripción |
|-------|------|-------------|
| IDPLANO | NUMBER(10) PK | ID del plan |
| NOME | VARCHAR2(100) | Nombre del plan |
| MASCARA | VARCHAR2(50) | Formato cuentas (ej: 9.9.9.99.999) |
| ATIVO | VARCHAR2(1) | S/N |

#### 2. `CM.PLANOCONTA`
Cuentas contables del plan.

**Clave Primaria**: `(PLANO, PLACONTA)`

Campos principales:
- **Identificación**: PLACONTA, PLANOME, PLAREDUZ
- **Clasificación**: PLATIPO (A/P/R/D), PLAGRUPO, PLAGRAU
- **Contabilidad**: PLANATUREZA (D/C), PLASUMARIZA (S/N)
- **Configuración**: PLAALTERA, PLAINATIVA, PLACCUST, PLACONCILIA
- **Relaciones**: PLACONTRAPARTIDA, PLACONCORRESP

#### 3. `CM.CONTASXCC`
Relación entre cuentas y centros de costo.

#### 4. `LOGPLANUS.LOG_PLANUS_PLANOCONTA`
Auditoría de cambios (trigger automático).

### Diagrama ER

```
┌─────────────┐
│   PLANO     │
│-------------|
│ IDPLANO (PK)│
│ NOME        │
│ MASCARA     │
└──────┬──────┘
       │ 1
       │
       │ N
┌──────┴───────────┐
│   PLANOCONTA     │
│------------------|
│ PLANO (PK,FK)    │
│ PLACONTA (PK)    │
│ PLANOME          │
│ PLATIPO          │
│ ...              │
└──────┬───────────┘
       │ 1
       │
       │ N
┌──────┴───────────┐
│   CONTASXCC      │
│------------------|
│ IDCONTACC (PK)   │
│ PLANO (FK)       │
│ PLACONTA (FK)    │
│ CODCENTROCUSTO   │
└──────────────────┘
```

---

## 🔌 Connection Strings

### Para desarrollo local (Docker)

**.NET (appsettings.json)**:
```json
{
  "ConnectionStrings": {
    "OracleDb": "Data Source=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=localhost)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=XEPDB1)));User Id=CM;Password=cm_password;Pooling=true;Min Pool Size=5;Max Pool Size=100;"
  }
}
```

**SQL*Plus**:
```bash
sqlplus CM/cm_password@localhost:1521/XEPDB1
```

**Oracle SQL Developer**:
- Hostname: `localhost`
- Port: `1521`
- Service Name: `XEPDB1`
- Username: `CM`
- Password: `cm_password`

### Enterprise Manager Express

Acceder a: http://localhost:5500/em

- Usuario: `sys`
- Password: `OraclePwd123`
- Container: `XEPDB1`
- Role: `SYSDBA`

---

## 📊 Datos de Prueba

### Plan Contable Creado

**IDPLANO**: 1  
**NOME**: Plan Contable FUNCEF 2026  
**MASCARA**: 9.9.9.99.999

### Estructura de Cuentas (32 cuentas)

```
1         ACTIVO (sintética)
├── 1.1       ACTIVO CIRCULANTE (sintética)
│   ├── 1.1.1     DISPONIBLE (sintética)
│   │   ├── 1.1.1.01  CAJA GENERAL (analítica)
│   │   ├── 1.1.1.02  BANCO BRASIL C/C (analítica)
│   │   └── 1.1.1.03  BANCO CAIXA C/C (analítica)
│   └── 1.1.2     CRÉDITOS A CORTO PLAZO (sintética)
│       ├── 1.1.2.01  CLIENTES POR COBRAR (analítica)
│       └── 1.1.2.02  ANTICIPOS A PROVEEDORES (analítica)

2         PASIVO (sintética)
└── 2.1       PASIVO CIRCULANTE (sintética)
    └── 2.1.1     OBLIGACIONES A CORTO PLAZO (sintética)
        ├── 2.1.1.01  PROVEEDORES POR PAGAR (analítica)
        ├── 2.1.1.02  IMPUESTOS POR PAGAR (analítica)
        └── 2.1.1.03  SALARIOS POR PAGAR (analítica)

3         PATRIMONIO NETO (sintética)
└── 3.1       CAPITAL SOCIAL (sintética)
    └── 3.1.1     CAPITAL SUSCRITO (sintética)
        └── 3.1.1.01  CAPITAL PAGADO (analítica)

4         INGRESOS (sintética)
└── 4.1       INGRESOS OPERACIONALES (sintética)
    └── 4.1.1     VENTAS DE SERVICIOS (sintética)
        ├── 4.1.1.01  VENTAS SERVICIOS NACIONALES (analítica)
        └── 4.1.1.02  VENTAS SERVICIOS INTERNACIONALES (analítica)

5         GASTOS (sintética)
└── 5.1       GASTOS OPERACIONALES (sintética)
    └── 5.1.1     GASTOS ADMINISTRATIVOS (sintética)
        ├── 5.1.1.01  SALARIOS Y CARGAS SOCIALES (analítica)
        ├── 5.1.1.02  ALQUILERES (analítica)
        ├── 5.1.1.03  SERVICIOS PÚBLICOS (analítica)
        └── 5.1.1.04  DEPRECIACIÓN (analítica)
```

### Queries Útiles

```sql
-- Ver todas las cuentas con indentación jerárquica
SELECT 
    LPAD(' ', (PLAGRAU-1)*2, ' ') || PLACONTA AS CUENTA,
    PLANOME,
    PLATIPO,
    CASE PLASUMARIZA WHEN 'S' THEN 'Sintética' ELSE 'Analítica' END AS TIPO
FROM CM.PLANOCONTA
WHERE PLANO = 1
ORDER BY PLACONTA;

-- Ver solo cuentas analíticas (pueden recibir lanzamientos)
SELECT PLACONTA, PLANOME, PLATIPO, PLANATUREZA
FROM CM.PLANOCONTA
WHERE PLANO = 1 AND PLASUMARIZA = 'N'
ORDER BY PLACONTA;

-- Ver log de auditoría
SELECT 
    TO_CHAR(DATAHORA, 'DD/MM/YYYY HH24:MI:SS') AS FECHA,
    OPERACAO,
    USUARIO,
    PLANO,
    PLACONTA
FROM LOGPLANUS.LOG_PLANUS_PLANOCONTA
ORDER BY DATAHORA DESC;
```

---

## 🛠️ Comandos Útiles

### Gestión del contenedor

```bash
# Iniciar Oracle
docker-compose up -d

# Ver logs
docker logs -f funcef-oracle-xe

# Detener Oracle
docker-compose down

# Detener Y BORRAR datos (¡CUIDADO!)
docker-compose down -v

# Reiniciar Oracle
docker-compose restart

# Ver estado
docker-compose ps
```

### Conectar a SQL*Plus

```bash
# Como usuario CM
docker exec -it funcef-oracle-xe sqlplus CM/cm_password@XEPDB1

# Como SYS (admin)
docker exec -it funcef-oracle-xe sqlplus sys/OraclePwd123@XEPDB1 as sysdba

# Como LOGPLANUS
docker exec -it funcef-oracle-xe sqlplus LOGPLANUS/log_password@XEPDB1
```

### Backup y Restore

```bash
# Export de schema CM
docker exec funcef-oracle-xe expdp CM/cm_password@XEPDB1 \
  schemas=CM directory=DATA_PUMP_DIR dumpfile=cm_backup.dmp

# Import
docker exec funcef-oracle-xe impdp CM/cm_password@XEPDB1 \
  schemas=CM directory=DATA_PUMP_DIR dumpfile=cm_backup.dmp
```

### Re-ejecutar scripts

```bash
# Re-crear schema (borra TODO)
docker exec -i funcef-oracle-xe sqlplus sys/OraclePwd123@XEPDB1 as sysdba << EOF
DROP USER CM CASCADE;
DROP USER LOGPLANUS CASCADE;
@/opt/oracle/scripts/startup/01-create-users.sql
@/opt/oracle/scripts/startup/02-create-schema.sql
@/opt/oracle/scripts/startup/03-create-triggers.sql
@/opt/oracle/scripts/startup/04-seed-data.sql
EOF
```

---

## 🔧 Entity Framework Core

### Setup en proyecto .NET

```bash
cd ../backend/src/ContabPOC.Infrastructure

# Instalar paquetes
dotnet add package Oracle.EntityFrameworkCore --version 8.23.50
dotnet add package Oracle.ManagedDataAccess.Core --version 23.5.1

# Crear migración inicial
dotnet ef migrations add InitialCreate --startup-project ../ContabPOC.API

# Aplicar migración (alternativa a scripts SQL)
dotnet ef database update --startup-project ../ContabPOC.API
```

### DbContext Configuration

```csharp
// ContabPOCDbContext.cs
protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
{
    optionsBuilder.UseOracle(
        Configuration.GetConnectionString("OracleDb"),
        options => options
            .MigrationsHistoryTable("__EFMigrationsHistory", "CM")
            .UseOracleSQLCompatibility("11"));
}
```

---

## 📈 Performance y Monitoreo

### Ver sesiones activas

```sql
SELECT 
    s.sid,
    s.serial#,
    s.username,
    s.program,
    s.status,
    s.logon_time
FROM v$session s
WHERE s.username IN ('CM', 'LOGPLANUS')
ORDER BY s.logon_time DESC;
```

### Ver queries lentas

```sql
SELECT 
    sql_text,
    executions,
    elapsed_time/1000000 AS elapsed_sec,
    cpu_time/1000000 AS cpu_sec
FROM v$sql
WHERE parsing_schema_name = 'CM'
  AND elapsed_time > 1000000
ORDER BY elapsed_time DESC;
```

### Tamaño de tablas

```sql
SELECT 
    segment_name,
    ROUND(bytes/1024/1024, 2) AS size_mb
FROM user_segments
WHERE segment_type = 'TABLE'
ORDER BY bytes DESC;
```

---

## ⚠️ Limitaciones Oracle XE

Oracle Express Edition tiene las siguientes restricciones:

| Recurso | Límite |
|---------|--------|
| CPU | 2 cores |
| RAM | 2 GB |
| Datos | 12 GB |
| Pluggable DBs | 3 |

**Para el POC esto es suficiente**. Para producción, FUNCEF usará Oracle Enterprise.

---

## 🔒 Seguridad

### Passwords por defecto (CAMBIAR EN PRODUCCIÓN)

| Usuario | Password | Uso |
|---------|----------|-----|
| SYS | `OraclePwd123` | Administrador Oracle |
| CM | `cm_password` | Schema aplicación |
| LOGPLANUS | `log_password` | Schema auditoría |

### Cambiar passwords

```sql
-- Conectar como SYS
docker exec -it funcef-oracle-xe sqlplus sys/OraclePwd123@XEPDB1 as sysdba

SQL> ALTER USER CM IDENTIFIED BY nueva_password;
SQL> ALTER USER LOGPLANUS IDENTIFIED BY nueva_password;
```

Actualizar en:
- `docker-compose.yml` (variables de entorno)
- `backend/appsettings.json` (connection string)
- Scripts SQL (si se re-ejecutan)

---

## 🐛 Troubleshooting

### "Cannot connect to database"

```bash
# 1. Verificar que el contenedor está corriendo
docker ps | grep funcef-oracle

# 2. Ver logs de Oracle
docker logs funcef-oracle-xe | tail -50

# 3. Verificar health check
docker inspect funcef-oracle-xe | grep -A 10 Health
```

### "Insufficient privileges"

```sql
-- Conectar como SYS y otorgar permisos
GRANT CREATE SESSION TO CM;
GRANT CREATE TABLE TO CM;
GRANT UNLIMITED TABLESPACE TO CM;
```

### "ORA-28040: No matching authentication protocol"

Agregar a connection string:
```
;Connection Timeout=120;DBAPrivilege=None;
```

### Recrear desde cero

```bash
# Detener y borrar TODO
docker-compose down -v

# Borrar volumen manualmente si persiste
docker volume rm funcef-oracle-data

# Volver a crear
docker-compose up -d
```

---

## 📚 Referencias

- **Oracle XE**: https://www.oracle.com/database/technologies/appdev/xe.html
- **Oracle Container Registry**: https://container-registry.oracle.com
- **ODP.NET Core**: https://www.oracle.com/database/technologies/appdev/dotnet/odp.html
- **EF Core Oracle**: https://docs.oracle.com/en/database/oracle/oracle-database/21/odpnt/ef.html
- **SQL*Plus Guide**: https://docs.oracle.com/en/database/oracle/oracle-database/21/sqpug/

---

## 🤝 Soporte

Para problemas relacionados con:
- **Oracle XE**: Ver logs y documentación oficial
- **Docker**: Verificar Docker Desktop funciona correctamente
- **Scripts SQL**: Revisar `init-scripts/` y logs de ejecución
- **Entity Framework**: Verificar connection string y paquetes NuGet

---

**Última actualización**: 2026-09-07  
**Versión Oracle XE**: 21.3.0  
**Compatible con**: .NET 8+, Entity Framework Core 8+
