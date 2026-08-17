inherited frmVerificaContribuicoes: TfrmVerificaContribuicoes
  Left = 186
  Top = 120
  Caption = 'Rotinas Auxiliares para Acerto da Base de Dados FCRT'
  ClientHeight = 350
  ClientWidth = 488
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 488
    Height = 311
    object PageControl1: TPageControl
      Left = 5
      Top = 5
      Width = 478
      Height = 301
      ActivePage = tbsAtuSalVirt
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Verificação de Descontinuidade de Contribuições'
        object GroupBox1: TGroupBox
          Left = 3
          Top = -2
          Width = 463
          Height = 64
          TabOrder = 0
          object Label1: TLabel
            Left = 9
            Top = 14
            Width = 187
            Height = 13
            Caption = 'Destino para o Arquivo de Saída'
          end
          object sbtnAtivos: TSpeedButton
            Left = 431
            Top = 31
            Width = 23
            Height = 22
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              5555555555555555555555555555555555555555555555555555555555555555
              555555555555555555555555555555555555555FFFFFFFFFF555550000000000
              55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
              B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
              000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
              555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
              55555575FFF75555555555700007555555555557777555555555555555555555
              5555555555555555555555555555555555555555555555555555}
            NumGlyphs = 2
            OnClick = sbtnAtivosClick
          end
          object edArqATIVOS: TEdit
            Left = 9
            Top = 32
            Width = 421
            Height = 21
            TabOrder = 0
            Text = 'C:\FCRT_DIVERGCONTRIB.TXT'
          end
        end
        object GroupBox3: TGroupBox
          Left = 3
          Top = 62
          Width = 463
          Height = 60
          Caption = 'Filtro Obrigatório'
          TabOrder = 1
          object Label7: TLabel
            Left = 15
            Top = 31
            Width = 112
            Height = 13
            Caption = 'Contribuições(Cód.)'
          end
          object Label8: TLabel
            Left = 273
            Top = 33
            Width = 67
            Height = 13
            Caption = 'Ex.: 1,2,3,4'
          end
          object edContribuicoes: TEdit
            Left = 147
            Top = 27
            Width = 121
            Height = 21
            TabOrder = 0
            Text = '2,4,9,16'
          end
        end
        object GroupBox2: TGroupBox
          Left = 3
          Top = 124
          Width = 463
          Height = 147
          Caption = ' Filtros ( Opcional )'
          TabOrder = 2
          object Label2: TLabel
            Left = 15
            Top = 47
            Width = 76
            Height = 13
            Caption = 'Pessoa (Cód)'
          end
          object Label3: TLabel
            Left = 15
            Top = 74
            Width = 55
            Height = 13
            Caption = 'Matrícula'
          end
          object Label4: TLabel
            Left = 15
            Top = 21
            Width = 118
            Height = 13
            Caption = 'Patrocinadora (Cód.)'
          end
          object Label5: TLabel
            Left = 15
            Top = 100
            Width = 89
            Height = 13
            Caption = 'Ano/Mês Início'
          end
          object Label6: TLabel
            Left = 15
            Top = 126
            Width = 83
            Height = 13
            Caption = 'Ano/Mês Final'
          end
          object edIDPESSOA: TEdit
            Left = 147
            Top = 43
            Width = 121
            Height = 21
            TabOrder = 1
          end
          object edMatricula: TEdit
            Left = 147
            Top = 70
            Width = 121
            Height = 21
            TabOrder = 2
          end
          object edPatrocinadora: TEdit
            Left = 147
            Top = 17
            Width = 121
            Height = 21
            TabOrder = 0
          end
          object edAnoMesInicio: TEdit
            Left = 147
            Top = 96
            Width = 121
            Height = 21
            TabOrder = 3
          end
          object edAnoMesFinal: TEdit
            Left = 147
            Top = 122
            Width = 121
            Height = 21
            TabOrder = 4
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Baixa de Contrib. AutoPat'
        ImageIndex = 1
        object Label9: TLabel
          Left = 9
          Top = 6
          Width = 48
          Height = 13
          Caption = 'Arquivo '
        end
        object Label10: TLabel
          Left = 9
          Top = 54
          Width = 24
          Height = 13
          Caption = 'Mês'
        end
        object Button1: TButton
          Left = 9
          Top = 99
          Width = 277
          Height = 25
          Caption = 'Baixar Contribuições AUTOPAT'
          TabOrder = 0
          OnClick = Button1Click
        end
        object edArqAutoPat: TEdit
          Left = 9
          Top = 21
          Width = 280
          Height = 21
          TabOrder = 1
        end
        object edMesAutoPat: TEdit
          Left = 9
          Top = 69
          Width = 121
          Height = 21
          TabOrder = 2
        end
      end
      object tbsAtuSalVirt: TTabSheet
        Caption = 'Atualizar Salário Virtual'
        ImageIndex = 2
        object Label11: TLabel
          Left = 21
          Top = 21
          Width = 89
          Height = 13
          Caption = 'Ano/Mês Início'
        end
        object Label12: TLabel
          Left = 147
          Top = 21
          Width = 83
          Height = 13
          Caption = 'Ano/Mês Final'
        end
        object edAnoMesIni: TEdit
          Left = 21
          Top = 37
          Width = 121
          Height = 21
          TabOrder = 0
        end
        object edAnoMesFim: TEdit
          Left = 147
          Top = 37
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object Button2: TButton
          Left = 24
          Top = 69
          Width = 277
          Height = 25
          Caption = 'Atualizar'
          TabOrder = 2
          OnClick = Button2Click
        end
        object memResult: TMemo
          Left = 24
          Top = 99
          Width = 271
          Height = 169
          TabOrder = 3
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 311
    Width = 488
    inherited tb97Fundo: TToolbar97
      Left = 292
      DockPos = 370
      inherited sep1: TToolbarSep97
        Left = 189
      end
      inherited sep3: TToolbarSep97
        Left = 93
      end
      inherited bbtnSair: TBitBtn
        Width = 93
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 96
        Width = 93
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 112
      inherited ToolbarSep971: TToolbarSep97
        Left = 93
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 93
        Caption = '&Processar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 96
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 15
    Top = 292
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Title = 'Destino para Arquivo de Saída'
    Left = 351
    Top = 66
  end
  object qry: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 429
    Top = 183
  end
  object qryGrava: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 330
    Top = 144
  end
  object qryVerifica: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 441
    Top = 126
  end
end
