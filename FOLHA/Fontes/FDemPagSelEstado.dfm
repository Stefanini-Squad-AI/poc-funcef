inherited FrmDemPagSelEstado: TFrmDemPagSelEstado
  Left = 743
  Top = 193
  BorderStyle = bsDialog
  Caption = 'Estados'
  ClientHeight = 331
  ClientWidth = 333
  FormStyle = fsNormal
  Visible = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 333
    Height = 292
    object wwDBEstado: TwwDBGrid
      Left = 16
      Top = 16
      Width = 305
      Height = 265
      Selected.Strings = (
        'FLGENVIAR'#9'12'#9'Inverter~Seleção'#9'F'
        'CODESTADO'#9'3'#9'UF'#9'T'
        'NOMEESTADO'#9'20'#9'Estado'#9'T')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      DataSource = dsEstado
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyOptions = []
      ParentFont = False
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -7
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = True
      OnTitleButtonClick = wwDBEstadoTitleButtonClick
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 292
    Width = 333
    inherited tb97Fundo: TToolbar97
      Left = 169
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      inherited bbtnConfirmar: TBitBtn
        Caption = 'OK'
        ModalResult = 0
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
      end
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
        OnClick = bbtnCancelarClick
      end
    end
  end
  object qryEstado: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   0 AS FLGENVIAR,'
      '   IDESTADO,'
      '   CODESTADO,'
      '   NOMEESTADO'
      'FROM ESTADO '
      'WHERE IDPAIS = '#39'1'#39)
    UpdateObject = updEstado
    ControlType.Strings = (
      'FLGENVIAR;CheckBox;1;0')
    ValidateWithMask = True
    Left = 128
    Top = 80
    object qryEstadoFLGENVIAR: TFloatField
      Alignment = taCenter
      DisplayLabel = 'Inverter~Seleção'
      DisplayWidth = 12
      FieldName = 'FLGENVIAR'
    end
    object qryEstadoCODESTADO: TStringField
      DisplayLabel = 'UF'
      DisplayWidth = 3
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryEstadoNOMEESTADO: TStringField
      DisplayLabel = 'Estado'
      DisplayWidth = 20
      FieldName = 'NOMEESTADO'
      Size = 30
    end
    object qryEstadoIDESTADO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDESTADO'
      Visible = False
    end
  end
  object dsEstado: TwwDataSource
    DataSet = qryEstado
    Left = 128
    Top = 40
  end
  object updEstado: TUpdateSQL
    Left = 128
    Top = 124
  end
end
