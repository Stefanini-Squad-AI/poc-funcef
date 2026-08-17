inherited frmParamRelatDirf: TfrmParamRelatDirf
  Left = 185
  Top = 169
  Caption = 'Conferencia da DIRF'
  ClientHeight = 151
  ClientWidth = 336
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 336
    Height = 112
    object Label1: TLabel
      Left = 102
      Top = 40
      Width = 68
      Height = 16
      Caption = 'Ano Base'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtAnoretencao: TEdit
      Left = 104
      Top = 56
      Width = 121
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 4
      ParentFont = False
      TabOrder = 0
      Text = '0'
    end
    object UpDown1: TUpDown
      Left = 225
      Top = 56
      Width = 15
      Height = 24
      Associate = edtAnoretencao
      Min = 0
      Max = 3000
      Position = 0
      TabOrder = 1
      Thousands = False
      Wrap = False
    end
  end
  inherited Dock971: TDock97
    Top = 112
    Width = 336
    inherited tb97Fundo: TToolbar97
      Left = 167
      DockPos = 168
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NUMDOCUMENTO FROM PESSOA WHERE IDPESSOA = :IDPESSOA')
    ValidateWithMask = True
    Left = 277
    Top = 22
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryAuxNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'BASEDADOS.PESSOA.NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
  end
end
