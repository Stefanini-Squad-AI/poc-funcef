inherited FrmParamCotProdxForn: TFrmParamCotProdxForn
  Left = 367
  Top = 100
  Caption = 'Cotação - Produtos x Fornecedores'
  ClientHeight = 374
  ClientWidth = 398
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 398
    Height = 335
    object Label2: TLabel
      Left = 16
      Top = 16
      Width = 53
      Height = 13
      Caption = 'Processo'
    end
    object dblcProc: TwwDBLookupCombo
      Left = 16
      Top = 32
      Width = 204
      Height = 21
      DropDownAlignment = taRightJustify
      Selected.Strings = (
        'CODPROCESSO'#9'10'#9'Processo')
      LookupTable = qryProc
      LookupField = 'CODPROCESSO'
      Options = [loTitles]
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 64
      Width = 361
      Height = 201
      Caption = ' Carimbos/Assinaturas '
      TabOrder = 1
      TabStop = True
      object Label1: TLabel
        Left = 14
        Top = 34
        Width = 21
        Height = 13
        Caption = '1º )'
      end
      object Label3: TLabel
        Left = 14
        Top = 67
        Width = 21
        Height = 13
        Caption = '2º )'
      end
      object Label5: TLabel
        Left = 14
        Top = 99
        Width = 21
        Height = 13
        Caption = '3º )'
      end
      object Label8: TLabel
        Left = 14
        Top = 132
        Width = 21
        Height = 13
        Caption = '4º )'
      end
      object Label10: TLabel
        Left = 14
        Top = 164
        Width = 21
        Height = 13
        Caption = '5º )'
      end
      object Edit1: TEdit
        Left = 40
        Top = 32
        Width = 305
        Height = 21
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 40
        Top = 64
        Width = 305
        Height = 21
        TabOrder = 1
      end
      object Edit3: TEdit
        Left = 40
        Top = 96
        Width = 305
        Height = 21
        TabOrder = 2
      end
      object Edit4: TEdit
        Left = 40
        Top = 128
        Width = 305
        Height = 21
        TabOrder = 3
      end
      object Edit5: TEdit
        Left = 40
        Top = 160
        Width = 305
        Height = 21
        TabOrder = 4
      end
    end
    object RgTipo: TRadioGroup
      Left = 16
      Top = 272
      Width = 361
      Height = 49
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Valor Presente'
        'Preço'
        'Valor Unitário')
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 335
    Width = 398
    inherited tb97Fundo: TToolbar97
      Left = 228
      DockPos = 228
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 60
      DockPos = 60
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 779
    Top = 65523
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryProc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      P.CODPROCESSO'
      'FROM'
      '      COTACOES  C,'
      '      PROCESSO P'
      'WHERE'
      
        '       (( P.STATUS = '#39'S'#39') Or (P.STATUS = '#39'O'#39') or (P.STATUS = '#39'F'#39 +
        ' ))'
      '    AND (C.CODPROCESSO = P.CODPROCESSO)'
      'GROUP BY P.CODPROCESSO'
      'ORDER BY P.CODPROCESSO')
    ValidateWithMask = True
    Left = 325
    Top = 9
    object qryProcCODPROCESSO: TFloatField
      FieldName = 'CODPROCESSO'
      Origin = 'PROCESSO.CODPROCESSO'
    end
  end
  object qryFornCot: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     C.IDFORCLI,'
      '     C.PROPOSTA,'
      '     P.RAZAOSOCIAL,'
      '     MIN(C.PRECOAVALORPRES) AS VALOR,'
      '     MAX(TEL.TELEFONE) AS TELEFONE'
      'FROM'
      '    PESSOA P,'
      '    ENDPESS E,'
      '   ('
      
        '    SELECT TP.IDENDERECO,( '#39'( '#39'|| RTRIM(TP.DDD)||'#39' ) '#39'|| RTRIM(T' +
        'P.NUMERO) ) AS TELEFONE'
      '    FROM  TELENDPESS  TP,'
      '          (SELECT IDENDERECO, MAX(IDTELEFONE) AS IDTELEFONE'
      '           FROM TELENDPESS'
      '           WHERE (TIPO LIKE '#39'%C%'#39')'
      '           GROUP BY IDENDERECO) C'
      '    WHERE (TP.IDENDERECO = C.IDENDERECO)'
      '      AND (TP.IDTELEFONE = C.IDTELEFONE)'
      '   ) TEL,'
      '    COTACOES C'
      'WHERE'
      '      (C.CODPROCESSO  = :CODPROCESSO)'
      '  AND (C.IDFORCLI     = P.IDPESSOA)'
      '  AND (E.IDENDERECO(+) = P.IDENDCOMERCIAL)'
      '  AND (E.IDENDERECO    = TEL.IDENDERECO(+))'
      'GROUP BY C.IDFORCLI,'
      '     '#9'   C.PROPOSTA,'
      '     '#9'   P.RAZAOSOCIAL'
      'ORDER BY VALOR,P.RAZAOSOCIAL')
    ValidateWithMask = True
    Left = 256
    Top = 6
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPROCESSO'
        ParamType = ptUnknown
      end>
    object qryFornCotIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'COTACOES.IDFORCLI'
    end
    object qryFornCotPROPOSTA: TFloatField
      FieldName = 'PROPOSTA'
      Origin = 'COTACOES.PROPOSTA'
    end
    object qryFornCotRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'PESSOA.RAZAOSOCIAL'
      Size = 60
    end
    object qryFornCotVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'COTACOES.PRECOAVALORPRES'
    end
    object qryFornCotTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 30
    end
  end
  object qryCotacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     PXA.IDPROCXART,'
      '     C.IDFORCLI,'
      '     C.PROPOSTA,'
      '     (C.PRECOAVALORPRES*C.QTDEFORNECIDA) AS VALTOTPRE,'
      '     (C.PRECO*C.QTDEFORNECIDA) AS VALTOT,'
      '     (C.PRECO) AS VALUNIT,'
      '     C.STATUS,'
      '     C.PRECOAVALORPRES,'
      '     MV.MENORVALOR,'
      '     TF.MENORVALORF,'
      '     TF.VALTOTPREF,'
      '     TF.PERCMIXIDEAL,'
      '     (0) AS POS,'
      '     ('#39'                    '#39') AS TELEFONE,'
      '     ('#39'                    '#39') AS CONDPAG,'
      '     ('#39'                    '#39') AS PRAZOENT'
      'FROM'
      '    COTACOES C,'
      '    PROCXART PXA,'
      '   (SELECT'
      '        C.CODPROCESSO,'
      '        C.IDFORCLI,'
      '        C.PROPOSTA,'
      
        '        SUM(DECODE(MV.MENORVALOR,NULL,0,MV.MENORVALOR)) AS MENOR' +
        'VALORF, '
      
        '        SUM(DECODE(C.PRECOAVALORPRES,NULL,0,C.PRECOAVALORPRES)*C' +
        '.QTDEFORNECIDA) AS VALTOTPREF,'
      
        '        DECODE((SUM(DECODE(MV.MENORVALOR,NULL,0,MV.MENORVALOR)))' +
        ',0,0,(((SUM(DECODE(C.PRECOAVALORPRES,NULL,0,C.PRECOAVALORPRES)*C' +
        '.QTDEFORNECIDA)/SUM(DECODE(MV.MENORVALOR,NULL,0,MV.MENORVALOR)))' +
        '-1)*100)) AS PERCMIXIDEAL'
      '    FROM'
      '        COTACOES C,'
      '       (SELECT C.IDPROCXART,  '
      
        '               SUM((C.PRECOAVALORPRES*C.QTDEFORNECIDA))/N.NUMVEN' +
        ' AS MENORVALOR'
      '        FROM'
      '               COTACOES C,'
      '              (SELECT C.IDPROCXART, COUNT(*) AS NUMVEN'
      '               FROM'
      '                    COTACOES C'
      '               WHERE'
      '                  (C.CODPROCESSO  = :pCODPROCESSO) AND '
      '                  ((C.STATUS = '#39'S'#39') OR (C.STATUS = '#39'C'#39'))'
      '               GROUP BY IDPROCXART) N'
      '        WHERE'
      '              (C.CODPROCESSO  = :pCODPROCESSO) AND '
      '              ((C.STATUS = '#39'S'#39') OR (C.STATUS = '#39'C'#39')) AND'
      '              (C.IDPROCXART = N.IDPROCXART)'
      '        GROUP BY C.IDPROCXART, N.NUMVEN) MV'
      '    WHERE'
      '           (C.CODPROCESSO  = :pCODPROCESSO)'
      '       AND (C.IDPROCXART = MV.IDPROCXART)'
      '    GROUP BY C.CODPROCESSO, C.IDFORCLI, C.PROPOSTA) TF,'
      '   (SELECT C.IDPROCXART,  '
      
        '           SUM((C.PRECOAVALORPRES*C.QTDEFORNECIDA))/N.NUMVEN AS ' +
        'MENORVALOR'
      '    FROM'
      '           COTACOES C,'
      '           (SELECT C.IDPROCXART, COUNT(*) AS NUMVEN'
      '            FROM'
      '                 COTACOES C'
      '            WHERE'
      '               (C.CODPROCESSO  = :pCODPROCESSO) AND '
      '               ((C.STATUS = '#39'S'#39') OR (C.STATUS = '#39'C'#39'))'
      '            GROUP BY IDPROCXART) N'
      '    WHERE'
      '         (C.CODPROCESSO  = :pCODPROCESSO) AND '
      '         ((C.STATUS = '#39'S'#39') OR (C.STATUS = '#39'C'#39')) AND'
      '         (C.IDPROCXART = N.IDPROCXART)'
      '    GROUP BY C.IDPROCXART, N.NUMVEN'
      '    ) MV'
      'WHERE'
      '      (C.CODPROCESSO  = :pCODPROCESSO)'
      '  AND (PXA.CODPROCESSO = C.CODPROCESSO)'
      '  AND (PXA.IDPROCXART = C.IDPROCXART)'
      '  AND (C.IDPROCXART = MV.IDPROCXART)'
      '  AND (C.CODPROCESSO = TF.CODPROCESSO)'
      '  AND (C.IDFORCLI = TF.IDFORCLI)'
      '  AND (C.PROPOSTA = TF.PROPOSTA)'
      'ORDER BY PXA.IDPROCXART, C.IDFORCLI, C.PROPOSTA'
      ' ')
    UpdateObject = updCotacao
    ValidateWithMask = True
    Left = 128
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end>
    object qryCotacaoIDPROCXART: TFloatField
      FieldName = 'IDPROCXART'
    end
    object qryCotacaoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryCotacaoPROPOSTA: TFloatField
      FieldName = 'PROPOSTA'
    end
    object qryCotacaoVALTOTPRE: TFloatField
      FieldName = 'VALTOTPRE'
    end
    object qryCotacaoSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object qryCotacaoMENORVALOR: TFloatField
      FieldName = 'MENORVALOR'
    end
    object qryCotacaoMENORVALORF: TFloatField
      FieldName = 'MENORVALORF'
    end
    object qryCotacaoVALTOTPREF: TFloatField
      FieldName = 'VALTOTPREF'
    end
    object qryCotacaoPERCMIXIDEAL: TFloatField
      FieldName = 'PERCMIXIDEAL'
    end
    object qryCotacaoPOS: TFloatField
      FieldName = 'POS'
    end
    object qryCotacaoPRECOAVALORPRES: TFloatField
      FieldName = 'PRECOAVALORPRES'
    end
    object qryCotacaoTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object qryCotacaoCONDPAG: TStringField
      FieldName = 'CONDPAG'
    end
    object qryCotacaoPRAZOENT: TStringField
      FieldName = 'PRAZOENT'
    end
    object qryCotacaoVALTOT: TFloatField
      FieldName = 'VALTOT'
    end
    object qryCotacaoVALUNIT: TFloatField
      FieldName = 'VALUNIT'
    end
  end
  object updCotacao: TUpdateSQL
    Left = 192
    Top = 8
  end
end
