inherited frmMovDesfazerConfissao: TfrmMovDesfazerConfissao
  Left = 340
  Top = 140
  HelpContext = 1350012
  Caption = 'Desfaz Confissão de Dívida'
  ClientHeight = 428
  ClientWidth = 567
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 567
    Height = 389
    object grbContrato: TGroupBox
      Left = 6
      Top = 5
      Width = 547
      Height = 236
      Caption = 'Confissão Dívida'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label5: TLabel
        Left = 16
        Top = 58
        Width = 54
        Height = 13
        Caption = 'Locatário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 16
        Top = 95
        Width = 84
        Height = 13
        Caption = 'Administradora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 16
        Top = 131
        Width = 78
        Height = 13
        Caption = 'Responsável '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 16
        Top = 19
        Width = 49
        Height = 13
        Caption = 'Contrato'
      end
      object edtLocatario: TEdit
        Left = 16
        Top = 72
        Width = 465
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object edtResponsavel: TEdit
        Left = 16
        Top = 145
        Width = 465
        Height = 21
        Enabled = False
        TabOrder = 1
      end
      object edtAdministradora: TEdit
        Left = 16
        Top = 109
        Width = 465
        Height = 21
        Enabled = False
        TabOrder = 2
      end
      object edtConNumero: TEdit
        Left = 16
        Top = 33
        Width = 129
        Height = 21
        Enabled = False
        TabOrder = 3
      end
      object edtConNome: TEdit
        Left = 144
        Top = 33
        Width = 337
        Height = 21
        Enabled = False
        TabOrder = 4
      end
      object btnContrato: TBitBtn
        Left = 489
        Top = 31
        Width = 24
        Height = 22
        Hint = 'Busca um Contrato'
        TabOrder = 5
        OnClick = btnContratoClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        NumGlyphs = 2
      end
      object btnLimpar: TBitBtn
        Left = 513
        Top = 31
        Width = 24
        Height = 22
        Hint = 'Limpa a seleção de Contrato'
        TabOrder = 6
        OnClick = btnLimparClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888FF8888888888888008888888888888F77F8888888888800F08888
          8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
          88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
          888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
          0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
          03088878F88878F878788887F8888090B03088878F888787878788887888880B
          0B038888788888787878888888888880B0B38888888888878788888888888888
          0BBB88888888888878F888888888888880BB8888888888888788}
        NumGlyphs = 2
      end
      object GroupBox4: TGroupBox
        Left = 15
        Top = 170
        Width = 137
        Height = 58
        Caption = ' Data da Confissão '
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        object edtDataConfissao: TCMDateTimePicker
          Left = 21
          Top = 26
          Width = 105
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          Epoch = 1950
          ButtonGlyph.Data = {
            06050000424D06050000000000003604000028000000100000000D0000000100
            080000000000D000000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A6000020400000206000002080000020A0000020C0000020E000004000000040
            20000040400000406000004080000040A0000040C0000040E000006000000060
            20000060400000606000006080000060A0000060C0000060E000008000000080
            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
            20004000400040006000400080004000A0004000C0004000E000402000004020
            20004020400040206000402080004020A0004020C0004020E000404000004040
            20004040400040406000404080004040A0004040C0004040E000406000004060
            20004060400040606000406080004060A0004060C0004060E000408000004080
            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
            20008000400080006000800080008000A0008000C0008000E000802000008020
            20008020400080206000802080008020A0008020C0008020E000804000008040
            20008040400080406000804080008040A0008040C0008040E000806000008060
            20008060400080606000806080008060A0008060C0008060E000808000008080
            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
            000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
            A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
            A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
            A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
            FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
            04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
            000000000000000000FF}
          ShowButton = True
          TabOrder = 0
        end
      end
    end
    object Panel1: TPanel
      Left = 8
      Top = 244
      Width = 547
      Height = 27
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'Parcelas'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      TabStop = True
    end
    object wwDBGrid1: TwwDBGrid
      Left = 8
      Top = 274
      Width = 545
      Height = 110
      Selected.Strings = (
        'CODDOCUMENTO'#9'12'#9'Código Documento'
        'DATAVENCIMENTO'#9'18'#9'Data Vencimento'
        'VALOR'#9'20'#9'Valor')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsContrato
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 2
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 389
    Width = 567
    inherited tb97Fundo: TToolbar97
      Left = 392
      DockPos = 392
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep971: TToolbarSep97
        Left = 191
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 17
        Enabled = False
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Left = 17
        Width = 174
        Caption = '&Desfazer '
        Enabled = False
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 347
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object qryContrato: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' PL.NOME AS LOCATARIO, '
      ' PR.NOME AS RESPONSAVEL, '
      ' PA.NOME AS ADMINISTRADORA,'
      ' C.IDCONTRATOIMOVEL,'
      ' C.CONNUMERO,'
      ' C.CONNOME,'
      ' CD.IDCONFISSAODIVIDA,CD.PLNCODIGO_OPER,'
      ' CN.CODDOCUMENTO,'
      ' CD.DATACONFISSAO,'
      ' LC.DATAVENCIMENTO, '
      ' SUM(LC.VLRLANCOMRECEB) AS VALOR'
      'FROM PESSOA PR,       '
      '     PESSOA PL,    '
      '     PESSOA PA,    '
      '     CONTRATOIMOVEL C,'
      '     CONFISSAODIVIDA CD,'
      '     CONFISSAOXDOCUMENTO CN ,'
      '     LANCAMENTOSIMOVEL LC'
      'WHERE (C.IDRESPONSAVEL = PR.IDPESSOA(+))'
      ' AND  (C.IDLOCATARIO = PL.IDPESSOA(+))'
      ' AND  (C.IDADMINIMOVEL = PA.IDPESSOA(+))'
      ' AND  (C.IDCONTRATOIMOVEL = CD.IDCONTRATOIMOVEL)'
      ' AND  (CD.IDCONFISSAODIVIDA = CN.IDCONFISSAODIVIDA) '
      ' AND  (C.FLGSTATUS = '#39'V'#39')'
      ' AND  (CN.TIPO = 1 )'
      ' AND  (C.IDCONTRATOIMOVEL   = :PIDCONTRATOIMOVEL)'
      ' AND  (CD.IDCONFISSAODIVIDA = :PIDCONFISSAODIVIDA)'
      ' AND  (CN.CODDOCUMENTO = LC.NODOCUMENTO)'
      'GROUP BY PL.NOME , PR.NOME , PA.NOME , C.IDCONTRATOIMOVEL,'
      
        ' C.CONDATAASSINATURA, C.CONNUMERO, C.CONNOME, C.IDCONTRATOIMOVEL' +
        ','
      
        ' CD.IDCONFISSAODIVIDA,CD.PLNCODIGO_OPER, CN.CODDOCUMENTO,CD.DATA' +
        'CONFISSAO, LC.DATAVENCIMENTO'
      'ORDER BY LC.DATAVENCIMENTO'
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 36
    Top = 287
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDCONFISSAODIVIDA'
        ParamType = ptUnknown
      end>
    object qryContratoCODDOCUMENTO: TFloatField
      DisplayLabel = 'Código Documento'
      DisplayWidth = 12
      FieldName = 'CODDOCUMENTO'
    end
    object qryContratoDATAVENCIMENTO: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      DisplayWidth = 18
      FieldName = 'DATAVENCIMENTO'
    end
    object qryContratoVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 20
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
    end
    object qryContratoLOCATARIO: TStringField
      DisplayWidth = 60
      FieldName = 'LOCATARIO'
      Visible = False
      Size = 60
    end
    object qryContratoRESPONSAVEL: TStringField
      DisplayWidth = 60
      FieldName = 'RESPONSAVEL'
      Visible = False
      Size = 60
    end
    object qryContratoADMINISTRADORA: TStringField
      DisplayWidth = 60
      FieldName = 'ADMINISTRADORA'
      Visible = False
      Size = 60
    end
    object qryContratoIDCONTRATOIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOIMOVEL'
      Visible = False
    end
    object qryContratoCONNUMERO: TStringField
      DisplayWidth = 20
      FieldName = 'CONNUMERO'
      Visible = False
    end
    object qryContratoCONNOME: TStringField
      DisplayWidth = 100
      FieldName = 'CONNOME'
      Visible = False
      Size = 100
    end
    object qryContratoIDCONFISSAODIVIDA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONFISSAODIVIDA'
      Visible = False
    end
    object qryContratoDATACONFISSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATACONFISSAO'
      Visible = False
    end
    object qryContratoPLNCODIGO_OPER: TFloatField
      DisplayWidth = 10
      FieldName = 'PLNCODIGO_OPER'
      Visible = False
    end
  end
  object MS_ConfissaoAdmin: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CONTRATOIMOVEL.CONNUMERO'
      'CONTRATOIMOVEL.CONNOME'
      'PESSOA.RAZAOSOCIAL'
      'CONFISSAODIVIDA.DATACONFISSAO'
      'CONFISSAODIVIDA.VLRSALDO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'D'
      'N')
    Descricao.Strings = (
      'Nr. do contrato'
      'Nome do Contrato'
      'Nome do Locatário'
      'Data da Confissão'
      'Valor do Saldo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTRATOIMOVEL'
      'PESSOA'
      'CONFISSAODIVIDA')
    CamposChave.Strings = (
      'CONTRATOIMOVEL.IDCONTRATOIMOVEL'
      'CONFISSAODIVIDA.IDCONFISSAODIVIDA')
    Filtro.Strings = (
      
        'CONFISSAODIVIDA.IDCONTRATOIMOVEL = CONTRATOIMOVEL.IDCONTRATOIMOV' +
        'EL'
      'PESSOA.IDPESSOA = CONTRATOIMOVEL.IDLOCATARIO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '50'
      '50'
      '15'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      '')
    Left = 336
    Top = 11
  end
  object dsContrato: TDataSource
    DataSet = qryContrato
    Left = 95
    Top = 287
  end
  object qryVerificaDocumento: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODDOCUMENTO, PLNCODIGO,DATALANCTO,VALOR,OPERACAO'
      'FROM LANCTODOCUM'
      'WHERE CODDOCUMENTO = :pCODDOCUMENTO AND'
      '      OPERACAO = 5')
    ValidateWithMask = True
    Left = 180
    Top = 287
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qryVerificaDocumentoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.LANCTODOCUM.CODDOCUMENTO'
    end
    object qryVerificaDocumentoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.LANCTODOCUM.PLNCODIGO'
    end
    object qryVerificaDocumentoDATALANCTO: TDateTimeField
      FieldName = 'DATALANCTO'
      Origin = 'BASEDADOS.LANCTODOCUM.DATALANCTO'
    end
    object qryVerificaDocumentoVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'BASEDADOS.LANCTODOCUM.VALOR'
    end
    object qryVerificaDocumentoOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Origin = 'BASEDADOS.LANCTODOCUM.OPERACAO'
      FixedChar = True
      Size = 2
    end
  end
  object qryVerificaBaixa: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  LC.CODDOCUMENTO,'
      '  LC.PLNCODIGO,'
      '  LC.NUMLANCTO,'
      '  LC.DATALANCTO,'
      '  LC.VALOR,'
      '  LC.HISTORICOCOMPL'
      'FROM   '
      '     CONTRATOIMOVEL C,'
      '     CONFISSAODIVIDA CD,'
      '     CONFISSAOXDOCUMENTO CN ,'
      '     LANCTODOCUM LC'
      'WHERE'
      '      (C.IDCONTRATOIMOVEL = CD.IDCONTRATOIMOVEL)'
      ' AND  (CD.IDCONFISSAODIVIDA = CN.IDCONFISSAODIVIDA) '
      ' AND  (C.FLGSTATUS = '#39'V'#39')'
      ' AND  (CN.TIPO = 0 )'
      ' AND  (C.IDCONTRATOIMOVEL = :pIDCONTRATOIMOVEL)'
      ' AND  (CD.IDCONFISSAODIVIDA = :pIDCONFISSAODIVIDA)'
      ' AND  (CN.CODDOCUMENTO = LC.CODDOCUMENTO)'
      
        ' AND  (LC.HISTORICOCOMPL = '#39'Contra Baixa Alterador - Confissão D' +
        'ívida.'#39')'
      'ORDER BY LC.DATALANCTO')
    ValidateWithMask = True
    Left = 277
    Top = 285
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDCONFISSAODIVIDA'
        ParamType = ptUnknown
      end>
    object qryVerificaBaixaCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.LANCTODOCUM.CODDOCUMENTO'
    end
    object qryVerificaBaixaPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.LANCTODOCUM.PLNCODIGO'
    end
    object qryVerificaBaixaNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
      Origin = 'BASEDADOS.LANCTODOCUM.NUMLANCTO'
    end
    object qryVerificaBaixaDATALANCTO: TDateTimeField
      FieldName = 'DATALANCTO'
      Origin = 'BASEDADOS.LANCTODOCUM.DATALANCTO'
    end
    object qryVerificaBaixaVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'BASEDADOS.LANCTODOCUM.VALOR'
    end
    object qryVerificaBaixaHISTORICOCOMPL: TStringField
      FieldName = 'HISTORICOCOMPL'
      Origin = 'BASEDADOS.LANCTODOCUM.HISTORICOCOMPL'
      Size = 100
    end
  end
  object qryVerificaIntegracao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  *'
      'FROM'
      '     LANCTODOCUM LC'
      'WHERE'
      '     (LC.CODDOCUMENTO = :pCODDOCUMENTO)'
      ' ')
    ValidateWithMask = True
    Left = 374
    Top = 284
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qryVerificaIntegracaoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.LANCTODOCUM.CODDOCUMENTO'
    end
    object qryVerificaIntegracaoNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
      Origin = 'BASEDADOS.LANCTODOCUM.NUMLANCTO'
    end
    object qryVerificaIntegracaoCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
      Origin = 'BASEDADOS.LANCTODOCUM.CODALTERADOR'
    end
    object qryVerificaIntegracaoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.LANCTODOCUM.PLNCODIGO'
    end
    object qryVerificaIntegracaoDATALANCTO: TDateTimeField
      FieldName = 'DATALANCTO'
      Origin = 'BASEDADOS.LANCTODOCUM.DATALANCTO'
    end
    object qryVerificaIntegracaoVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'BASEDADOS.LANCTODOCUM.VALOR'
    end
    object qryVerificaIntegracaoVALOROUTRAMOEDA: TFloatField
      FieldName = 'VALOROUTRAMOEDA'
      Origin = 'BASEDADOS.LANCTODOCUM.VALOROUTRAMOEDA'
    end
    object qryVerificaIntegracaoDEBCRE: TStringField
      FieldName = 'DEBCRE'
      Origin = 'BASEDADOS.LANCTODOCUM.DEBCRE'
      FixedChar = True
      Size = 1
    end
    object qryVerificaIntegracaoOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Origin = 'BASEDADOS.LANCTODOCUM.OPERACAO'
      FixedChar = True
      Size = 2
    end
    object qryVerificaIntegracaoHISTORICOCOMPL: TStringField
      FieldName = 'HISTORICOCOMPL'
      Origin = 'BASEDADOS.LANCTODOCUM.HISTORICOCOMPL'
      Size = 100
    end
    object qryVerificaIntegracaoIDUSUARIOINCLUSAO: TFloatField
      FieldName = 'IDUSUARIOINCLUSAO'
      Origin = 'BASEDADOS.LANCTODOCUM.IDUSUARIOINCLUSAO'
    end
    object qryVerificaIntegracaoESTORNO: TFloatField
      FieldName = 'ESTORNO'
      Origin = 'BASEDADOS.LANCTODOCUM.ESTORNO'
    end
    object qryVerificaIntegracaoLOTETRANSMISSAO: TFloatField
      FieldName = 'LOTETRANSMISSAO'
      Origin = 'BASEDADOS.LANCTODOCUM.LOTETRANSMISSAO'
    end
    object qryVerificaIntegracaoCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = 'BASEDADOS.LANCTODOCUM.CODTIPDOC'
    end
    object qryVerificaIntegracaoVLRLIQUIDO: TFloatField
      FieldName = 'VLRLIQUIDO'
      Origin = 'BASEDADOS.LANCTODOCUM.VLRLIQUIDO'
    end
    object qryVerificaIntegracaoNUMFATURA: TStringField
      FieldName = 'NUMFATURA'
      Origin = 'BASEDADOS.LANCTODOCUM.NUMFATURA'
      Size = 60
    end
    object qryVerificaIntegracaoFLGTIPOFATURA: TStringField
      FieldName = 'FLGTIPOFATURA'
      Origin = 'BASEDADOS.LANCTODOCUM.FLGTIPOFATURA'
      FixedChar = True
      Size = 3
    end
    object qryVerificaIntegracaoFLGFATEMITIDA: TStringField
      FieldName = 'FLGFATEMITIDA'
      Origin = 'BASEDADOS.LANCTODOCUM.FLGFATEMITIDA'
      FixedChar = True
      Size = 1
    end
    object qryVerificaIntegracaoNUMRECIBO: TStringField
      FieldName = 'NUMRECIBO'
      Origin = 'BASEDADOS.LANCTODOCUM.NUMRECIBO'
      Size = 60
    end
    object qryVerificaIntegracaoIDNFLIVRO: TFloatField
      FieldName = 'IDNFLIVRO'
      Origin = 'BASEDADOS.LANCTODOCUM.IDNFLIVRO'
    end
    object qryVerificaIntegracaoUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'BASEDADOS.LANCTODOCUM.UNIDNEGOC'
    end
    object qryVerificaIntegracaoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.LANCTODOCUM.IDPESSOA'
    end
    object qryVerificaIntegracaoNUMLOTEMANUAL: TFloatField
      FieldName = 'NUMLOTEMANUAL'
      Origin = 'BASEDADOS.LANCTODOCUM.NUMLOTEMANUAL'
    end
    object qryVerificaIntegracaoCODDOCINSS: TFloatField
      FieldName = 'CODDOCINSS'
      Origin = 'BASEDADOS.LANCTODOCUM.CODDOCINSS'
    end
    object qryVerificaIntegracaoNUMNF: TStringField
      FieldName = 'NUMNF'
      Origin = 'BASEDADOS.LANCTODOCUM.NUMNF'
    end
    object qryVerificaIntegracaoFLGRECEBEUNF: TStringField
      FieldName = 'FLGRECEBEUNF'
      Origin = 'BASEDADOS.LANCTODOCUM.FLGRECEBEUNF'
      FixedChar = True
      Size = 1
    end
    object qryVerificaIntegracaoIDAPURACAOPIS: TFloatField
      FieldName = 'IDAPURACAOPIS'
      Origin = 'BASEDADOS.LANCTODOCUM.IDAPURACAOPIS'
    end
    object qryVerificaIntegracaoIDMOTIVOCANCFAT: TFloatField
      FieldName = 'IDMOTIVOCANCFAT'
      Origin = 'BASEDADOS.LANCTODOCUM.IDMOTIVOCANCFAT'
    end
    object qryVerificaIntegracaoFLGLANCBAIXAADTO: TStringField
      FieldName = 'FLGLANCBAIXAADTO'
      Origin = 'BASEDADOS.LANCTODOCUM.FLGLANCBAIXAADTO'
      FixedChar = True
      Size = 1
    end
    object qryVerificaIntegracaoFLGLANCBAIXA: TStringField
      FieldName = 'FLGLANCBAIXA'
      Origin = 'BASEDADOS.LANCTODOCUM.FLGLANCBAIXA'
      FixedChar = True
      Size = 1
    end
    object qryVerificaIntegracaoFLGCONTABILIZA: TStringField
      FieldName = 'FLGCONTABILIZA'
      Origin = 'BASEDADOS.LANCTODOCUM.FLGCONTABILIZA'
      FixedChar = True
      Size = 1
    end
    object qryVerificaIntegracaoIDLOTEEXPORTACTB: TFloatField
      FieldName = 'IDLOTEEXPORTACTB'
      Origin = 'BASEDADOS.LANCTODOCUM.IDLOTEEXPORTACTB'
    end
    object qryVerificaIntegracaoPLNANTECIPA: TFloatField
      FieldName = 'PLNANTECIPA'
      Origin = 'BASEDADOS.LANCTODOCUM.PLNANTECIPA'
    end
    object qryVerificaIntegracaoIDENVIODOCUMENTO: TFloatField
      FieldName = 'IDENVIODOCUMENTO'
      Origin = 'BASEDADOS.LANCTODOCUM.IDENVIODOCUMENTO'
    end
  end
  object qryVerificaContabil: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  LC.CODDOCUMENTO,'
      '  LC.PLNCODIGO,'
      '  LC.DATALANCTO,'
      '  CN.TIPO'
      'FROM   '
      '     CONTRATOIMOVEL C,'
      '     CONFISSAODIVIDA CD,'
      '     CONFISSAOXDOCUMENTO CN ,'
      '     LANCTODOCUM LC'
      'WHERE'
      '      (C.IDCONTRATOIMOVEL = CD.IDCONTRATOIMOVEL)'
      ' AND  (CD.IDCONFISSAODIVIDA = CN.IDCONFISSAODIVIDA) '
      ' AND  (C.FLGSTATUS = '#39'V'#39')'
      ' AND  (CN.TIPO = 0 )'
      ' AND  (C.IDCONTRATOIMOVEL = :PIDCONTRATOIMOVEL)'
      ' AND  (CD.IDCONFISSAODIVIDA = :PIDCONFISSAODIVIDA)'
      ' AND  (CN.CODDOCUMENTO = LC.CODDOCUMENTO)'
      
        ' AND  (LC.HISTORICOCOMPL = '#39'Contra Baixa Alterador - Confissão D' +
        'ívida.'#39')'
      'UNION'
      'SELECT'
      '  LC.CODDOCUMENTO,'
      '  LC.PLNCODIGO,'
      '  LC.DATALANCTO,'
      '  CN.TIPO'
      'FROM   '
      '     CONTRATOIMOVEL C,'
      '     CONFISSAODIVIDA CD,'
      '     CONFISSAOXDOCUMENTO CN ,'
      '     LANCTODOCUM LC'
      'WHERE'
      '      (C.IDCONTRATOIMOVEL = CD.IDCONTRATOIMOVEL)'
      ' AND  (CD.IDCONFISSAODIVIDA = CN.IDCONFISSAODIVIDA) '
      ' AND  (C.FLGSTATUS = '#39'V'#39')'
      ' AND  (CN.TIPO = 1 )'
      ' AND  (C.IDCONTRATOIMOVEL = :PIDCONTRATOIMOVEL)'
      ' AND  (CD.IDCONFISSAODIVIDA = :PIDCONFISSAODIVIDA)'
      ' AND  (CN.CODDOCUMENTO = LC.CODDOCUMENTO)'
      'UNION'
      'SELECT '
      '  (0) AS CODDOCUMENTO,'
      '  PL.PLNCODIGO,'
      '  PL.PLNDATDIA  AS DATALANCTO,'
      '  (0) AS TIPO'
      'FROM  PLANILHA PL'
      'WHERE PL.PLNCODIGO = :PPLNCODIGO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 477
    Top = 283
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDCONFISSAODIVIDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDCONFISSAODIVIDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PPLNCODIGO'
        ParamType = ptUnknown
      end>
    object qryVerificaContabilCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryVerificaContabilPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryVerificaContabilDATALANCTO: TDateTimeField
      FieldName = 'DATALANCTO'
    end
    object qryVerificaContabilTIPO: TFloatField
      FieldName = 'TIPO'
    end
  end
  object qryVerificaIntegBaixa: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  *'
      'FROM'
      '     LANCTODOCUM LC'
      'WHERE'
      '     (LC.CODDOCUMENTO = :pCODDOCUMENTO) and'
      
        '     (LC.historicocompl = '#39'Contra Baixa Alterador - Confissão Dí' +
        'vida.'#39' ) '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 382
    Top = 340
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qryVerificaIntegBaixaCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.LANCTODOCUM.CODDOCUMENTO'
    end
    object qryVerificaIntegBaixaNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
      Origin = 'BASEDADOS.LANCTODOCUM.NUMLANCTO'
    end
    object qryVerificaIntegBaixaPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.LANCTODOCUM.PLNCODIGO'
    end
    object qryVerificaIntegBaixaDATALANCTO: TDateTimeField
      FieldName = 'DATALANCTO'
      Origin = 'BASEDADOS.LANCTODOCUM.DATALANCTO'
    end
    object qryVerificaIntegBaixaVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'BASEDADOS.LANCTODOCUM.VALOR'
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 381
    Top = 7
  end
end
