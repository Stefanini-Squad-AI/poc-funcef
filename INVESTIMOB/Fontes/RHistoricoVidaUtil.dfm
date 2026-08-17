inherited frmRelHistoricoVidaUtil: TfrmRelHistoricoVidaUtil
  Left = 376
  Top = 164
  HelpContext = 540055
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Histórico Vida Útil'
  ClientHeight = 365
  ClientWidth = 730
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 730
    Height = 332
    object Label3: TLabel
      Left = 16
      Top = 10
      Width = 38
      Height = 13
      Caption = 'Imóvel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 16
      Top = 72
      Width = 689
      Height = 3
      Shape = bsTopLine
    end
    object btnBuscaImovel: TBitBtn
      Left = 679
      Top = 24
      Width = 24
      Height = 22
      TabOrder = 0
      OnClick = btnBuscaImovelClick
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
    object edtImovel: TEdit
      Left = 16
      Top = 24
      Width = 657
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object DBGrd: TwwDBGrid
      Left = 16
      Top = 96
      Width = 697
      Height = 233
      Selected.Strings = (
        'VIDAUTIL'#9'5'#9'VIDA UTIL'#9'F'
        'TXDEP_ANO'#9'10'#9'TAXA POR ANO'#9'F'
        'TXDEP_MES'#9'10'#9'TAXA POR MES'#9'F'
        'VIGENTE'#9'20'#9'VIGENTE'#9'F'
        'TRGDTINCLUSAO'#9'18'#9'DATA'#9'F'
        'NOMEUSUARIO'#9'20'#9'NOME DO USUARIO'#9'F'
        'IMOCODIGO'#9'10'#9'Código do Imóvel'#9'F'
        'HIST_EVENTO'#9'30'#9'Histórico'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsHistoricoVidaUtil
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
      UseTFields = False
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 332
    Width = 730
    inherited tb97Fundo: TToolbar97
      Left = 494
      DockPos = 494
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65499
    Top = 65499
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryHistoricoVidaUtil: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT h.VIDAUTIL,'
      '       h.TXDEP_ANO,'
      '       h.TXDEP_MES,'
      '       h.VIGENTE,'
      '       h.TRGDTINCLUSAO,'
      '       u.NOMEUSUARIO,'
      '       i.IMOCODIGO,'
      '       h.HIST_EVENTO'
      'FROM HISTORICOVIDAUTIL h'
      'LEFT JOIN USUARIOSISTEMA u'
      'ON substr(h.TRGUSERINCLUSAO, 3) = to_char(u.IDUSUARIO)'
      'INNER JOIN IMOVEL i'
      'ON i.idimovel = h.idimovel'
      'WHERE'
      'h.IDIMOVEL = :PIDIMOVEL')
    ValidateWithMask = True
    Left = 392
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptInput
      end>
    object qryHistoricoVidaUtilVIDAUTIL: TFloatField
      DisplayWidth = 10
      FieldName = 'VIDAUTIL'
    end
    object qryHistoricoVidaUtilTXDEP_ANO: TFloatField
      DisplayWidth = 10
      FieldName = 'TXDEP_ANO'
    end
    object qryHistoricoVidaUtilTXDEP_MES: TFloatField
      DisplayWidth = 10
      FieldName = 'TXDEP_MES'
    end
    object qryHistoricoVidaUtilVIGENTE: TStringField
      DisplayWidth = 20
      FieldName = 'VIGENTE'
    end
    object qryHistoricoVidaUtilTRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO'
    end
    object qryHistoricoVidaUtilNOMEUSUARIO: TStringField
      DisplayWidth = 20
      FieldName = 'NOMEUSUARIO'
    end
    object qryHistoricoVidaUtilHistVidaUtil: TStringField
      DisplayWidth = 10
      FieldName = 'IMOCODIGO'
    end
    object qryHistoricoVidaUtilHIST_EVENTO: TStringField
      DisplayWidth = 20
      FieldName = 'HIST_EVENTO'
    end
  end
  object dsHistoricoVidaUtil: TwwDataSource
    AutoEdit = False
    DataSet = qryHistoricoVidaUtil
    Left = 333
    Top = 264
  end
end
