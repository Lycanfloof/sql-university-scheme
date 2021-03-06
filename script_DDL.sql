CREATE TABLE ESTUDIANTE
(
    CODIGO_EST VARCHAR2(10),
    NOMBRE_EST VARCHAR2(50),
    NOMBRE_PROGRAMA VARCHAR2(50),
    PROMEDIO_ACUMULADO NUMBER(10,2),
    FECHA_NACIMIENTO DATE,
    PRIMARY KEY(CODIGO_EST)
);

CREATE TABLE PROFESOR
(
    CODIGO_PROF NUMBER(12, 0),
    NOMBRE_PROF VARCHAR2(50),
    DEPARTAMENTO NUMBER(5, 0),
    PRIMARY KEY (CODIGO_PROF)
);

CREATE TABLE CURSO
(
    CODIGO_CUR NUMBER(4, 0),
    NOMBRE_CUR VARCHAR2(50),
    HORARIO VARCHAR2(30),
    SALON VARCHAR2(5),
    CODIGO_PROF NUMBER(12, 0),
    PRIMARY KEY (CODIGO_CUR),
    FOREIGN KEY (CODIGO_PROF) REFERENCES PROFESOR(CODIGO_PROF)
);

CREATE TABLE MATRICULA
(
    CODIGO_EST VARCHAR2(10),
    CODIGO_CUR NUMBER(4, 0),
    PRIMARY KEY (CODIGO_EST, CODIGO_CUR),
    FOREIGN KEY (CODIGO_EST) REFERENCES ESTUDIANTE(CODIGO_EST),
    FOREIGN KEY (CODIGO_CUR) REFERENCES CURSO(CODIGO_CUR)
);

CREATE TABLE TARIFA_MONITORIA
(
    TIPO VARCHAR2(1),
    SEMESTRE_INICIO NUMBER(2, 0),
    SEMESTRE_FIN NUMBER(2, 0),
    VALOR_HORA NUMBER(5, 0),

    PRIMARY KEY (TIPO),

    CHECK (TIPO IN('A', 'B', 'C', 'D')),
    CHECK (SEMESTRE_INICIO > 2),
    CHECK (SEMESTRE_FIN >= SEMESTRE_INICIO)
);

CREATE TABLE MONITORIA
(
    CODIGO_CUR NUMBER(4, 0),
    CODIGO_EST VARCHAR2(10),
    FECHA_INICIO DATE NOT NULL,
    FECHA_FIN DATE NOT NULL,
    HORAS NUMBER(3, 0),
    TARIFA VARCHAR2(1),

    PRIMARY KEY (CODIGO_CUR, CODIGO_EST),
    FOREIGN KEY (CODIGO_CUR) REFERENCES CURSO(CODIGO_CUR),
    FOREIGN KEY (CODIGO_EST) REFERENCES ESTUDIANTE(CODIGO_EST),
    FOREIGN KEY (TARIFA) REFERENCES TARIFA_MONITORIA(TIPO),

    CHECK(HORAS <= 216 AND HORAS >= 1)
);