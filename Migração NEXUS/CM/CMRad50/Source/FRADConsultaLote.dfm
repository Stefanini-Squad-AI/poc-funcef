inherited frmRADConsultaLote: TfrmRADConsultaLote
  Left = 99
  Top = 181
  Caption = 'Consulta Lote'
  ClientHeight = 439
  ClientWidth = 765
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 765
    Height = 400
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 763
      Height = 398
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 1
      TabOrder = 0
      object dbgrDocLote: TwwDBGrid
        Left = 1
        Top = 189
        Width = 761
        Height = 208
        Selected.Strings = (
          'NOME'#9'35'#9'Fornecedor'
          'HISTORICOCOMPL'#9'34'#9'Histórico'
          'NODOCUMENTO'#9'16'#9'Número do Documento'
          'COMPLDOCUMENTO'#9'5'#9'Compl.'
          'VALOR'#9'10'#9'Valor Pago'
          'SALDO'#9'10'#9'Saldo'
          'TIPODOC'#9'35'#9'Tipo de Documento'
          'DATAPROGRAMADA'#9'13'#9'Data Programada'
          'DATAVENCTO'#9'15'#9'Data de Vencimento'
          'NUMLEITCODBARRAS'#9'60'#9'Código de Barra - Leitora'
          'NUMDIGCODBARRAS'#9'60'#9'Código de Barra - Digitado'
          'NUMSLIP'#9'11'#9'SLIP'
          'NUMOP'#9'10'#9'N. OP')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsDocLote
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 0
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
      object PlnFixo: TPanel
        Left = 1
        Top = 1
        Width = 761
        Height = 188
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object Bevel1: TBevel
          Left = 8
          Top = 7
          Width = 747
          Height = 90
        end
        object Bevel2: TBevel
          Left = 6
          Top = 104
          Width = 749
          Height = 59
        end
        object Label4: TLabel
          Left = 13
          Top = 110
          Width = 68
          Height = 13
          Caption = 'Favorecido:'
        end
        object Label5: TLabel
          Left = 13
          Top = 125
          Width = 41
          Height = 13
          Caption = 'Status:'
        end
        object Label11: TLabel
          Left = 12
          Top = 141
          Width = 73
          Height = 13
          Caption = 'Observação:'
        end
        object lbldoc: TLabel
          Left = 7
          Top = 171
          Width = 185
          Height = 13
          Caption = 'Documentos que Compõe o Lote'
        end
        object DBText11: TDBText
          Left = 88
          Top = 141
          Width = 5
          Height = 13
          AutoSize = True
          DataField = 'OBSERVACAO'
          DataSource = dsLote
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText5: TDBText
          Left = 88
          Top = 125
          Width = 5
          Height = 13
          AutoSize = True
          DataField = 'FLAGCANCEL'
          DataSource = dsLote
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText4: TDBText
          Left = 86
          Top = 112
          Width = 5
          Height = 13
          AutoSize = True
          DataField = 'FAVORECIDO'
          DataSource = dsLote
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 17
          Top = 12
          Width = 95
          Height = 13
          Caption = 'Número do Lote:'
        end
        object lblPortadorForma: TLabel
          Left = 17
          Top = 28
          Width = 217
          Height = 13
          Caption = 'Bancos/Caixa / Forma de Pagamento:'
        end
        object Label2: TLabel
          Left = 17
          Top = 44
          Width = 163
          Height = 13
          Caption = 'Número do Cheque/Borderô:'
        end
        object Label6: TLabel
          Left = 333
          Top = 125
          Width = 55
          Height = 13
          Caption = 'Impresso:'
        end
        object DBText1: TDBText
          Left = 115
          Top = 12
          Width = 5
          Height = 13
          AutoSize = True
          DataField = 'NUMLOTE'
          DataSource = dsLote
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dblPortadorForma: TDBText
          Left = 237
          Top = 28
          Width = 5
          Height = 13
          AutoSize = True
          DataField = 'DESCRICAO'
          DataSource = dsLote
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText2: TDBText
          Left = 183
          Top = 44
          Width = 5
          Height = 13
          AutoSize = True
          DataField = 'NUMCHQBORDERO'
          DataSource = dsLote
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBText6: TDBText
          Left = 391
          Top = 125
          Width = 5
          Height = 13
          AutoSize = True
          DataField = 'FLAGEMISSAO'
          DataSource = dsLote
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 16
          Top = 61
          Width = 119
          Height = 13
          Caption = 'Nºdo Processo RAD:'
        end
        object Label12: TLabel
          Left = 16
          Top = 77
          Width = 96
          Height = 13
          Caption = 'Valor Total Lote:'
        end
        object DBText7: TDBText
          Left = 139
          Top = 61
          Width = 5
          Height = 13
          AutoSize = True
          DataField = 'IDPROCESSO'
          DataSource = dsLote
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LbValorTotal: TLabel
          Left = 116
          Top = 77
          Width = 26
          Height = 13
          Caption = '0,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 400
    Width = 765
    inherited tb97Fundo: TToolbar97
      Left = 421
    end
  end
  object CdsDocLote: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 248
  end
  object CdsLote: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 200
    Data = {
      620100009619E0BD01000000180000000B0000000000030000006201074E554D
      4C4F544508000400000000000C434F44504F5254464F524D4108000400000000
      000B44415441454D495353414F08000800000000000D4E554D434851424F5244
      45524F0100490000000100055749445448020002000F000A4641564F52454349
      444F0100490000000100055749445448020002003C000B464C4147454D495353
      414F01004900000001000557494454480200020003000A464C414743414E4345
      4C01004900000001000557494454480200020009000A4F42534552564143414F
      01004900000001000557494454480200020050000944455343524943414F0100
      4900000001000557494454480200020032000A494450524F434553534F080004
      0000000000054E554D4F5001004900000002000753554254595045020049000A
      0046697865644368617200055749445448020002000B000100044C4349440400
      010009080000}
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 200
  end
  object dsLote: TwwDataSource
    DataSet = CdsLote
    Left = 472
    Top = 256
  end
  object dsDocLote: TwwDataSource
    DataSet = CdsDocLote
    Left = 616
    Top = 264
  end
end
