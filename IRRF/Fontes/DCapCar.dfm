object DtmCapCar: TDtmCapCar
  OldCreateOrder = True
  Left = 218
  Top = 157
  Height = 206
  Width = 310
  object qryAdtoPendente: TwwQuery
    Tag = 1
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    UpdateObject = updAdtoPendente
    ControlType.Strings = (
      'STATUS;CheckBox;2;0')
    ValidateWithMask = True
    Left = 32
    Top = 8
    object qryAdtoPendenteSTATUS: TStringField
      DisplayLabel = 'Baixa'
      DisplayWidth = 4
      FieldName = 'STATUS'
      Size = 1
    end
    object qryAdtoPendenteRAZAOSOCIAL: TStringField
      DisplayLabel = 'Razão Social'
      DisplayWidth = 23
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryAdtoPendenteDOCUM: TStringField
      DisplayLabel = 'Número Adto.'
      DisplayWidth = 11
      FieldName = 'DOCUM'
      Size = 44
    end
    object qryAdtoPendenteVALRES: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 16
      FieldName = 'VALRES'
      DisplayFormat = '#,##0.00'
    end
    object qryAdtoPendenteVLRBAIXA: TFloatField
      DisplayLabel = 'Valor a Regularizar'
      DisplayWidth = 16
      FieldName = 'VLRBAIXA'
      DisplayFormat = '#,##0.00'
    end
    object qryAdtoPendenteDATALANCTO: TDateTimeField
      DisplayLabel = 'Data Lancto.'
      DisplayWidth = 11
      FieldName = 'DATALANCTO'
    end
    object qryAdtoPendenteDATAVENCTO: TDateTimeField
      DisplayLabel = 'Data Venc.'
      DisplayWidth = 11
      FieldName = 'DATAVENCTO'
    end
    object qryAdtoPendenteCODDOCUMENTO: TFloatField
      DisplayLabel = 'Código Documento'
      DisplayWidth = 10
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
  end
  object dsAdtoPendente: TwwDataSource
    DataSet = qryAdtoPendente
    Left = 32
    Top = 56
  end
  object updAdtoPendente: TUpdateSQL
    Left = 32
    Top = 104
  end
  object qryPrevPendente: TwwQuery
    Tag = 2
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT D.STATUS,P.RAZAOSOCIAL,D.NODOCUMENTO, D.CODDOCUMENTO, S.V' +
        'ALRES,S.VALRES as VLRBAIXA,L.DATALANCTO,'
      
        '       D.DATAVENCTO, D.NODOCUMENTO ||'#39' '#39'|| D.COMPLDOCUMENTO as D' +
        'OCUM'
      'FROM DOCUMENTO D, LANCTODOCUM L,'
      
        '     PESSOA P,(SELECT CODDOCUMENTO, DECODE(:pRecPag,'#39'R'#39',SUM(DECO' +
        'DE(DEBCRE,'#39'D'#39',VALOR,VALOR*-1)),SUM(DECODE(DEBCRE,'#39'D'#39',VALOR*-1,VA' +
        'LOR))) AS VALRES'
      '               FROM LANCTODOCUM GROUP BY CODDOCUMENTO) S'
      'WHERE (D.IDPESSOA = :iEmpresa) AND'
      '      (D.RECPAG = :pRecPag) AND'
      '      (D.IDFORCLI = :IForCli) AND'
      '      (D.STATUS <> '#39'2'#39' OR D.STATUS IS NULL) AND'
      
        '      (L.OPERACAO = '#39'11'#39' OR L.OPERACAO = '#39'12'#39' OR L.OPERACAO = '#39'1' +
        '3'#39') AND'
      '      (L.CODDOCUMENTO = D.CODDOCUMENTO) AND'
      '      (P.IDPESSOA = D.IDFORCLI) AND'
      '      (S.CODDOCUMENTO = D.CODDOCUMENTO)'
      'ORDER BY D.NODOCUMENTO')
    UpdateObject = updPrevPendente
    ControlType.Strings = (
      'STATUS;CheckBox;2;0')
    ValidateWithMask = True
    Left = 128
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'pRecPag'
        ParamType = ptUnknown
        Value = 'R'
      end
      item
        DataType = ftFloat
        Name = 'iEmpresa'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftString
        Name = 'pRecPag'
        ParamType = ptUnknown
        Value = 'R'
      end
      item
        DataType = ftFloat
        Name = 'IForCli'
        ParamType = ptUnknown
        Value = 10
      end>
    object StringField1: TStringField
      DisplayLabel = 'Baixa'
      DisplayWidth = 4
      FieldName = 'STATUS'
      Size = 1
    end
    object StringField2: TStringField
      DisplayLabel = 'Razão Social'
      DisplayWidth = 21
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object StringField3: TStringField
      DisplayLabel = 'Número Prev.'
      DisplayWidth = 11
      FieldName = 'DOCUM'
      Size = 44
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 16
      FieldName = 'VALRES'
      DisplayFormat = '#,##0.00'
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Valor a Regularizar'
      DisplayWidth = 16
      FieldName = 'VLRBAIXA'
      DisplayFormat = '#,##0.00'
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'Data Lancto.'
      DisplayWidth = 11
      FieldName = 'DATALANCTO'
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = 'Data Venc.'
      DisplayWidth = 11
      FieldName = 'DATAVENCTO'
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Código Documento'
      DisplayWidth = 10
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
  end
  object dsPrevPendente: TwwDataSource
    DataSet = qryPrevPendente
    Left = 128
    Top = 56
  end
  object updPrevPendente: TUpdateSQL
    Left = 128
    Top = 104
  end
  object QryModeloAutPag: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  NUMFATURA,'
      '  CODDOCUMENTO,'
      '  NUMAPGR,'
      '  REFERENCIA,'
      '  NODOCUMENTO,'
      '  COMPLDOCUMENTO,'
      '  DATAVENCTO,'
      '  DATAEMISSAO,'
      '  DATAPROGRAMADA,'
      '  NUMDOCUMENTO,'
      '  VALOR,'
      '  VALOROUTRAMOEDA,'
      '  RAZAOSOCIAL,'
      '  DESCRICAO,'
      '  VALORRATEIO,'
      '  DESCTDR,'
      '  NOMEAP,'
      '  NOMECR,'
      '  NOMECC,'
      '  OBS,'
      '  FLGDOCBANCARIO,'
      '  VLACRE,'
      '  VLDEC,'
      '  VLIMP,'
      '  VLLIQ,'
      '  TRGUSERINCLUSAO,'
      
        '  TO_DATE(TO_CHAR(TRGDTINCLUSAO,'#39'DD/MM/YYYY'#39'),'#39'DD/MM/YYYY'#39') AS T' +
        'RGDTINCLUSAO,'
      '  (0) AS TOTVALORBRUTO,'
      '  (0) AS TOTVALORDEDUCOES,'
      '  (0) AS TOTVALORACRESCIMO,'
      '  (0) AS TOTVALORIMPOSTO,'
      '  (0) AS TOTVALORAPAGAR,'
      '  (0) AS SUMVALORBRUTO,'
      '  (0) AS SUMVALORDEDUCOES,'
      '  (0) AS SUMVALORACRESCIMO,'
      '  (0) AS SUMVALORIMPOSTO,'
      '  (0) AS SUMVALORAPAGAR,'
      '  NUMIMOVEL,'
      '  NOMEPATRO,'
      '  DESCPLANO,'
      '  DESCPROGRAMA,'
      '  IDFORCLI,'
      '  (0) AS VALOLANCTOLIQ,'
      '  (0) AS SUMVALOLANCTOLIQ'
      'FROM'
      '  ('
      '    SELECT'
      '      D.NUMFATURA,'
      '      D.CODDOCUMENTO,'
      '      D.NUMAPGR,'
      '      D.REFERENCIA,'
      '      D.NODOCUMENTO,'
      '      D.COMPLDOCUMENTO,'
      '      D.DATAVENCTO,'
      '      D.DATAEMISSAO,'
      '      D.DATAPROGRAMADA,'
      '      P.NUMDOCUMENTO,'
      '      decode'
      '      ('
      '        d.recpag,'
      '        '#39'P'#39','
      '        decode'
      '        ('
      '          l.debcre,'
      '          '#39'C'#39','
      '          L.VALOR,'
      '          l.valor*-1'
      '        ),'
      '        decode'
      '        ('
      '          l.debcre,'
      '          '#39'D'#39','
      '          L.VALOR,'
      '          l.valor*-1'
      '        )'
      '      ) as valor,'
      '      decode'
      '      ('
      '        d.recpag,'
      '        '#39'P'#39','
      '        decode'
      '        ('
      '          l.debcre,'
      '          '#39'C'#39','
      '          L.VALOROUTRAMOEDA,'
      '          L.VALOROUTRAMOEDA*-1'
      '        ),'
      '        decode'
      '        ('
      '          l.debcre,'
      '          '#39'D'#39','
      '          L.VALOROUTRAMOEDA,'
      '          L.VALOROUTRAMOEDA*-1'
      '        )'
      '      ) as valoroutramoeda,'
      '      P.RAZAOSOCIAL,'
      '      F.DESCRICAO,'
      '      SUM(RD.VALOR) AS VALORRATEIO,'
      '      TDR.DESCRICAO AS DESCTDR,'
      '      AP.NOME AS NOMEAP,'
      '      CR.NOME AS NOMECR,'
      '      DECODE'
      '      ('
      '        trim(CC.NOME),'
      '        '#39#39','
      '        CR.NOME,'
      '        CC.NOME'
      '      ) AS NOMECC,'
      '      D.OBS,'
      '      F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO,'
      '      (0) AS VLACRE,'
      '      (0) AS VLDEC,'
      '      (0) AS VLIMP,'
      '      (0) AS VLLIQ,'
      '      D.TRGUSERINCLUSAO,'
      '      D.TRGDTINCLUSAO,'
      '      RD.NUMIMOVEL,'
      '      PATRO.NOME AS NOMEPATRO,'
      '      PLANO.NOME AS DESCPLANO,'
      '      PROGRAMA.DESCPROGRAMA,'
      '      D.IDFORCLI'
      '    FROM'
      '      PESSOA P,'
      '      PESSOA PATRO,'
      '      DOCUMENTO D,'
      '      LANCTODOCUM L,'
      '      RATEIODOCUM RD,'
      '      FORMARECPAG F,'
      '      TIPORECEBDESEMB TDR,'
      '      CENTCUST CC,'
      '      UNIDNEGOCIO AP,'
      '      CENTRESPON CR,'
      '      PLANPREVCONTABIL PLANO,'
      '      PROGRAMA'
      '    WHERE'
      '      D.CODTIPDOC IN'
      '      ('
      '        SELECT'
      '          CODTIPDOC'
      '        FROM'
      '          TIPODOCRECPAG A'
      '        WHERE'
      '          A.RECPAG = :RECPAG AND'
      '          NOT EXISTS'
      '          ('
      '            SELECT'
      '              *'
      '            FROM'
      '              USUARIOXTPDOCTO B'
      '            WHERE'
      '              RECPAG= :RECPAG AND'
      '              B.IDUSUARIO = :IDUSUARIO'
      '          )'
      '        UNION'
      '          SELECT'
      '            CODTIPDOC'
      '          FROM'
      '            TIPODOCRECPAG A'
      '          WHERE'
      '            A.RECPAG = :RECPAG AND'
      '            EXISTS'
      '            ('
      '              SELECT'
      '                *'
      '              FROM'
      '                USUARIOXTPDOCTO B'
      '              WHERE'
      '                RECPAG = :RECPAG AND'
      '                A.CODTIPDOC = B.CODTIPDOC AND'
      '                B.IDUSUARIO = :IDUSUARIO'
      '            )'
      '      ) AND'
      '      (d.numfatura is null) and'
      '      (L.ESTORNO IS NULL) AND'
      '      (D.RECPAG = :RECPAG) AND'
      '      (D.IDPESSOA =  :IDPESSOA) AND'
      '      (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '      (D.OPERACAO = L.OPERACAO) AND'
      '      (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND'
      '      (P.IDPESSOA = D.IDFORCLI) AND'
      '      (D.CODFORMA = F.CODFORMA(+)) AND'
      '      (CC.CODCENTROCUSTO(+) = RD.CODCENTROCUSTO) AND'
      '      (CC.IDEMPRESA(+) = RD.IDEMPRESA) AND'
      '      (TDR.CODTIPRECDES(+) = RD.CODTIPRECDES) AND'
      '      (TDR.RECPAG(+) = RD.RECPAG) AND'
      '      (TDR.IDPESSOA(+) = RD.IDPESSOA) AND'
      '      (AP.UNIDNEGOC(+) = RD.UNIDNEGOC) AND'
      '      (AP.IDPESSOA(+) = RD.IDPESSOA) AND'
      '      (CR.CODCENTRORESPON(+) = RD.CODCENTRORESPON) AND'
      '      (CR.IDPESSOA(+) = RD.IDPESSOA) AND'
      '      (PLANO.IDPLANOPREV(+) = RD.IDPLANOPREV) AND'
      '      (PROGRAMA.IDPROGRAMA(+) = RD.IDPROGRAMA) AND'
      '      (PATRO.IDPESSOA(+) = RD.IDPATRO)'
      '    GROUP BY'
      '      L.VALOR,'
      '      D.NUMFATURA,'
      '      D.CODDOCUMENTO,'
      '      D.NUMAPGR,'
      '      D.REFERENCIA,'
      '      D.NODOCUMENTO,'
      '      D.COMPLDOCUMENTO,'
      '      D.DATAVENCTO,'
      '      D.DATAEMISSAO,'
      '      D.DATAPROGRAMADA,'
      '      P.NUMDOCUMENTO,'
      '      d.recpag,'
      '      l.debcre,'
      '      L.VALOROUTRAMOEDA,'
      '      P.RAZAOSOCIAL,'
      '      F.DESCRICAO,'
      '      TDR.DESCRICAO,'
      '      AP.NOME,'
      '      CR.NOME,'
      '      CC.NOME,'
      '      D.OBS,'
      '      F.FLGDADOSBANCARIOS,'
      '      D.TRGUSERINCLUSAO,'
      '      D.TRGDTINCLUSAO,'
      '      RD.NUMIMOVEL,'
      '      PATRO.NOME,'
      '      PLANO.NOME,'
      '      PROGRAMA.DESCPROGRAMA,'
      '      D.IDFORCLI'
      '    UNION'
      '      SELECT'
      '        Q1.NUMFATURA,'
      '        Q1.CODDOCUMENTO,'
      '        Q1.NUMAPGR,'
      '        Q1.REFERENCIA,'
      '        Q1.NODOCUMENTO,'
      '        Q1.COMPLDOCUMENTO,'
      '        Q1.DATAVENCTO,'
      '        Q1.DATAEMISSAO,'
      '        Q1.DATAPROGRAMADA,'
      '        Q1.NUMDOCUMENTO,'
      '        Q1.VALOR,'
      '        Q1.VALOROUTRAMOEDA,'
      '        Q1.RAZAOSOCIAL,'
      '        Q1.DESCRICAO,'
      '        SUM(((Q1.VALOR * Q2.VALOR)/ Q3.VALOR)) AS VALORRATEIO,'
      '        Q2.DESCTDR,'
      '        Q2.NOMEAP,'
      '        Q2.NOMECR,'
      '        Q2.NOMECC,'
      '        Q1.OBS,'
      '        Q1.FLGDOCBANCARIO,'
      '        (0) AS VLACRE,'
      '        (0) AS VLDEC,'
      '        (0) AS VLIMP,'
      '        (0) AS VLLIQ,'
      '        Q1.TRGUSERINCLUSAO,'
      '        Q1.TRGDTINCLUSAO,'
      '        Q2.NUMIMOVEL,'
      '        Q2.NOMEPATRO,'
      '        Q2.DESCPLANO,'
      '        Q2.DESCPROGRAMA,'
      '        Q1.IDFORCLI'
      '      FROM'
      '        ('
      '          SELECT'
      '            DOC.NUMFATURA,'
      '            DOC.CODDOCUMENTO,'
      '            DOC.NUMAPGR,'
      '            DOC.REFERENCIA,'
      '            DOC.NODOCUMENTO,'
      '            DOC.COMPLDOCUMENTO,'
      '            DOC.DATAVENCTO,'
      '            DOC.DATAEMISSAO,'
      '            DOC.DATAPROGRAMADA,'
      '            P.NUMDOCUMENTO,'
      '            decode'
      '            ('
      '              doc.recpag,'
      '              '#39'P'#39','
      '              decode'
      '              ('
      '                lan.debcre,'
      '                '#39'C'#39','
      '                Lan.VALOR,'
      '                lan.valor*-1'
      '              ),'
      '              decode'
      '              ('
      '                lan.debcre,'
      '                '#39'D'#39','
      '                Lan.VALOR,'
      '                lan.valor*-1'
      '              )'
      '            ) as valor,'
      '            decode'
      '            ('
      '              doc.recpag,'
      '              '#39'P'#39','
      '              decode'
      '              ('
      '                lan.debcre,'
      '                '#39'C'#39','
      '                Lan.VALOROUTRAMOEDA,'
      '                Lan.VALOROUTRAMOEDA*-1'
      '              ),'
      '              decode'
      '              ('
      '                lan.debcre,'
      '                '#39'D'#39','
      '                Lan.VALOROUTRAMOEDA,'
      '                Lan.VALOROUTRAMOEDA*-1'
      '              )'
      '            ) as valoroutramoeda,'
      '            P.RAZAOSOCIAL,'
      '            F.DESCRICAO,'
      '            DOC.OBS,'
      '            F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO,'
      '            (0) AS VLACRE,'
      '            (0) AS VLDEC,'
      '            (0) AS VLIMP,'
      '            (0) AS VLLIQ,'
      '            DOC.TRGUSERINCLUSAO,'
      '            DOC.TRGDTINCLUSAO,'
      '            DOC.IDFORCLI'
      '          FROM'
      '            PESSOA P,'
      '            DOCUMENTO DOC,'
      '            LANCTODOCUM LAN,'
      '            FORMARECPAG F'
      '          WHERE'
      '            DOC.CODTIPDOC IN'
      '            ('
      '              SELECT'
      '                CODTIPDOC'
      '              FROM'
      '                TIPODOCRECPAG A'
      '              WHERE'
      '                A.RECPAG = :RECPAG AND'
      '                NOT EXISTS'
      '                ('
      '                  SELECT'
      '                    *'
      '                  FROM'
      '                    USUARIOXTPDOCTO B'
      '                  WHERE'
      '                    RECPAG = :RECPAG AND'
      '                    B.IDUSUARIO = :IDUSUARIO'
      '                )'
      '              UNION'
      '                SELECT'
      '                  CODTIPDOC'
      '                FROM'
      '                  TIPODOCRECPAG A'
      '                WHERE'
      '                  A.RECPAG = :RECPAG AND'
      '                  EXISTS'
      '                  ('
      '                    SELECT'
      '                      *'
      '                    FROM'
      '                      USUARIOXTPDOCTO B'
      '                    WHERE'
      '                      RECPAG = :RECPAG AND'
      '                      A.CODTIPDOC = B.CODTIPDOC AND'
      '                      B.IDUSUARIO = :IDUSUARIO'
      '                  )'
      '            ) AND'
      '            (LAN.ESTORNO IS NULL) AND'
      '            (DOC.RECPAG = :RECPAG) AND'
      '            (DOC.IDPESSOA = :IDPESSOA) AND'
      '            (P.IDPESSOA = DOC.IDFORCLI)AND'
      '            (DOC.CODFORMA = F.CODFORMA(+)) AND'
      '            (RTRIM(LAN.OPERACAO) IN ('#39'3'#39','#39'13'#39')) AND'
      '            (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)'
      '        ) Q1,'
      '        ('
      '          SELECT'
      '            D.NUMFATURA,'
      '            ('
      '              DECODE'
      '              ('
      '                D.RECPAG,'
      '                '#39'P'#39','
      '                DECODE'
      '                ('
      '                  L.DEBCRE,'
      '                  '#39'C'#39','
      '                  Rd.VALOR,'
      '                  Rd.VALOR * -1'
      '                ),'
      '                DECODE'
      '                ('
      '                  L.DEBCRE,'
      '                  '#39'D'#39','
      '                  Rd.VALOR,'
      '                  Rd.VALOR * -1'
      '                )'
      '              )'
      '            ) as valor,'
      '            TDR.DESCRICAO AS DESCTDR,'
      '            AP.NOME AS NOMEAP,'
      '            CR.NOME AS NOMECR,'
      '            DECODE'
      '            ('
      '              trim(CC.NOME),'
      '              '#39#39','
      '              CR.NOME,'
      '              CC.NOME'
      '            ) AS NOMECC,'
      '            RD.NUMIMOVEL,'
      '            PATRO.NOME AS NOMEPATRO,'
      '            PLANO.NOME AS DESCPLANO,'
      '            PROGRAMA.DESCPROGRAMA'
      '          FROM'
      '            PESSOA PATRO,'
      '            DOCUMENTO D,'
      '            LANCTODOCUM L,'
      '            RATEIODOCUM RD,'
      '            TIPORECEBDESEMB TDR,'
      '            CENTCUST CC,'
      '            UNIDNEGOCIO AP,'
      '            CENTRESPON CR,'
      '            PLANPREVCONTABIL PLANO,'
      '            PROGRAMA'
      '          WHERE'
      '            (D.RECPAG = :RECPAG) AND'
      '            d.coddocumento=l.coddocumento and'
      '            l.operacao=d.operacao and'
      '            (D.IDPESSOA =  :IDPESSOA) AND'
      '            (D.NUMFATURA IS NOT NULL) AND'
      '            (CC.CODCENTROCUSTO(+) = RD.CODCENTROCUSTO) AND'
      '            (CC.IDEMPRESA(+) = RD.IDEMPRESA) AND'
      '            (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND'
      '            (TDR.CODTIPRECDES(+) = RD.CODTIPRECDES) AND'
      '            (TDR.RECPAG(+) = RD.RECPAG) AND'
      '            (TDR.IDPESSOA(+) = RD.IDPESSOA) AND'
      '            (AP.UNIDNEGOC(+) = RD.UNIDNEGOC) AND'
      '            (AP.IDPESSOA(+) = RD.IDPESSOA) AND'
      '            (CR.CODCENTRORESPON(+) = RD.CODCENTRORESPON) AND'
      '            (PLANO.IDPLANOPREV(+) = RD.IDPLANOPREV) AND'
      '            (PROGRAMA.IDPROGRAMA(+) = RD.IDPROGRAMA) AND'
      '            (PATRO.IDPESSOA(+) = RD.IDPATRO) AND'
      '            (CR.IDPESSOA(+) = RD.IDPESSOA)'
      '        ) Q2,'
      '        ('
      '          SELECT'
      '            D.NUMFATURA,'
      '            sum'
      '            ('
      '              decode'
      '              ('
      '                d.recpag,'
      '                '#39'P'#39','
      '                decode'
      '                ('
      '                  l.debcre,'
      '                  '#39'C'#39','
      '                  L.VALOR,'
      '                  l.valor*-1'
      '                ),'
      '                decode'
      '                ('
      '                  l.debcre,'
      '                  '#39'D'#39','
      '                  L.VALOR,'
      '                  l.valor*-1'
      '                )'
      '              )'
      '            ) as valor'
      '          FROM'
      '            DOCUMENTO D,'
      '            LANCTODOCUM L'
      '          WHERE'
      '            (L.ESTORNO IS NULL) AND'
      '            (D.RECPAG= :RECPAG) AND'
      '            (D.IDPESSOA = :IDPESSOA) AND'
      '            (RTRIM(L.OPERACAO) IN ('#39'1'#39','#39'11'#39')) AND'
      '            (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '            (D.OPERACAO = L.OPERACAO) AND'
      '            (D.NUMFATURA IS NOT NULL)'
      '          GROUP BY'
      '            D.NUMFATURA'
      '        ) Q3'
      '      WHERE'
      '        (Q1.NUMFATURA = Q2.NUMFATURA) AND'
      '        (Q3.NUMFATURA = Q2.NUMFATURA)'
      '      GROUP BY'
      '        Q1.NUMFATURA,'
      '        Q1.CODDOCUMENTO,'
      '        Q1.NUMAPGR,'
      '        Q1.REFERENCIA,'
      '        Q1.NODOCUMENTO,'
      '        Q1.COMPLDOCUMENTO,'
      '        Q1.DATAVENCTO,'
      '        Q1.DATAEMISSAO,'
      '        Q1.DATAPROGRAMADA,'
      '        Q1.NUMDOCUMENTO,'
      '        Q1.VALOR,'
      '        Q1.VALOROUTRAMOEDA,'
      '        Q1.RAZAOSOCIAL,'
      '        Q1.DESCRICAO,'
      '        Q2.DESCTDR,'
      '        Q2.NOMEAP,'
      '        Q2.NOMECR,'
      '        Q2.NOMECC,'
      '        Q1.OBS,'
      '        Q1.FLGDOCBANCARIO,'
      '        Q1.TRGUSERINCLUSAO,'
      '        Q1.TRGDTINCLUSAO,'
      '        Q2.NUMIMOVEL,'
      '        Q2.NOMEPATRO,'
      '        Q2.DESCPLANO,'
      '        Q2.DESCPROGRAMA,'
      '        Q1.IDFORCLI'
      '  )'
      ' ')
    ValidateWithMask = True
    Left = 224
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object QryModeloAutPagNUMFATURA: TFloatField
      FieldName = 'NUMFATURA'
    end
    object QryModeloAutPagCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object QryModeloAutPagNUMAPGR: TFloatField
      FieldName = 'NUMAPGR'
    end
    object QryModeloAutPagREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 30
    end
    object QryModeloAutPagNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object QryModeloAutPagCOMPLDOCUMENTO: TStringField
      FieldName = 'COMPLDOCUMENTO'
      Size = 3
    end
    object QryModeloAutPagDATAVENCTO: TDateTimeField
      FieldName = 'DATAVENCTO'
    end
    object QryModeloAutPagNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 18
    end
    object QryModeloAutPagVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object QryModeloAutPagVALOROUTRAMOEDA: TFloatField
      FieldName = 'VALOROUTRAMOEDA'
    end
    object QryModeloAutPagRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object QryModeloAutPagDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object QryModeloAutPagVALORRATEIO: TFloatField
      FieldName = 'VALORRATEIO'
    end
    object QryModeloAutPagDESCTDR: TStringField
      FieldName = 'DESCTDR'
      Size = 35
    end
    object QryModeloAutPagNOMEAP: TStringField
      FieldName = 'NOMEAP'
      Size = 25
    end
    object QryModeloAutPagNOMECR: TStringField
      FieldName = 'NOMECR'
      Size = 30
    end
    object QryModeloAutPagNOMECC: TStringField
      FieldName = 'NOMECC'
      Size = 30
    end
    object QryModeloAutPagOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1000
    end
    object QryModeloAutPagNUMBANCO: TStringField
      FieldKind = fkCalculated
      FieldName = 'NUMBANCO'
      Size = 10
      Calculated = True
    end
    object QryModeloAutPagNUMAGENCIA: TStringField
      FieldKind = fkCalculated
      FieldName = 'NUMAGENCIA'
      Size = 15
      Calculated = True
    end
    object QryModeloAutPagCONTACORRENTE: TStringField
      FieldKind = fkCalculated
      FieldName = 'CONTACORRENTE'
      Size = 15
      Calculated = True
    end
    object QryModeloAutPagFLGDOCBANCARIO: TStringField
      FieldName = 'FLGDOCBANCARIO'
      Size = 1
    end
    object QryModeloAutPagVLACRE: TFloatField
      FieldName = 'VLACRE'
    end
    object QryModeloAutPagVLDEC: TFloatField
      FieldName = 'VLDEC'
    end
    object QryModeloAutPagVLIMP: TFloatField
      FieldName = 'VLIMP'
    end
    object QryModeloAutPagVLLIQ: TFloatField
      FieldName = 'VLLIQ'
    end
    object QryModeloAutPagTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object QryModeloAutPagNOMEUSUARIO: TStringField
      FieldKind = fkCalculated
      FieldName = 'NOMEUSUARIO'
      Size = 60
      Calculated = True
    end
    object QryModeloAutPagTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object QryModeloAutPagTOTVALORBRUTO: TFloatField
      FieldName = 'TOTVALORBRUTO'
    end
    object QryModeloAutPagTOTVALORDEDUCOES: TFloatField
      FieldName = 'TOTVALORDEDUCOES'
    end
    object QryModeloAutPagTOTVALORACRESCIMO: TFloatField
      FieldName = 'TOTVALORACRESCIMO'
    end
    object QryModeloAutPagTOTVALORIMPOSTO: TFloatField
      FieldName = 'TOTVALORIMPOSTO'
    end
    object QryModeloAutPagTOTVALORAPAGAR: TFloatField
      FieldName = 'TOTVALORAPAGAR'
    end
    object QryModeloAutPagSUMVALORBRUTO: TFloatField
      FieldName = 'SUMVALORBRUTO'
    end
    object QryModeloAutPagSUMVALORDEDUCOES: TFloatField
      FieldName = 'SUMVALORDEDUCOES'
    end
    object QryModeloAutPagSUMVALORACRESCIMO: TFloatField
      FieldName = 'SUMVALORACRESCIMO'
    end
    object QryModeloAutPagSUMVALORIMPOSTO: TFloatField
      FieldName = 'SUMVALORIMPOSTO'
    end
    object QryModeloAutPagSUMVALORAPAGAR: TFloatField
      FieldName = 'SUMVALORAPAGAR'
    end
    object QryModeloAutPagNUMIMOVEL: TStringField
      FieldName = 'NUMIMOVEL'
      Size = 60
    end
    object QryModeloAutPagNOMEPATRO: TStringField
      FieldName = 'NOMEPATRO'
      Size = 60
    end
    object QryModeloAutPagDESCPLANO: TStringField
      FieldName = 'DESCPLANO'
      Size = 50
    end
    object QryModeloAutPagDESCPROGRAMA: TStringField
      FieldName = 'DESCPROGRAMA'
      Size = 60
    end
    object QryModeloAutPagDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
    end
    object QryModeloAutPagDATAPROGRAMADA: TDateTimeField
      FieldName = 'DATAPROGRAMADA'
    end
    object QryModeloAutPagIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object QryModeloAutPagVALOLANCTOLIQ: TFloatField
      FieldName = 'VALOLANCTOLIQ'
    end
    object QryModeloAutPagSUMVALOLANCTOLIQ: TFloatField
      FieldName = 'SUMVALOLANCTOLIQ'
    end
  end
  object Qrydemsintgest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   CODTIPRECDES, DESCRICAO, SUM(VALORATU) AS VALORATU, SUM(VALOR' +
        'ANT) AS VALORANT,'
      '   ANASINT'
      'FROM'
      '  (SELECT'
      
        '      T.CODTIPRECDES, T.DESCRICAO, (0) AS VALORATU, (0) AS VALOR' +
        'ANT, T.ANASINT'
      '   FROM'
      '      TIPORECEBDESEMB T'
      '   WHERE'
      
        '      T.ANASINT = '#39'S'#39' AND  T.RECPAG=:PRECPAG AND T.IDPESSOA=:PID' +
        'PESSOA'
      '   UNION'
      '   SELECT'
      '      T.CODTIPRECDES, T.DESCRICAO,'
      
        '      SUM(DECODE(T.RECPAG,'#39'P'#39',DECODE(L.DEBCRE,'#39'C'#39',R.VALOR,R.VALO' +
        'R * -1),'
      
        '      DECODE(L.DEBCRE,'#39'D'#39',R.VALOR,R.VALOR * -1))) AS VALORATU ,(' +
        '0) AS VALORANT,'
      '      T.ANASINT'
      '   FROM'
      
        '      RATEIODOCUM R, LANCTODOCUM L, DOCUMENTO D, TIPORECEBDESEMB' +
        ' T'
      '   WHERE'
      
        '      T.RECPAG = :PRECPAG AND    ((d.numfatura is null and rtrim' +
        '(d.operacao) in ('#39'1'#39','#39'11'#39') ) or rtrim(d.operacao) not in ('#39'1'#39','#39'1' +
        '1'#39'))    and'
      '      D.RECPAG = :PRECPAG AND'
      '      T.IDPESSOA = :PIDPESSOA AND'
      '      L.ESTORNO IS NULL AND'
      '      T.CODTIPRECDES  = R.CODTIPRECDES AND'
      '      T.IDPESSOA = R.IDPESSOA AND'
      '      T.RECPAG = R.RECPAG AND'
      '      D.CODDOCUMENTO = R.CODDOCUMENTO AND'
      '      D.CODDOCUMENTO = L.CODDOCUMENTO AND'
      '      D.OPERACAO = L.OPERACAO'
      '   GROUP BY'
      '      T.CODTIPRECDES, T.DESCRICAO, T.ANASINT, L.DEBCRE, T.RECPAG'
      '   UNION'
      '   SELECT'
      '      T.CODTIPRECDES, T.DESCRICAO, (0) AS VALORATU,'
      
        '      DECODE(T.RECPAG,'#39'P'#39',DECODE(L.DEBCRE,'#39'C'#39',SUM(R.VALOR),SUM(R' +
        '.VALOR) * -1),'
      
        '      DECODE(L.DEBCRE,'#39'D'#39',SUM(R.VALOR),SUM(R.VALOR) * -1)) AS VA' +
        'LORANT ,'
      '      T.ANASINT'
      '   FROM'
      
        '      RATEIODOCUM R, LANCTODOCUM L, DOCUMENTO D, CENTRESPON CR, ' +
        'TIPORECEBDESEMB T'
      '   WHERE'
      
        '      T.RECPAG = :PRECPAG AND   ((d.numfatura is null and rtrim(' +
        'd.operacao) in ('#39'1'#39','#39'11'#39') ) or rtrim(d.operacao) not in ('#39'1'#39','#39'11' +
        #39'))    and'
      '      D.RECPAG = :PRECPAG AND'
      '      T.IDPESSOA = :PIDPESSOA AND'
      '      L.ESTORNO IS NULL AND'
      '      T.CODTIPRECDES = R.CODTIPRECDES AND'
      '      T.IDPESSOA = R.IDPESSOA AND'
      '      T.RECPAG = R.RECPAG AND'
      '      D.CODDOCUMENTO = R.CODDOCUMENTO AND'
      '      D.CODDOCUMENTO = L.CODDOCUMENTO AND'
      '      D.OPERACAO = L.OPERACAO AND'
      '      CR.IDPESSOA = R.IDPESSOA(+) AND'
      '      CR.CODCENTRORESPON = R.CODCENTRORESPON(+)'
      '   GROUP BY'
      '      T.CODTIPRECDES, T.DESCRICAO, T.ANASINT, L.DEBCRE, T.RECPAG'
      ''
      '   UNION'
      '   SELECT'
      '      T.CODTIPRECDES, T.DESCRICAO,'
      
        '      SUM(DECODE(T.RECPAG,'#39'P'#39',DECODE(L.DEBCRE,'#39'C'#39',R.VALOR,R.VALO' +
        'R * -1),'
      
        '      DECODE(L.DEBCRE,'#39'D'#39',R.VALOR,R.VALOR * -1))  * parcela.valo' +
        'r/valorlanc.valor) AS VALORATU ,(0) AS VALORANT,'
      '      T.ANASINT'
      '   FROM'
      
        '      RATEIODOCUM R, LANCTODOCUM L, DOCUMENTO D, TIPORECEBDESEMB' +
        ' T  ,'
      
        '      (select  d.numfatura, SUM(DECODE(D.RECPAG,'#39'P'#39',DECODE(L.DEB' +
        'CRE,'#39'C'#39',l.VALOR,l.VALOR * -1),'
      '        DECODE(L.DEBCRE,'#39'D'#39',l.VALOR,l.VALOR * -1)))  AS VALOR'
      '       from'
      '        lanctodocum l , documento d'
      '       where d.coddocumento=l.coddocumento'
      '         and   d.recpag=:PRECPAG and d.idpessoa=:PIDPESSOA'
      
        '         and rtrim(d.operacao)in ('#39'1'#39','#39'11'#39')   and l.estorno is n' +
        'ull'
      
        '         and d.numfatura is not null group by d.numfatura) valor' +
        'lanc,'
      ''
      
        '      (select  d.numfatura, SUM(DECODE(D.RECPAG,'#39'P'#39',DECODE(L.DEB' +
        'CRE,'#39'C'#39',l.VALOR,l.VALOR * -1),'
      
        '        DECODE(L.DEBCRE,'#39'D'#39',l.VALOR,l.VALOR * -1))) AS VALOR fro' +
        'm'
      '        lanctodocum l , documento d'
      '         where'
      '         d.coddocumento=l.coddocumento    and l.estorno is null'
      '         and   d.recpag=:PRECPAG and d.idpessoa=:PIDPESSOA'
      
        '         and rtrim(d.operacao)in ('#39'3'#39','#39'13'#39') and d.operacao=l.ope' +
        'racao'
      
        '         and d.numfatura is not null group by d.numfatura) parce' +
        'la'
      '   WHERE'
      
        '      d.numfatura=parcela.numfatura and parcela.numfatura=valorl' +
        'anc.numfatura and'
      '      valorlanc.valor<> 0 and'
      
        '      T.RECPAG = :PRECPAG     AND ( rtrim(d.operacao) in ('#39'1'#39','#39'1' +
        '1'#39')  ) and  d.numfatura is not null and'
      '      D.RECPAG = :PRECPAG AND'
      '      T.IDPESSOA = :PIDPESSOA AND'
      '      L.ESTORNO IS NULL AND'
      '      T.CODTIPRECDES  = R.CODTIPRECDES AND'
      '      T.IDPESSOA = R.IDPESSOA AND'
      '      T.RECPAG = R.RECPAG AND'
      '      D.CODDOCUMENTO = R.CODDOCUMENTO AND'
      '      D.CODDOCUMENTO = L.CODDOCUMENTO AND'
      '      D.OPERACAO = L.OPERACAO'
      '   GROUP BY'
      '      T.CODTIPRECDES, T.DESCRICAO, T.ANASINT, L.DEBCRE, T.RECPAG'
      '   UNION'
      '   SELECT'
      '      T.CODTIPRECDES, T.DESCRICAO,  (0) AS VALORATU   ,'
      
        '      SUM(DECODE(T.RECPAG,'#39'P'#39',DECODE(L.DEBCRE,'#39'C'#39',R.VALOR,R.VALO' +
        'R * -1),'
      
        '      DECODE(L.DEBCRE,'#39'D'#39',R.VALOR,R.VALOR * -1))  * parcela.valo' +
        'r/valorlanc.valor) AS VALORANT ,'
      '      T.ANASINT'
      '   FROM'
      
        '      RATEIODOCUM R, LANCTODOCUM L, DOCUMENTO D, TIPORECEBDESEMB' +
        ' T  ,'
      
        '      (select  d.numfatura, SUM(DECODE(D.RECPAG,'#39'P'#39',DECODE(L.DEB' +
        'CRE,'#39'C'#39',l.VALOR,l.VALOR * -1),'
      
        '        DECODE(L.DEBCRE,'#39'D'#39',l.VALOR,l.VALOR * -1)))  AS VALOR fr' +
        'om'
      '        lanctodocum l , documento d'
      '         where d.coddocumento=l.coddocumento'
      '         and   d.recpag=:PRECPAG and d.idpessoa=:PIDPESSOA'
      
        '         and rtrim(d.operacao)in ('#39'1'#39','#39'11'#39')   and l.estorno is n' +
        'ull'
      
        '         and d.numfatura is not null group by d.numfatura) valor' +
        'lanc,'
      ''
      
        '      (select  d.numfatura, SUM(DECODE(D.RECPAG,'#39'P'#39',DECODE(L.DEB' +
        'CRE,'#39'C'#39',l.VALOR,l.VALOR * -1),'
      
        '        DECODE(L.DEBCRE,'#39'D'#39',l.VALOR,l.VALOR * -1))) AS VALOR fro' +
        'm'
      '        lanctodocum l , documento d'
      '         where'
      '         d.coddocumento=l.coddocumento    and l.estorno is null'
      '         and   d.recpag=:PRECPAG and d.idpessoa=:PIDPESSOA'
      
        '         and rtrim(d.operacao)in ('#39'3'#39','#39'13'#39') and d.operacao=l.ope' +
        'racao'
      
        '         and d.numfatura is not null group by d.numfatura) parce' +
        'la'
      '   WHERE'
      '      valorlanc.valor <> 0 and'
      
        '      d.numfatura=parcela.numfatura and parcela.numfatura=valorl' +
        'anc.numfatura and'
      
        '      T.RECPAG = :PRECPAG     AND ( rtrim(d.operacao) in ('#39'1'#39','#39'1' +
        '1'#39')  ) and  d.numfatura is not null and'
      '      D.RECPAG = :PRECPAG AND'
      '      T.IDPESSOA = :PIDPESSOA AND'
      '      L.ESTORNO IS NULL AND'
      '      T.CODTIPRECDES  = R.CODTIPRECDES AND'
      '      T.IDPESSOA = R.IDPESSOA AND'
      '      T.RECPAG = R.RECPAG AND'
      '      D.CODDOCUMENTO = R.CODDOCUMENTO AND'
      '      D.CODDOCUMENTO = L.CODDOCUMENTO AND'
      '      D.OPERACAO = L.OPERACAO'
      '   GROUP BY'
      '      T.CODTIPRECDES, T.DESCRICAO, T.ANASINT, L.DEBCRE, T.RECPAG'
      '      )'
      'GROUP BY'
      '   CODTIPRECDES, DESCRICAO, ANASINT'
      'ORDER BY'
      '   CODTIPRECDES'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 224
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PRECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object QrydemsintgestCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Size = 15
    end
    object QrydemsintgestDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object QrydemsintgestVALORATU: TFloatField
      FieldName = 'VALORATU'
    end
    object QrydemsintgestVALORANT: TFloatField
      FieldName = 'VALORANT'
    end
    object QrydemsintgestANASINT: TStringField
      FieldName = 'ANASINT'
      Size = 1
    end
  end
end
