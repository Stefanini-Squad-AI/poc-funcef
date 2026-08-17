inherited frmUtilExpPlacas: TfrmUtilExpPlacas
  Left = 148
  Top = 223
  HelpContext = 70003
  Caption = 'Exportação de Placas de Patrimônio'
  ClientHeight = 133
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 94
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 98
      Height = 13
      Caption = 'Pasta de Destino'
    end
    object edPastaDestino: TEdit
      Left = 24
      Top = 40
      Width = 460
      Height = 21
      TabOrder = 0
    end
    object bbtnPastaDestino: TBitBtn
      Left = 480
      Top = 40
      Width = 21
      Height = 21
      TabOrder = 1
      OnClick = bbtnPastaDestinoClick
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
  end
  inherited Dock971: TDock97
    Top = 94
    inherited TB97oKCancelar: TToolbar97
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 675
    Top = 491
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object pDirDestino: TProcuraDirDlg
    Caption = 'Selecione a pasta de destino'
    Directory = 
      'elar'#0'6'#0#0'¨¾Í'#5'¨¾Í'#5'('#0#0#0'Visible'#0'¼¾Í'#5'¼¾Í'#5#20#0#0#0'Falsl'#1#0#0#23#0#0#0#0#0#0#0#7#0#0#0'Visi' +
      '€'#1#0#0#39#0#0#0#0#0#0#0#21#0#0#0'TIvExtendedTranslator'#0#15'R$u'#0'A0pÍ'#5'Ø5'#0#0'TargetsData'#0 +
      '$u'#0'A0pÍ'#5'À5'#0#0'TargetsData'#0'$u'#0'A0pÍ'#5'¨5'#0#0#0#0#0#0' ºÍ'#5' ºÍ'#5#4#1#0#0#0#0#0#0#0#0#0#0#0#0#0#0 +
      #0#0#0#0#1#0#1#0#0#0#0#0'œ¾Í'#5'„¿Í'#5#0#1#1#0#0#0#0' '#0#0#0#0'€¿Í'#5'€¿Í'#5'Ì'#0#0#0#0#0#0#0'ì¿Í'#5#20'ÀÍ'#5'4ÀÍ'#5#0#0#0#0 +
      #0#0#0#0
    Folder = foCustom
    Options = [bfStatusText]
    ShowPath = False
    Left = 144
    Top = 80
  end
  object qryPatrim: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.PLACA, B.DESBEM, B.VALORG, L.NOME AS DESCLOCAL'
      'FROM BEM B,'
      '     CONJUNTO C,'
      '     LOCALIZACAO L'
      'WHERE (B.IDCONJUNTO    = C.IDCONJUNTO)'
      '  AND (C.IDLOCALIZACAO = L.IDLOCALIZACAO)'
      'ORDER BY B.DESBEM, B.PLACA  ')
    ValidateWithMask = True
    Left = 40
    Top = 80
    object qryPatrimPLACA: TFloatField
      FieldName = 'PLACA'
      Origin = '"CM.BEM".PLACA'
    end
    object qryPatrimDESBEM: TStringField
      FieldName = 'DESBEM'
      Origin = '"CM.BEM".DESBEM'
      Size = 200
    end
    object qryPatrimVALORG: TFloatField
      FieldName = 'VALORG'
      Origin = '"CM.BEM".VALORG'
    end
    object qryPatrimDESCLOCAL: TStringField
      FieldName = 'DESCLOCAL'
      Origin = '"CM.LOCALIZACAO".NOME'
      Size = 60
    end
  end
  object tblPatrim: THalcyonDataSet
    About = 'Halcyon Version 06.6.0 (21 Mar 00)'
    AutoFlush = False
    Exclusive = False
    LockProtocol = Default
    TranslateASCII = True
    UseDeleted = False
    UserID = 0
    Left = 312
    Top = 8
  end
  object GeraTblPatrim: TCreateHalcyonDataSet
    AutoOverwrite = False
    DBFTable = tblPatrim
    DBFType = Clipper
    Left = 392
    Top = 8
  end
end
