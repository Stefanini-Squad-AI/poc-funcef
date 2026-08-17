inherited frmMostraSuspensaoConcessao: TfrmMostraSuspensaoConcessao
  Left = 295
  Top = 163
  Caption = 'Bloqueio de Concessão'
  ClientHeight = 361
  ClientWidth = 404
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 404
    Height = 328
    object dbgConsulta: TDBCtrlGrid
      Left = 0
      Top = 41
      Width = 404
      Height = 287
      Align = alClient
      AllowDelete = False
      AllowInsert = False
      ColCount = 1
      DataSource = dsSuspensaoConcessao
      PanelHeight = 287
      PanelWidth = 387
      TabOrder = 0
      RowCount = 1
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 50
        Height = 13
        Caption = 'Mutuário'
      end
      object Label4: TLabel
        Left = 16
        Top = 167
        Width = 39
        Height = 13
        Caption = 'Motivo'
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 24
        Width = 361
        Height = 21
        Color = clInactiveBorder
        DataField = 'NOME'
        DataSource = dsSuspensaoConcessao
        ReadOnly = True
        TabOrder = 0
      end
      object GroupBox1: TGroupBox
        Left = 16
        Top = 56
        Width = 361
        Height = 96
        Caption = ' Período do Bloqueio'
        TabOrder = 1
        object Label2: TLabel
          Left = 48
          Top = 16
          Width = 66
          Height = 13
          Caption = 'Data Inicial'
        end
        object Label3: TLabel
          Left = 192
          Top = 16
          Width = 59
          Height = 13
          Caption = 'Data Final'
        end
        object lblPrazoIndeterminado: TLabel
          Left = 102
          Top = 72
          Width = 151
          Height = 13
          Caption = 'PRAZO INDETERMINADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object edtDataInicio: TwwDBDateTimePicker
          Left = 48
          Top = 36
          Width = 105
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = clInactiveBorder
          ButtonStyle = cbsCustom
          DataField = 'SUCDATAINICIO'
          DataSource = dsSuspensaoConcessao
          Epoch = 1950
          ButtonWidth = 20
          ButtonGlyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            88888888888888888888800000000000000880FFFFFFFFFFFF0880F878787978
            7F0880F7878797978F0880F8787879787F0880F7878787878F0880F878787878
            7F0880F7878787878F0880FFFFFFFFFFFF0880F4C4C4C7777F0880FC4C4C4777
            7F0880FFFFFFFFFFFF0880000000000000088888888888888888}
          ShowButton = True
          TabOrder = 0
          UnboundDataType = wwDTEdtDate
          DisplayFormat = 'dd/mm/yyyy'
        end
        object wwDBDateTimePicker1: TwwDBDateTimePicker
          Left = 192
          Top = 36
          Width = 105
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = clInactiveBorder
          ButtonStyle = cbsCustom
          DataField = 'SUCDATAFINAL'
          DataSource = dsSuspensaoConcessao
          Epoch = 1950
          ButtonWidth = 20
          ButtonGlyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            88888888888888888888800000000000000880FFFFFFFFFFFF0880F878787978
            7F0880F7878797978F0880F8787879787F0880F7878787878F0880F878787878
            7F0880F7878787878F0880FFFFFFFFFFFF0880F4C4C4C7777F0880FC4C4C4777
            7F0880FFFFFFFFFFFF0880000000000000088888888888888888}
          ShowButton = True
          TabOrder = 1
          UnboundDataType = wwDTEdtDate
          DisplayFormat = 'dd/mm/yyyy'
        end
      end
      object DBMemo1: TDBMemo
        Left = 16
        Top = 185
        Width = 361
        Height = 63
        Color = clInactiveBorder
        DataField = 'SUCMOTIVOSUSP'
        DataSource = dsSuspensaoConcessao
        ReadOnly = True
        TabOrder = 2
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 404
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object lblTitulo: TfcLabel
        Left = 5
        Top = 8
        Width = 240
        Height = 24
        Caption = 'Bloqueio de Concessão'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
    end
  end
  inherited Dock971: TDock97
    Top = 328
    Width = 404
    inherited tb97Fundo: TToolbar97
      Left = 232
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      3
      (
        'TwwDBRichEdit'
        'Text'
        0)
      (
        'TDBRichEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  object dsSuspensaoConcessao: TDataSource
    DataSet = dtmLookEmptmo.qryLookSuspConc
    Left = 40
    Top = 272
  end
end
