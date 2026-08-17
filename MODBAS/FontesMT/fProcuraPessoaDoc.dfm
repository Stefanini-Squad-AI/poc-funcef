inherited frmProcuraPessoaDoc: TfrmProcuraPessoaDoc
  Left = 168
  Top = 227
  BorderStyle = bsToolWindow
  Caption = 'Procura Pessoa'
  ClientHeight = 148
  ClientWidth = 407
  FormStyle = fsNormal
  Visible = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 407
    Height = 109
    BorderWidth = 2
    object gbxTipoProcura: TRadioGroup
      Left = 24
      Top = 16
      Width = 361
      Height = 74
      Caption = 'Tipo de Procura'
      ItemIndex = 0
      Items.Strings = (
        'por Documento'
        'por Pessoa')
      TabOrder = 1
      OnClick = gbxTipoProcuraClick
    end
    object dblckTipoDoc: TwwDBLookupCombo
      Left = 144
      Top = 34
      Width = 233
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEDOCUMENTO'#9'30'#9'NOMEDOCUMENTO'#9'F')
      LookupTable = CdsTipoDoc
      LookupField = 'NOMEDOCUMENTO'
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
  end
  inherited Dock971: TDock97
    Top = 109
    Width = 407
    inherited tb97Fundo: TToolbar97
      Left = 146
      inherited sep1: TToolbarSep97
        Left = 175
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 93
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 95
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 177
      end
      object bbtnProcurar: TBitBtn
        Left = 0
        Top = 0
        Width = 93
        Height = 33
        Caption = '&Procurar'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnProcurarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
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
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 16
    Top = 97
    TargetsData = (
      1
      4
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object CdsTipoDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 82
    Top = 97
  end
end
