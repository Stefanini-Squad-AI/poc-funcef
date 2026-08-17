inherited frmMovTransfPlaca: TfrmMovTransfPlaca
  Left = 68
  Top = 198
  HelpContext = 70037
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Troca da Placa de Tombamento Patrimonial'
  ClientHeight = 275
  ClientWidth = 681
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 681
    Height = 236
    object pnlMestre: TPanel
      Left = 5
      Top = 5
      Width = 671
      Height = 164
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object Data: TLabel
        Left = 16
        Top = 16
        Width = 132
        Height = 13
        Caption = 'Data da Movimentação'
      end
      object Label22: TLabel
        Left = 344
        Top = 16
        Width = 104
        Height = 13
        Caption = 'Descrição do Bem'
      end
      object Label26: TLabel
        Left = 168
        Top = 16
        Width = 127
        Height = 13
        Caption = 'Placa de Tombamento'
      end
      object Label1: TLabel
        Left = 16
        Top = 64
        Width = 51
        Height = 13
        Caption = 'Conjunto'
      end
      object Label7: TLabel
        Left = 16
        Top = 112
        Width = 69
        Height = 13
        Caption = 'Localização'
      end
      object Label17: TLabel
        Left = 344
        Top = 112
        Width = 74
        Height = 13
        Caption = 'Responsável'
      end
      object edData: TCMDateTimePicker
        Left = 16
        Top = 32
        Width = 133
        Height = 21
        Hint = 'Data Programada para Pagamento'
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
        ParentShowHint = False
        ShowHint = True
        ShowButton = True
        TabOrder = 0
        OnExit = edDataExit
      end
      object bbtnPesquisa: TBitBtn
        Left = 315
        Top = 32
        Width = 21
        Height = 21
        TabOrder = 2
        OnClick = bbtnPesquisaClick
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
      object edPlaca: TEdit
        Left = 168
        Top = 32
        Width = 147
        Height = 21
        TabOrder = 1
        OnEnter = edPlacaEnter
        OnExit = edPlacaExit
      end
      object dbeLocal: TwwDBEdit
        Left = 16
        Top = 128
        Width = 321
        Height = 21
        DataField = 'DESCLOCALIZACAO'
        DataSource = dsSelBem
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeResp: TwwDBEdit
        Left = 344
        Top = 128
        Width = 313
        Height = 21
        DataField = 'NOMERESPONSAVEL'
        DataSource = dsSelBem
        TabOrder = 6
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeDescConjunto: TwwDBEdit
        Left = 16
        Top = 80
        Width = 321
        Height = 21
        DataField = 'DESCCONJUNTO'
        DataSource = dsSelBem
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeDesBem: TDBMemo
        Left = 344
        Top = 32
        Width = 313
        Height = 70
        DataField = 'DESBEM'
        DataSource = dsSelBem
        TabOrder = 3
      end
    end
    object PnlDetalhe: TPanel
      Left = 5
      Top = 169
      Width = 671
      Height = 62
      Align = alClient
      BevelOuter = bvLowered
      Enabled = False
      TabOrder = 1
      object Label2: TLabel
        Left = 255
        Top = 8
        Width = 161
        Height = 13
        Caption = 'Nova Placa de Tombamento'
      end
      object Bevel1: TBevel
        Left = 16
        Top = 32
        Width = 234
        Height = 2
      end
      object Bevel2: TBevel
        Left = 422
        Top = 32
        Width = 231
        Height = 2
      end
      object edPlacaNova: TEdit
        Left = 256
        Top = 24
        Width = 159
        Height = 21
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 236
    Width = 681
    inherited tb97Fundo: TToolbar97
      Left = 511
      DockPos = 549
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 70037
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 344
      DockPos = 382
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 691
    Top = 491
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object dsSelBem: TwwDataSource
    AutoEdit = False
    DataSet = qrySelBem
    Left = 528
    Top = 40
  end
  object qrySelBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BEM.IDPESSOA, BEM.IDBEM, BEM.IDCONJUNTO,'
      '       BEM.PLACA, GRUPO.NOME, CONJUNTO.DESCCONJUNTO,'
      '       BEM.DESBEM, LOCALIZACAO.NOME AS DESCLOCALIZACAO,'
      
        '       PESSOA.NOME AS NOMERESPONSAVEL,CLASSEDEBEM.DESCRICAO AS D' +
        'ESCCLASSE,'
      '       BEM.DTAINCLUSAO, BEM.VALORG,BEM.DATAINICIODEP,'
      '       BEM.UNIDNEGOC,BEM.CODSUBCONTA'
      'FROM BEM, CONJUNTO, GRUPO, LOCALIZACAO, CLASSEDEBEM, PESSOA'
      'WHERE (BEM.IDPESSOA = :PIDPESSOA)'
      '  AND (BEM.IDBEM    = :PIDBEM)'
      '  AND ((BEM.BAIXATOTAL <> '#39'S'#39') OR (BEM.BAIXATOTAL IS NULL)) '
      '  AND (BEM.IDGRUPO            = GRUPO.IDGRUPO(+))'
      '  AND (BEM.IDCLASSEBEM        = CLASSEDEBEM.IDCLASSEBEM(+))'
      '  AND (BEM.IDCONJUNTO         = CONJUNTO.IDCONJUNTO)'
      '  AND (CONJUNTO.IDLOCALIZACAO = LOCALIZACAO.IDLOCALIZACAO(+))'
      '  AND (CONJUNTO.IDRESPONSAVEL = PESSOA.IDPESSOA(+))')
    ValidateWithMask = True
    Left = 472
    Top = 40
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end>
    object qrySelBemIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qrySelBemIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qrySelBemIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
    end
    object qrySelBemPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qrySelBemNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qrySelBemDESCCONJUNTO: TStringField
      FieldName = 'DESCCONJUNTO'
      Size = 200
    end
    object qrySelBemDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object qrySelBemDESCLOCALIZACAO: TStringField
      FieldName = 'DESCLOCALIZACAO'
      Size = 60
    end
    object qrySelBemNOMERESPONSAVEL: TStringField
      FieldName = 'NOMERESPONSAVEL'
      Size = 60
    end
    object qrySelBemDESCCLASSE: TStringField
      FieldName = 'DESCCLASSE'
      Size = 60
    end
    object qrySelBemDTAINCLUSAO: TDateTimeField
      FieldName = 'DTAINCLUSAO'
    end
    object qrySelBemVALORG: TFloatField
      FieldName = 'VALORG'
    end
    object qrySelBemDATAINICIODEP: TDateTimeField
      FieldName = 'DATAINICIODEP'
    end
    object qrySelBemUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object qrySelBemCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
    end
  end
  object qryPlaca: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDBEM'
      'FROM BEM'
      'WHERE (PLACA = :PPLACA)')
    ValidateWithMask = True
    Left = 408
    Top = 40
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PPLACA'
        ParamType = ptUnknown
      end>
    object qryPlacaIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = '"CM.BEM".IDBEM'
    end
  end
end
