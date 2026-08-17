inherited frmExecBuscaPadraoContratos: TfrmExecBuscaPadraoContratos
  Left = 67
  Top = 193
  ClientHeight = 376
  ClientWidth = 706
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 706
    Height = 343
    inherited pgcControle: TPageControl
      Width = 706
      Height = 310
      inherited TabSheet1: TTabSheet
        object Label1: TLabel
          Left = 12
          Top = 50
          Width = 112
          Height = 13
          Caption = 'Tipo de Empréstimo'
        end
        object Label2: TLabel
          Left = 356
          Top = 50
          Width = 96
          Height = 13
          Caption = 'Tipo de Contrato'
        end
        object Label3: TLabel
          Left = 13
          Top = 249
          Width = 181
          Height = 13
          Caption = 'Situação do Participante Titular'
        end
        inline molContratoEmptmo: TmolContratoEmptmo
          Left = 4
          Top = 8
          Width = 693
          Height = 41
          inherited edtNome: TEdit
            Width = 430
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 632
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 656
          end
        end
        inline molListaPatro: TmolListaPatro
          Left = 4
          Top = 88
          Width = 345
          Height = 161
          TabOrder = 1
          inherited Label6: TLabel
            Width = 86
          end
          inherited lstPatro: TCheckListBox
            Width = 329
            Height = 137
          end
          inherited btnInvertePatro: TBitBtn
            Left = 295
          end
          inherited btnMarcaTodosPatro: TBitBtn
            Left = 316
          end
        end
        inline molListaPlano: TmolListaPlano
          Left = 347
          Top = 88
          Width = 345
          Height = 161
          TabOrder = 2
          inherited Label6: TLabel
            Width = 119
          end
          inherited lstPlano: TCheckListBox
            Width = 329
            Height = 137
          end
          inherited btnInvertePlano: TBitBtn
            Left = 295
          end
          inherited btnMarcaTodosPlano: TBitBtn
            Left = 316
          end
        end
        object DBcboTipoEmptmo: TwwDBLookupCombo
          Left = 12
          Top = 64
          Width = 329
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOEMPTMO'#9'30'#9'Tipo de Empréstimo'#9'F')
          LookupTable = dtmLookEmptmo.qryLookTipoEmptmo
          LookupField = 'IDTIPOEMPTMO'
          ParentFont = False
          TabOrder = 3
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
        end
        object DBcboTipoContrato: TwwDBLookupCombo
          Left = 356
          Top = 64
          Width = 329
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'TCEDESCRICAO'#9'60'#9'TCEDESCRICAO'#9'F')
          LookupTable = dtmLookEmptmo.qryLookTipoContrato
          LookupField = 'IDTIPOCONTREMPTMO'
          DropDownWidth = 8
          Enabled = False
          ParentFont = False
          TabOrder = 4
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
        end
        object DBcboSitPart: TwwDBLookupCombo
          Left = 13
          Top = 263
          Width = 329
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'DESCRICAO'#9'F')
          LookupTable = dtmLookEmptmo.qryLookSitPart
          LookupField = 'IDSITPART'
          DropDownWidth = 8
          ParentFont = False
          TabOrder = 5
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
        end
      end
      inherited TabSheet2: TTabSheet
        object DBgrdHistMov: TwwDBGrid
          Left = 0
          Top = 28
          Width = 698
          Height = 272
          Selected.Strings = (
            'FLGESCOLHA'#9'2'#9' '#9'F'
            'IDCONTRATOEMPTMO'#9'12'#9'Contrato'#9'F'
            'NOME'#9'40'#9'Mutuário'#9'F'
            'TCEDESCRICAO'#9'40'#9'Tipo de Contrato'#9'F'
            'DATACREDITO'#9'10'#9'Data Crédito'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          Align = alClient
          DataSource = dsContratos
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          KeyOptions = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 698
          Height = 28
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Contratos'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object btnInverteSelecao: TBitBtn
            Left = 643
            Top = 3
            Width = 27
            Height = 24
            Hint = 'Inverte a Seleção'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888488888888888888844888888888888444448888888888444444488
              1888884444444888118884448844888881188448884888888118844888888188
              8118844888881188111888448881111111888884881111111888888888811111
              8888888888881188888888888888818888888888888888888888}
          end
          object btnMarcaTodos: TBitBtn
            Left = 670
            Top = 3
            Width = 27
            Height = 24
            Hint = 'Seleciona Todos'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            Glyph.Data = {
              D6000000424DD60000000000000076000000280000000C0000000C0000000100
              0400000000006000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888848888888
              0000888224888888000088222248888800008822822488880000882848224888
              0000888224822488000088222248228800008822822482880000882888224888
              0000888888822488000088888888228800008888888882880000}
          end
          object chkTodos: TCheckBox
            Left = 5
            Top = 5
            Width = 153
            Height = 17
            Caption = 'Processar TODOS'
            Font.Charset = ANSI_CHARSET
            Font.Color = clYellow
            Font.Height = -15
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
          object bbtnParcela: TBitBtn
            Left = 584
            Top = 3
            Width = 27
            Height = 24
            Hint = 'Seleciona Parcelas'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330000000
              00003333377777777777333330FFFFFFFFF03FF3F7FFFF33FFF7003000000FF0
              00F077F7777773F77737E00FBFBFB0FFFFF07773333FF7FF33F7E0FBFB00000F
              F0F077F333777773F737E0BFBFBFBFB0FFF077F3333FFFF733F7E0FBFB00000F
              F0F077F333777773F737E0BFBFBFBFB0FFF077F33FFFFFF733F7E0FB0000000F
              F0F077FF777777733737000FB0FFFFFFFFF07773F7F333333337333000FFFFFF
              FFF0333777F3FFF33FF7333330F000FF0000333337F777337777333330FFFFFF
              0FF0333337FFFFFF7F37333330CCCCCC0F033333377777777F73333330FFFFFF
              0033333337FFFFFF773333333000000003333333377777777333}
            NumGlyphs = 2
          end
          object bbtnEncargos: TBitBtn
            Left = 611
            Top = 3
            Width = 27
            Height = 24
            Hint = 'Seleciona Encargos'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00303333333333
              333337F3333333333333303333333333333337F33FFFFF3FF3FF303300000300
              300337FF77777F77377330000BBB0333333337777F337F33333330330BB00333
              333337F373F773333333303330033333333337F3377333333333303333333333
              333337F33FFFFF3FF3FF303300000300300337FF77777F77377330000BBB0333
              333337777F337F33333330330BB00333333337F373F773333333303330033333
              333337F3377333333333303333333333333337FFFF3FF3FFF333000003003000
              333377777F77377733330BBB0333333333337F337F33333333330BB003333333
              333373F773333333333330033333333333333773333333333333}
            NumGlyphs = 2
          end
        end
      end
    end
    inherited Panel1: TPanel
      Width = 706
      inherited fcLabel1: TfcLabel
        Width = 327
        Caption = 'Seleção de Contratos [ seleção ]'
      end
    end
  end
  inherited Dock971: TDock97
    Top = 343
    Width = 706
  end
  object qryContratos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    0    AS FLGESCOLHA,'
      '    0   AS  IDCONTRATOEMPTMO,'
      '    '#39'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'#39' AS NOME,'
      '    '#39'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'#39' AS TCEDESCRICAO,'
      '    SYSDATE AS DATACREDITO'
      'FROM'
      '    DUAL'
      'WHERE'
      '    1 = 2'
      '')
    UpdateObject = updContratos
    ValidateWithMask = True
    Left = 468
    Top = 311
    object qryContratosFLGESCOLHA: TFloatField
      FieldName = 'FLGESCOLHA'
    end
    object qryContratosIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryContratosNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryContratosTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryContratosDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
  end
  object dsContratos: TwwDataSource
    DataSet = qryContratos
    Left = 532
    Top = 311
  end
  object updContratos: TUpdateSQL
    ModifySQL.Strings = (
      'update DUAL'
      'set'
      '  FLGESCOLHA = :FLGESCOLHA'
      'where'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO')
    InsertSQL.Strings = (
      'insert into DUAL'
      '  (FLGESCOLHA, IDCONTRATOEMPTMO, NOME, TCEDESCRICAO, '
      'DATACREDITO)'
      'values'
      '  (:FLGESCOLHA, :IDCONTRATOEMPTMO, :NOME, :TCEDESCRICAO, '
      ':DATACREDITO)')
    DeleteSQL.Strings = (
      'delete from DUAL'
      'where'
      '  IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO')
    Left = 396
    Top = 311
  end
  object qry: TwwQuery
    ValidateWithMask = True
    Left = 228
    Top = 223
  end
end
