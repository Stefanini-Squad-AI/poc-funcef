inherited frmVerificaMenuSAD: TfrmVerificaMenuSAD
  Left = 282
  Top = 156
  Caption = 'Verificação de Menu'
  ClientHeight = 438
  ClientWidth = 561
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 561
    Height = 405
    object Label1: TLabel
      Left = 11
      Top = 5
      Width = 46
      Height = 13
      Caption = 'Módulo:'
    end
    object lblNomeModulo: TLabel
      Left = 59
      Top = 5
      Width = 87
      Height = 13
      Caption = 'lblNomeModulo'
    end
    object pgCtrlVerificaMenu: TPageControl
      Left = 0
      Top = 27
      Width = 561
      Height = 378
      ActivePage = tbsResultado
      Align = alBottom
      TabOrder = 0
      object tbsResultado: TTabSheet
        Caption = 'Resultado da Verificação'
        ImageIndex = 1
        object memResult: TRichEdit
          Left = 0
          Top = 0
          Width = 553
          Height = 350
          Align = alClient
          Lines.Strings = (
            'memResult')
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 405
    Width = 561
    inherited tb97Fundo: TToolbar97
      Left = 389
      DockPos = 530
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 230101
        ClickHelpContext = 230101
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 51
      inherited ToolbarSep971: TToolbarSep97
        Left = 166
      end
      inherited ToolbarSep974: TToolbarSep97
        Left = 332
      end
      object ToolbarSep975: TToolbarSep97 [3]
        Left = 83
        Top = 0
        Blank = True
        SizeHorz = 2
        SizeVert = 1
      end
      object ToolbarSep976: TToolbarSep97 [4]
        Left = 249
        Top = 0
        Blank = True
        SizeHorz = 2
        SizeVert = 1
      end
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Verificar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 251
        Visible = False
      end
      object bbtnSalvar: TBitBtn
        Left = 85
        Top = 0
        Width = 81
        Height = 27
        Cancel = True
        Caption = '&Salvar'
        TabOrder = 2
        OnClick = bbtnSalvarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
      end
      object bbtnImprimir: TBitBtn
        Left = 168
        Top = 0
        Width = 81
        Height = 27
        Cancel = True
        Caption = '&Imprimir'
        TabOrder = 3
        OnClick = bbtnImprimirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 994
    Top = 7
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        'TRichEdit'
        'Text'
        0))
  end
  object qryModulo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDMODULO, NOMEMODULO'
      'FROM MODULO'
      'ORDER BY NOMEMODULO')
    ValidateWithMask = True
    Left = 392
    Top = 80
  end
  object dsFuncoes: TwwDataSource
    Left = 464
    Top = 80
  end
  object qryMenu: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDFUNCAO, NOMEFUNCAO'
      'FROM FUNCAO'
      'WHERE IDMODULO = :IDMODULO'
      'AND UPPER(NOMEFUNCAO) = UPPER(:NOMEFUNCAO)')
    ValidateWithMask = True
    Left = 464
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NOMEFUNCAO'
        ParamType = ptUnknown
      end>
  end
  object qryBanco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDFUNCAO, NOMEFUNCAO'
      'FROM FUNCAO'
      'WHERE IDMODULO = :IDMODULO'
      ' ')
    ValidateWithMask = True
    Left = 392
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end>
  end
  object dlgSalvar: TSaveDialog
    DefaultExt = 'Rtf'
    FileName = 'Resultado'
    Filter = 'Rich Text|*.rtf|Arquivo Texto|*.txt|Todos os Arquivos|*.*'
    Title = 'Resultado da Comparação com SAD'
    Left = 8
    Top = 368
  end
end
