inherited frmCadWebReports: TfrmCadWebReports
  Left = 337
  Top = 219
  HelpContext = 4650006
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Relatórios'
  ClientHeight = 271
  ClientWidth = 538
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 538
    Height = 232
    object lblRelatorio: TLabel
      Left = 16
      Top = 16
      Width = 56
      Height = 13
      Caption = 'Relatório:'
    end
    object lblInterface: TLabel
      Left = 12
      Top = 51
      Width = 60
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Interface:'
    end
    object cmbRelatorio: TComboBox
      Left = 78
      Top = 13
      Width = 443
      Height = 21
      Style = csDropDownList
      Enabled = False
      ItemHeight = 13
      TabOrder = 0
      Visible = False
      Items.Strings = (
        'Contra-Cheque'
        'Informe de Rendimentos'
        'Inscrição em Empréstimo'
        'Contrato de Empréstimo')
    end
    object rgFlgReportType: TRadioGroup
      Left = 78
      Top = 80
      Width = 443
      Height = 49
      Caption = 'Tipo do Relatório'
      Columns = 2
      Items.Strings = (
        'HTML'
        'Gerador de Relatórios')
      TabOrder = 1
      OnClick = rgFlgReportTypeClick
    end
    object PageControl: TPageControl
      Left = 79
      Top = 144
      Width = 442
      Height = 81
      ActivePage = tbsHTML
      TabOrder = 2
      TabPosition = tpBottom
      object tbsHTML: TTabSheet
        Caption = 'HTML'
        object lblHTMLFile: TLabel
          Left = 2
          Top = 40
          Width = 86
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Arquivo HTML:'
        end
        object btnHTMLFile: TSpeedButton
          Left = 405
          Top = 36
          Width = 23
          Height = 21
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555555555555555555555555555555555555555555555555555555555555
            555555555555555555555555555555555555555FFFFFFFFFF555550000000000
            55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
            B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
            000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
            555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
            55555575FFF75555555555700007555555555557777555555555555555555555
            5555555555555555555555555555555555555555555555555555}
          NumGlyphs = 2
          OnClick = btnHTMLFileClick
        end
        object lblDataView: TLabel
          Left = 3
          Top = 8
          Width = 85
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'DataView:'
        end
        object btnDataView: TSpeedButton
          Left = 405
          Top = 3
          Width = 23
          Height = 22
          Glyph.Data = {
            0E030000424D0E030000000000003600000028000000110000000E0000000100
            180000000000D8020000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF000000636363212121000000000000
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000636363212121000000000000FFFF
            FF00FFFFFF000000C6C6C6424242000000000000FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF000000C6C6C6424242000000000000FFFFFF00FFFFFF00000063636321
            2121000000000000000000000000FFFFFF000000000000000000636363212121
            000000000000FFFFFF00FFFFFF00000063636300000000000000000000000000
            0000FFFFFF000000313131313131000000000000000000000000FFFFFF00FFFF
            FF000000C6C6C642424200000000000000000031313100000000000063636363
            6363424242000000000000000000FFFFFF00FFFFFF000000C6C6C64242420000
            0000000000000063636300000000000063636363636342424200000000000000
            0000FFFFFF00FFFFFF0000006363634242420000000000000000003131310000
            00000000313131313131424242000000000000000000FFFFFF00FFFFFFFFFFFF
            0000002121210000000000000000000000000000000000000000000000002121
            21000000000000000000FFFFFF00FFFFFFFFFFFFFFFFFF000000636363525252
            000000000000FFFFFF000000636363525252000000000000FFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFF000000
            000000000000000000000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFF424242424242000000000000FFFFFFFFFFFF424242424242000000000000
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF21212121212100000000
            0000FFFFFFFFFFFF212121212121000000000000FFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
          OnClick = btnDataViewClick
        end
        object edtHTMLFile: TEdit
          Left = 91
          Top = 36
          Width = 314
          Height = 21
          TabOrder = 1
        end
        object edtDataView: TEdit
          Left = 92
          Top = 4
          Width = 313
          Height = 21
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
        end
      end
      object tbsReportGenerator: TTabSheet
        Caption = 'Gerador de Relatórios'
        ImageIndex = 1
        object lblReport: TLabel
          Left = 3
          Top = 8
          Width = 85
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Template:'
        end
        object btnReport: TSpeedButton
          Left = 405
          Top = 3
          Width = 23
          Height = 22
          Glyph.Data = {
            0E030000424D0E030000000000003600000028000000110000000E0000000100
            180000000000D8020000C40E0000C40E00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF000000636363212121000000000000
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000636363212121000000000000FFFF
            FF00FFFFFF000000C6C6C6424242000000000000FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF000000C6C6C6424242000000000000FFFFFF00FFFFFF00000063636321
            2121000000000000000000000000FFFFFF000000000000000000636363212121
            000000000000FFFFFF00FFFFFF00000063636300000000000000000000000000
            0000FFFFFF000000313131313131000000000000000000000000FFFFFF00FFFF
            FF000000C6C6C642424200000000000000000031313100000000000063636363
            6363424242000000000000000000FFFFFF00FFFFFF000000C6C6C64242420000
            0000000000000063636300000000000063636363636342424200000000000000
            0000FFFFFF00FFFFFF0000006363634242420000000000000000003131310000
            00000000313131313131424242000000000000000000FFFFFF00FFFFFFFFFFFF
            0000002121210000000000000000000000000000000000000000000000002121
            21000000000000000000FFFFFF00FFFFFFFFFFFFFFFFFF000000636363525252
            000000000000FFFFFF000000636363525252000000000000FFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFF000000
            000000000000000000000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFF424242424242000000000000FFFFFFFFFFFF424242424242000000000000
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF21212121212100000000
            0000FFFFFFFFFFFF212121212121000000000000FFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
          OnClick = btnReportClick
        end
        object edtReport: TEdit
          Left = 92
          Top = 4
          Width = 313
          Height = 21
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
    object dblkpInterface: TDBLookupComboBox
      Left = 78
      Top = 48
      Width = 443
      Height = 21
      KeyField = 'IDWEBINTERFACE'
      ListField = 'NOMEINTERFACE'
      ListSource = dtsInterface
      TabOrder = 3
      OnClick = dblkpInterfaceClick
    end
  end
  inherited Dock971: TDock97
    Top = 232
    Width = 538
    inherited tb97Fundo: TToolbar97
      Left = 366
      DockPos = 375
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 197
      DockPos = 206
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  object dblkpWebTpReports: TDBLookupComboBox [2]
    Left = 78
    Top = 13
    Width = 443
    Height = 21
    KeyField = 'IDWEBREPORTS'
    ListField = 'DESCRICAO'
    ListSource = dsWebTpReports
    TabOrder = 2
    OnClick = dblkpWebTpReportsClick
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 339
    Top = 3
  end
  object dlgHTMLFile: TOpenDialog
    DefaultExt = '*.htm; *.html'
    Filter = 
      'Arquivos HTML|*.htm; *.html|Arquivos Texto|*.txt|Todos os arquiv' +
      'os|*.*'
    Left = 480
    Top = 64
  end
  object msDataView: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'DATAVIEW.NAME'
      'DATAVIEW.IDDATAVIEW'
      'DATAVIEW.ORIGEMCMDV')
    TipodeDado.Strings = (
      'C'
      'N'
      'N')
    Descricao.Strings = (
      'Nome do DataView'
      'Id. DataView'
      'Origem CM')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'DATAVIEW')
    CamposChave.Strings = (
      'DATAVIEW.NAME'
      'DATAVIEW.IDDATAVIEW'
      'DATAVIEW.ORIGEMCMDV')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '10'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 16
    Top = 88
  end
  object msReport: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'REPORTS.NAME'
      'REPORTS.IDREPORTS'
      'REPORTS.ORIGEMCM')
    TipodeDado.Strings = (
      'C'
      'N'
      'N')
    Descricao.Strings = (
      'Nome do Relatório'
      'Id. Reports'
      'Origem CM')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'REPORTS')
    CamposChave.Strings = (
      'REPORTS.NAME'
      'REPORTS.IDREPORTS'
      'REPORTS.ORIGEMCM')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '100'
      '10'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 16
    Top = 128
  end
  object cdsWebReports: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 168
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 168
  end
  object cdsInterface: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 215
    Top = 67
    object cdsInterfaceIDWEBINTERFACE: TFloatField
      FieldName = 'IDWEBINTERFACE'
    end
    object cdsInterfaceNOMEINTERFACE: TStringField
      FieldName = 'NOMEINTERFACE'
      Size = 50
    end
    object cdsInterfaceENDLOGIN: TStringField
      FieldName = 'ENDLOGIN'
      Size = 100
    end
    object cdsInterfaceEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object cdsInterfaceTIMEOUT: TFloatField
      FieldName = 'TIMEOUT'
    end
    object cdsInterfaceMENUALTURA: TFloatField
      FieldName = 'MENUALTURA'
    end
    object cdsInterfaceMENULARGURA: TFloatField
      FieldName = 'MENULARGURA'
    end
    object cdsInterfaceMENUTAMFONTE: TFloatField
      FieldName = 'MENUTAMFONTE'
    end
    object cdsInterfaceMENUPOSX: TFloatField
      FieldName = 'MENUPOSX'
    end
    object cdsInterfaceMENUPOSY: TFloatField
      FieldName = 'MENUPOSY'
    end
    object cdsInterfaceMENUDISTANCIA: TFloatField
      FieldName = 'MENUDISTANCIA'
    end
    object cdsInterfaceMENUNOMEFONTE: TStringField
      FieldName = 'MENUNOMEFONTE'
      Size = 50
    end
    object cdsInterfaceMENUCORFONTE: TStringField
      FieldName = 'MENUCORFONTE'
    end
    object cdsInterfaceMENUCORFONTESEL: TStringField
      FieldName = 'MENUCORFONTESEL'
    end
    object cdsInterfaceMENUCORFUNDO: TStringField
      FieldName = 'MENUCORFUNDO'
    end
    object cdsInterfaceMENUCORFUNDOSEL: TStringField
      FieldName = 'MENUCORFUNDOSEL'
    end
    object cdsInterfaceFLGUSAMENU: TStringField
      FieldName = 'FLGUSAMENU'
      FixedChar = True
      Size = 1
    end
    object cdsInterfaceFLGUSALAYERS: TStringField
      FieldName = 'FLGUSALAYERS'
      FixedChar = True
      Size = 1
    end
    object cdsInterfaceFLGDEMO: TStringField
      FieldName = 'FLGDEMO'
      FixedChar = True
      Size = 1
    end
    object cdsInterfaceFLGJANELARELAT: TStringField
      FieldName = 'FLGJANELARELAT'
      Size = 1
    end
  end
  object dtsInterface: TDataSource
    DataSet = cdsInterface
    Left = 245
    Top = 67
  end
  object cdsWebTpReports: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 215
    Top = 19
    object cdsWebTpReportsIDWEBREPORTS: TFloatField
      FieldName = 'IDWEBREPORTS'
    end
    object cdsWebTpReportsFLGTIPO: TFloatField
      FieldName = 'FLGTIPO'
    end
    object cdsWebTpReportsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
  end
  object dsWebTpReports: TDataSource
    DataSet = cdsWebTpReports
    Left = 245
    Top = 19
  end
end
