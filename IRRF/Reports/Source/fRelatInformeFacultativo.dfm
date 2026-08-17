inherited frmRelatInformeFacultativo: TfrmRelatInformeFacultativo
  Left = 313
  Top = 234
  HelpContext = 240035
  Caption = 'Demonstrativo Anual para Contribuição Facultativa'
  ClientHeight = 170
  ClientWidth = 592
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 592
    Height = 131
    object Label5: TLabel
      Left = 19
      Top = 66
      Width = 55
      Height = 13
      Caption = 'Ano Base'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 115
      Top = 66
      Width = 55
      Height = 13
      Caption = 'Exercício'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 230
      Top = 98
      Width = 200
      Height = 13
      Caption = 'ou manutenção de saldo de contas'
      Visible = False
    end
    inline molParticipante: TmolParticipante
      Left = 10
      Top = 16
      Width = 567
      inherited edtNome: TEdit
        Width = 313
      end
      inherited btnBuscaPart: TBitBtn
        Left = 512
      end
      inherited btnLimpaPart: TBitBtn
        Left = 536
      end
    end
    object dbspnAnoBase: TwwDBSpinEdit
      Left = 19
      Top = 83
      Width = 62
      Height = 21
      Increment = 1
      Value = 2004
      MaxLength = 4
      TabOrder = 1
      UnboundDataType = wwDefault
    end
    object dbSpnExercicio: TwwDBSpinEdit
      Left = 115
      Top = 83
      Width = 62
      Height = 21
      Increment = 1
      Value = 2005
      MaxLength = 4
      TabOrder = 2
      UnboundDataType = wwDefault
    end
    object ChkBxAutoPatro: TCheckBox
      Left = 211
      Top = 81
      Width = 233
      Height = 17
      Caption = 'Gerar apenas para autopatrocinados'
      TabOrder = 3
      Visible = False
    end
  end
  inherited Dock971: TDock97
    Top = 131
    Width = 592
    inherited tb97Fundo: TToolbar97
      Left = 420
      DockPos = 459
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 151
      inherited ToolbarSep971: TToolbarSep97
        Left = 181
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 100
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 184
      end
      object btnGeraTXT: TBitBtn
        Left = 0
        Top = 0
        Width = 100
        Height = 33
        Caption = 'Gera TXT'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = btnGeraTXTClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888811888
          88888888888778F88888888888199188888888888878878F8888888881999918
          8888888887888878F888888819999991888888887FFF88F7F888888811199111
          88888888777F8777888888888819918888888888887F87F88888888888199188
          888888FFFF7F87FFFFF880000019910000888777777FF77777FF777777111177
          7708777777777777777878FFFFFFFFFF87707F8FFFFFFFFFF7F7787777777777
          87707F777777777787F778888888888887707F888888888887F7788888888882
          87707FFFFFFFFFFFF7F77FFFFFFFFFFFF7707777777777777787878888888888
          8870878FFFFFFFFFFFF788777777777777788877777777777778}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 243
  end
  object sqlValores: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '    *'
      'FROM'
      '    ('
      '      SELECT'
      '          1 AS CODTIPO,'
      '          P.IDPESSOA,'
      '          '#39'EMPREGADO'#39' AS TIPO,'
      '          EL.MATRICULA,'
      '          P.NOME,'
      '          -1 AS CODALTERADOR,'
      '          '#39#39' AS NOMEALTERADOR,'
      
        '          SUM(DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.' +
        'VALORRECEBIDO)) AS VALORPAGO'
      '      FROM'
      '          PESSOA P,'
      '          ELEGPATRO EL,'
      '          HSTCONTRIBPREV H,'
      '          CONTPREV CP'
      '      WHERE'
      '          CP.FLGPAGADOR = '#39'C'#39
      '      AND (:IDPESSOA IS NULL OR P.IDPESSOA = :IDPESSOA)'
      '      AND CP.FLGINTERNO = '#39'MA'#39
      '      AND H.MESCOBRANCA >= :PINICIO'
      '      AND H.MESCOBRANCA <= :PFINAL'
      '      AND CP.IDPLANOPREV    = H.IDPLANOPREV'
      '      AND CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO'
      '      AND EL.IDPESSJUR = H.IDPESSJUR'
      '      AND EL.IDPESSOA = H.IDPESSOA'
      '      AND P.IDPESSOA = EL.IDPESSOA'
      '      GROUP BY'
      '          P.IDPESSOA,'
      '          EL.MATRICULA,'
      '          P.NOME'
      '      UNION'
      '      SELECT'
      '          2 AS CODTIPO,'
      '          P.IDPESSOA,'
      '          '#39'EMPRESA'#39' AS TIPO,'
      '          EL.MATRICULA,'
      '          P.NOME,'
      '          -1 AS CODALTERADOR,'
      '          '#39#39' AS NOMEALTERADOR,'
      
        '          SUM(DECODE(NVL(H.FLGDEVOLUCAO,0),0,H.VALORRECEBIDO,-H.' +
        'VALORRECEBIDO)) AS VALORPAGO'
      '      FROM'
      '          PESSOA P,'
      '          ELEGPATRO EL,'
      '          HSTCONTRIBPREV H,'
      '          CONTPREV CP'
      '      WHERE'
      '          CP.FLGPAGADOR = '#39'P'#39
      '      AND (:IDPESSOA IS NULL OR P.IDPESSOA = :IDPESSOA)'
      '      AND CP.FLGINTERNO = '#39'MA'#39
      '      AND H.MESCOBRANCA >= :PINICIO'
      '      AND H.MESCOBRANCA <= :PFINAL'
      '      AND CP.IDPLANOPREV    = H.IDPLANOPREV'
      '      AND CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO'
      '      AND EL.IDPESSJUR = H.IDPESSJUR'
      '      AND EL.IDPESSOA = H.IDPESSOA'
      '      AND P.IDPESSOA = EL.IDPESSOA'
      '      GROUP BY'
      '          P.IDPESSOA,'
      '          EL.MATRICULA,'
      '          P.NOME'
      '      UNION'
      '      SELECT'
      '          3 AS CODTIPO,'
      '          P.IDPESSOA,'
      '          '#39'ALTERADOR'#39' AS TIPO,'
      '          EL.MATRICULA,'
      '          P.NOME,'
      '          TA.CODALTERADOR,'
      '          TA.DESCRICAO AS NOMEALTERADOR,'
      
        '          SUM(DECODE(NVL(H.FLGDEVOLUCAO,0),0,HA.VALOR,-HA.VALOR)' +
        ') AS VALORPAGO'
      '      FROM'
      '          PESSOA P,'
      '          ELEGPATRO EL,'
      '          HSTCONTRIBPREV H,'
      '          HSTATRASOCONTRIB HA,'
      '          CONTPREV CP,'
      '          TIPOALTERADOR TA'
      '      WHERE'
      '          CP.FLGINTERNO = '#39'MA'#39
      '      AND (:IDPESSOA IS NULL OR P.IDPESSOA = :IDPESSOA)'
      '      AND H.MESCOBRANCA >= :PINICIO'
      '      AND H.MESCOBRANCA <= :PFINAL'
      '      AND CP.IDPLANOPREV    = H.IDPLANOPREV'
      '      AND CP.IDCONTRIBUICAO = H.IDCONTRIBUICAO'
      '      AND EL.IDPESSJUR = H.IDPESSJUR'
      '      AND EL.IDPESSOA = H.IDPESSOA'
      '      AND P.IDPESSOA = EL.IDPESSOA'
      '      AND HA.NUMRECEBIMENTO = H.NUMRECEBIMENTO'
      '      AND HA.MESCOBRANCA = H.MESCOBRANCA'
      '      AND HA.MESREFERENCIA = H.MESREFERENCIA'
      '      AND TA.CODALTERADOR = HA.CODALTERADOR'
      '      GROUP BY'
      '          P.IDPESSOA,'
      '          EL.MATRICULA,'
      '          P.NOME,'
      '          TA.CODALTERADOR,'
      '          TA.DESCRICAO'
      '    )'
      'ORDER BY'
      '   MATRICULA,'
      '   CODTIPO,'
      '   NOMEALTERADOR'
      ''
      ' '
      ' ')
    ClientDataSet = cdsValores
    Left = 304
    Top = 8
  end
  object cdsValores: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 8
  end
  object cdsDadosParticipante: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 472
    Top = 32
    object cdsDadosParticipanteNOME_PART: TStringField
      FieldName = 'NOME_PART'
      Size = 60
    end
    object cdsDadosParticipanteMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object cdsDadosParticipanteCPF: TStringField
      FieldName = 'CPF'
      FixedChar = True
      Size = 18
    end
    object cdsDadosParticipantePATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object cdsDadosParticipanteCGC: TStringField
      FieldName = 'CGC'
      FixedChar = True
      Size = 18
    end
  end
  object sqlDadosParticipante: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '    PES.NOME AS NOME_PART,'
      '    DEP.MATRICULA,'
      '    CPF.NUMDOCUMENTO AS CPF,'
      '    PAT.NOME AS PATRO,'
      '    CGC.NUMDOCUMENTO AS CGC'
      'FROM'
      '    PESSOA PES,'
      '    PESSOA PAT,'
      '    DOCPESSOA CPF,'
      '    DOCPESSOA CGC,'
      '    DEPENTIT DEP'
      'WHERE'
      '    (:IDPESSOA IS NULL OR DEP.IDPESSOA    = :IDPESSOA)'
      'AND PAT.IDPESSOA    = :IDPATRO'
      'AND CPF.IDDOCUMENTO = 2'
      'AND CGC.IDDOCUMENTO = 1'
      'AND PES.IDPESSOA    = DEP.IDPESSOA'
      'AND PES.IDPESSOA    = CPF.IDPESSOA(+)'
      'AND CGC.IDPESSOA    = PAT.IDPESSOA'
      ''
      ''
      ' '
      ' '
      ' ')
    ClientDataSet = cdsDadosParticipante
    Left = 472
    Top = 8
  end
  object Save: TSaveDialog
    Left = 48
    Top = 112
  end
  object sqlEndereco: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '    TRIM(LOGRADOURO) || '#39' '#39' || NUMERO || '#39' '#39' || COMPLEMENTO AS E' +
        'NDERECO,'
      '    CIDADE,'
      '    TRIM(CODESTADO) AS UF,'
      '    CEP'
      'FROM'
      '    PESSOA PES,'
      '    ELEGPATRO ELP,'
      '    ENDPESS END'
      'WHERE'
      '    ELP.MATRICULA        = :MATRICULA'
      'AND PES.IDPESSOA         = ELP.IDPESSOA'
      'AND PES.IDENDRESIDENCIAL = END.IDENDERECO(+)'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = cdsEndereco
    Left = 224
    Top = 65528
  end
  object cdsEndereco: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 264
  end
end
