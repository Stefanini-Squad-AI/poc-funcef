object frmCamposParaRegra: TfrmCamposParaRegra
  Left = 447
  Top = 175
  Width = 296
  Height = 143
  Caption = 'Dados para a Regra'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = [fsBold]
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 14
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 288
    Height = 116
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 2
    Caption = 'Panel2'
    TabOrder = 0
    object Panel1: TPanel
      Left = 191
      Top = 4
      Width = 93
      Height = 108
      Align = alRight
      BevelOuter = bvNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Button1: TBitBtn
        Left = 4
        Top = 5
        Width = 85
        Height = 27
        Caption = 'OK'
        Default = True
        TabOrder = 0
        OnClick = Button1Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
      object Button2: TBitBtn
        Left = 4
        Top = 32
        Width = 85
        Height = 27
        Cancel = True
        Caption = 'Cancelar'
        TabOrder = 1
        OnClick = Button2Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888009191900
          88888887788888778F88887991919191088888788888888878F8879919191919
          108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
          19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
          19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
          190878F877787778887887917F919F71908887F88788878887F8879919191919
          1088878F88888888878888799191919108888878FF88888F7888888779999977
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        Spacing = -1
      end
    end
    object rg1: TRadioGroup
      Left = 4
      Top = 4
      Width = 187
      Height = 108
      Align = alClient
      Caption = ' Grupo de informações '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'Dependentes'
        'Beneficiários'
        'Benef. Assistenciais'
        'Situações do participante')
      ParentFont = False
      TabOrder = 1
    end
  end
  object QRYREGRA: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDREGRA'
      'FROM'
      '    REGRA'
      'where'
      '     IDREGRA = :cod ')
    UpdateObject = UPDSQLREGRA
    ValidateWithMask = True
    Left = 65
    Top = 155
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cod'
        ParamType = ptUnknown
      end>
  end
  object DSREGRA: TwwDataSource
    DataSet = QRYREGRA
    Left = 37
    Top = 155
  end
  object UPDSQLREGRA: TUpdateSQL
    ModifySQL.Strings = (
      'update "CM"'
      'set'
      '  IDREGRA = :IDREGRA,'
      '  IDCAMPO = :IDCAMPO'
      'where'
      '  IDREGRA = :OLD_IDREGRA and'
      '  IDCAMPO = :OLD_IDCAMPO')
    InsertSQL.Strings = (
      'insert into CM.QRYREGRA'
      '  (IDREGRA, IDCAMPO)'
      'values'
      '  (:IDREGRA, :IDCAMPO)')
    DeleteSQL.Strings = (
      'delete from CM.QRYREGRA'
      'where'
      '  IDREGRA = :OLD_IDREGRA and'
      '  IDCAMPO = :OLD_IDCAMPO')
    Left = 9
    Top = 155
  end
end
