inherited frmImportaCand: TfrmImportaCand
  Left = 93
  Top = 142
  HelpContext = 730001
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Importação de Arquivos TXT com Candidatos'
  ClientHeight = 380
  ClientWidth = 617
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 617
    Height = 341
    BorderWidth = 2
    object pgctrlPaginas: TPageControl
      Left = 4
      Top = 25
      Width = 609
      Height = 312
      ActivePage = tbsImporta
      Align = alClient
      TabOrder = 0
      OnChange = pgctrlPaginasChange
      object tbsImporta: TTabSheet
        Caption = 'Importação'
        object Bevel2: TBevel
          Left = 0
          Top = 0
          Width = 600
          Height = 283
          Style = bsRaised
        end
        object Bevel1: TBevel
          Left = 12
          Top = 84
          Width = 576
          Height = 24
        end
        object spbtProcurArq: TSpeedButton
          Left = 250
          Top = 14
          Width = 101
          Height = 45
          Hint = 'Procura arquivo de importação'
          Caption = '  &Arquivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
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
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = spbtProcurArqClick
        end
        object Label4: TLabel
          Left = 12
          Top = 68
          Width = 141
          Height = 13
          Caption = 'Dados a Importar do Arquivo :'
        end
        object lblArquivo: TLabel
          Left = 17
          Top = 88
          Width = 565
          Height = 16
          AutoSize = False
          Caption = 'C:\'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object Label6: TLabel
          Left = 133
          Top = 137
          Width = 112
          Height = 13
          Caption = 'Fonte do Recrutamento'
        end
        object rgOpcaoAtualiza: TRadioGroup
          Left = 75
          Top = 197
          Width = 450
          Height = 41
          Caption = 
            'Caso Já Encontre a Pessoa no Cadastro, Atualiza Seus Dados com o' +
            's do Arquivo Texto?'
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 0
          TabStop = True
        end
        object pgbarProgresso: TProgressBar
          Left = 12
          Top = 256
          Width = 576
          Height = 19
          Min = 0
          Max = 100
          Step = 1
          TabOrder = 1
          Visible = False
        end
        object dblcmbLayout: TwwDBLookupCombo
          Left = 133
          Top = 152
          Width = 335
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'30'#9'DESCRICAO'#9'F')
          LookupTable = CdsFonteRecr
          LookupField = 'IDFONTRECR'
          Style = csDropDownList
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          UseTFields = False
          AllowClearKey = True
          OnChange = dblcmbLayoutChange
        end
      end
      object tbsResult: TTabSheet
        Caption = 'Resultado'
        object memResult: TMemo
          Left = 0
          Top = 0
          Width = 497
          Height = 252
          Color = clBlack
          Font.Charset = ANSI_CHARSET
          Font.Color = clLime
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 0
        end
        object bbtnSalvar: TBitBtn
          Left = 504
          Top = 24
          Width = 93
          Height = 33
          Caption = '  &Salvar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = bbtnSalvarClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
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
      end
    end
    object pnlHorario: TPanel
      Left = 4
      Top = 4
      Width = 609
      Height = 21
      Align = alTop
      BevelInner = bvLowered
      Caption = 'Tempo Decorrido'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 341
    Width = 617
    inherited tb97Fundo: TToolbar97
      Left = 302
      DockPos = 310
      inherited sep1: TToolbarSep97
        Left = 229
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 119
        Top = 0
        Blank = True
        SizeHorz = 30
      end
      inherited bbtnSair: TBitBtn
        Left = 149
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 231
      end
      object rbtnImportarArq: TBitBtn
        Left = 0
        Top = 0
        Width = 119
        Height = 33
        Caption = '  &Importar Arquivo'
        Default = True
        Enabled = False
        TabOrder = 2
        OnClick = rbtnImportarArqClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888444488
          88888888887777F888888888884CC48888888888887F87F888888888884CC488
          88888888887F87F888888888884CC48888888888887F87FFF8888888444CC444
          8888888877788777F88888884CCCCCC48888888878F888878888888884CCCC48
          888888FFF78F887FFFF88000004CC400008887777778F77777FF777777744777
          7708777777777777777878FFFFFFFFFF87707F8FFFFFFFFFF7F7787777777777
          87707F777777777787F778888888888887707F888888888887F7788888888882
          87707FFFFFFFFFFFF7F77FFFFFFFFFFFF7707777777777777787878888888888
          8870878FFFFFFFFFFFF788777777777777788877777777777778}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 562
    Top = 85
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '*.TXT'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'C:\'
    Title = 'Salvar LOG da Importação'
    Left = 562
    Top = 72
  end
  object OpenDlg: TOpenDialog
    DefaultExt = '*.TXT'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'C:\'
    Title = 'Abrir arquivo a Importar'
    Left = 562
    Top = 60
  end
  object CMValidaDoc: TCMValidaDoc
    TipoDocumento = tdCPF
    Mensagem.ExibeMensagem = False
    Mensagem.Texto = 'Número de Documento Inválido'
    Left = 480
    Top = 65
  end
  object CdsFonteRecr: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 551
    Top = 172
  end
end
