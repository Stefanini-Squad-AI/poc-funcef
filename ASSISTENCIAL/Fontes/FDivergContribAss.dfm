inherited frmDivergContribAss: TfrmDivergContribAss
  Left = 4
  Top = 38
  BorderStyle = bsSingle
  Caption = 'Tratamento de Divergências de Cobranças'
  ClientHeight = 461
  ClientWidth = 797
  FormStyle = fsStayOnTop
  Menu = mnuprinc
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object tb97Param: TToolWindow97 [0]
    Left = 111
    Top = 45
    ActivateParent = False
    Caption = 'Parâmetros Padrão'
    ClientAreaHeight = 287
    ClientAreaWidth = 541
    DefaultDock = Dock97Top
    DockableTo = []
    DockPos = 0
    MinClientHeight = 25
    Resizable = False
    TabOrder = 2
    Visible = False
    OnVisibleChanged = tb97ParamVisibleChanged
    object pnlTextoFluxOper: TPanel
      Left = 0
      Top = 0
      Width = 541
      Height = 287
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pnlTextoFluxOper'
      TabOrder = 0
      object Bevel1: TBevel
        Left = 0
        Top = 0
        Width = 541
        Height = 4
        Align = alTop
        Shape = bsTopLine
      end
      object pnlparam: TPanel
        Left = 0
        Top = 4
        Width = 541
        Height = 283
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 2
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 0
        object Label3: TLabel
          Left = 32
          Top = 16
          Width = 39
          Height = 13
          Caption = 'Label3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 16
          Top = 0
          Width = 88
          Height = 13
          Caption = 'Plano Assistencial:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 264
          Top = 0
          Width = 62
          Height = 13
          Caption = 'Contribuição:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 280
          Top = 16
          Width = 39
          Height = 13
          Caption = 'Label6'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object grpbxvlraceite: TGroupBox
          Left = 2
          Top = 34
          Width = 537
          Height = 55
          Caption = 'Ignorar Diferença   '
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          object Label1: TLabel
            Left = 20
            Top = 26
            Width = 149
            Height = 13
            Caption = 'Atraso / Devolução menor que:'
          end
          object SpeedButton20: TSpeedButton
            Left = 344
            Top = 17
            Width = 89
            Height = 28
            Caption = 'Atualizar'
            Glyph.Data = {
              66010000424D6601000000000000760000002800000014000000140000000100
              040000000000F000000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888800008888888888888888888800008888888888887788888800008877
              7777777077778888000080000000007000777888000080FFFFFFF07000007788
              000080F44F44F07000000778000080FFFFFFF07887000077000080F44444F078
              88870077000080FFFFFFF07888887007000080F44444F07888788007000080FF
              FFFFF07880788007000080F44FFFF07800770078000080FFFF00008000000788
              000080F44F0F088000078888000080FFFF008888007888880000800000088888
              8088888800008888888888888888888800008888888888888888888800008888
              88888888888888880000}
            OnClick = SpeedButton20Click
          end
          object SpeedButton3: TSpeedButton
            Left = 436
            Top = 17
            Width = 89
            Height = 28
            Caption = 'Valor'
            Glyph.Data = {
              56070000424D5607000000000000360400002800000028000000140000000100
              0800000000002003000000000000000000000001000000010000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A600000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
              03030303030303030303030303030303030303030303030303FFFFFFFFFFFFFF
              FFFF030303030303030303030000000000000000000303030303030303030303
              F8F8F8F8F8F8F8F8F8FF0303030303030303030300FBFFFBFFFBFFFB00030303
              03FFFFFFFFFFFFFFF8FF03FFFFFFFFFFF8FF0303000000000000000000FFF8F8
              F8F8F8FF00030303F8F8F8F8F8F8F8F8F8FFF8F8F8F8F803F8FF030007FF07FF
              07FF07FF00FBFFFBFFFBFFFB000303F8FF03030303030303F8FF030303FFFFFF
              F8FF0300FF07FF07FF07FF0700FF0707F8F8F8FF000303F8FF03030303030303
              F8FFFFFFF8F8F803F8FF030007FF07FF07FF0704040404FBFFFBFFFB000303F8
              FF030303030303F8F8F8F8FF03FFFFFFF8FF0300FF07FF07FF07FF07FC040407
              F8F8F8FF000303F8FF03030303030303F8F8F8FFF8F8F803F8FF030007FF07FF
              07FF070404FC04FBFFFBFFFB000303F8FF030303030303F8F8F8F8FF030303FF
              F8FF0300FF07FF07FF07040404FF04FFFFFFF8F8000303F8FF0303030303F8F8
              F8FFF8030303F8F8F803030007FF07FF0704040400FBFFFBFFFBF800030303F8
              FF03030303F8F8F8F8FFFFFFFFFFF8F803030300FF07FF070404040700000000
              00000003030303F8FF030303F8F8F803F8F8F8F8F8F8F8030303030007FF07FF
              070407FF07FF000303030303030303F8FF03030303F803030303F8FF03030303
              03030300FF07FF07FF07FF07FF07000303030303030303F8FF03030303030303
              0303F8FF030303030303030007FF07FF07FF07FF07FF000303030303030303F8
              FF0303FFFFFFFFFFFF03F8FF0303030303030300FF07040404040404FF070003
              03030303030303F803FFF8F8F8F8F8F8FFFFF80303030303030303030000FEFC
              FCFCFC04000003030303030303030303F8F803F8F8F8F8F8F8F8030303030303
              030303030303FEFCFCFCFC04030303030303030303030303030303F8F8F8F8F8
              030303030303030303030303030303FEFEFEFE03030303030303030303030303
              0303030303030303030303030303030303030303030303030303030303030303
              0303030303030303030303030303030303030303030303030303}
            NumGlyphs = 2
            OnClick = SpeedButton3Click
          end
          object RealEdit1: TRealEdit
            Left = 208
            Top = 22
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            MaxLength = 17
            TabOrder = 0
            WordWrap = False
            IntDigits = 15
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
        end
        object BitBtn1: TBitBtn
          Left = 459
          Top = 253
          Width = 80
          Height = 28
          Cancel = True
          Caption = '&Sair'
          TabOrder = 1
          OnClick = BitBtn1Click
          Glyph.Data = {
            F6010000424DF601000000000000760000002800000030000000100000000100
            0400000000008001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF8F8FF8F00F
            8F77FF8F8FF8F00F8F778FF8F8FF8F8FF8F7F8FF8F8FF0E0FF87F8FF8F8FF0E0
            FF878F8FF8F8FF8F8FF7F8F8FF8F80E608F7F8F8FF8F80E608F7FF8F8FF8F8FF
            8F87000000FF80E66007000000FF80E66007F8FF8F8FF8F8FF87777770F8F0E6
            6087777770F8F0E6608777777066666668777777007770E660877777007770E6
            608777777066666668777777007770E660877777007770E66087777770666666
            68777788060770E760877788060770E76087777770666666687770000E6070E0
            608770000E6070E0608777777066666668770EEEEEE600E660870EEEEEE600E6
            608777777067666668770EEEEEE600E660870EEEEEE600E66087777770606666
            687770000E6070E6608770000E6070E6608777777066666668777777060770E6
            60877777060770E66087777770666666687777770077770E608777770077770E
            60877777706666666877777770777770E087777770777770E087777770666666
            687777777000000000777777700000000077777770EEEEEEE877}
          NumGlyphs = 3
          Spacing = 2
        end
        object GroupBox2: TGroupBox
          Left = 2
          Top = 96
          Width = 537
          Height = 153
          Cursor = crNo
          Caption = 'Alteradores'
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          object wwDBGrid2: TwwDBGrid
            Left = 2
            Top = 15
            Width = 533
            Height = 128
            Selected.Strings = (
              'DESCRICAO'#9'25'#9'Alterador'#9'No'
              'NOMEREGRA'#9'25'#9'Regra de Cálculo'#9'No'
              'FLGCOBRA'#9'10'#9'Cobra'#9'No'
              'FLGATRASO'#9'10'#9'Cobra no Atraso'#9'No'
              'FLGDEVOL'#9'10'#9'Cobra na Devolução'#9'No')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alTop
            DataSource = dsalteradorxcontrib
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
      end
    end
  end
  inherited pnlFundo: TPanel
    Width = 797
    Height = 422
    Anchors = []
    FullRepaint = False
    object Splitter1: TSplitter
      Left = 213
      Top = 1
      Width = 4
      Height = 420
      Cursor = crHSplit
    end
    object pnlDireita: TPanel
      Left = 217
      Top = 1
      Width = 579
      Height = 420
      Align = alClient
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object pnlResult: TPanel
        Left = 0
        Top = 55
        Width = 579
        Height = 324
        Align = alClient
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object Splitter2: TSplitter
          Left = 462
          Top = 1
          Width = 7
          Height = 322
          Cursor = crHSplit
          Align = alRight
        end
        object Panel2: TPanel
          Left = 469
          Top = 1
          Width = 109
          Height = 322
          Align = alRight
          TabOrder = 1
          object bbtnVoltar: TBitBtn
            Left = 7
            Top = 15
            Width = 97
            Height = 38
            Caption = '&Voltar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = bbtnVoltarClick
            Glyph.Data = {
              E6000000424DE60000000000000076000000280000000E0000000E0000000100
              0400000000007000000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
              DD00DDDDD4444DDDDD00DDD44444444DDD00DD444DDDD444DD00DD44DDDDDD44
              DD00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD4
              4D00DD44DDDD4D44DD00DD44DDDD4444DD00DDDDDDDD444DDD00DDDDDDDD4444
              DD00DDDDDDDDDDDDDD00}
          end
          object bbtnSalvar: TBitBtn
            Left = 7
            Top = 59
            Width = 97
            Height = 38
            Caption = 'S&alvar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = bbtnSalvarClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777770000000000007770330770000330777033077000033077703307700003
              30777033000000033077703333333333307770330000000330777030FFFFFFF0
              30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
              8077777CCC777700007777CCC77777777777777C777777777777}
          end
          object BitBtn2: TBitBtn
            Left = 7
            Top = 103
            Width = 97
            Height = 38
            Hint = 'Imprime o texto ao lado na impressora Padrão'
            Caption = '&Imprimir'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = BitBtn2Click
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
              0003377777777777777308888888888888807F33333333333337088888888888
              88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
              8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
              8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
              03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
              03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
              33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
              33333337FFFF7733333333300000033333333337777773333333}
            NumGlyphs = 2
          end
        end
        object Panel3: TPanel
          Left = 1
          Top = 1
          Width = 461
          Height = 322
          Align = alClient
          TabOrder = 2
          object memResult: TMemo
            Left = 1
            Top = 1
            Width = 459
            Height = 320
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object RichEdAdaptacao: TRichEdit
          Left = 176
          Top = 64
          Width = 185
          Height = 89
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Visible = False
          WordWrap = False
        end
      end
      object pnlDirTopo: TPanel
        Left = 0
        Top = 0
        Width = 579
        Height = 55
        Align = alTop
        TabOrder = 0
        object lblModo: TLabel
          Left = 6
          Top = 3
          Width = 322
          Height = 28
          AutoSize = False
          Caption = 'lblModo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 364
          Top = 3
          Width = 163
          Height = 18
          Caption = 'Mês de Referência'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object cmbMesRef: TComboBox
          Left = 367
          Top = 27
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          Text = 'cmbMesRef'
          OnChange = cmbMesRefChange
          Items.Strings = (
            'janeiro'
            'fevereiro'
            'março'
            'abril'
            'maio'
            'junho'
            'julho'
            'agosto'
            'setembro '
            'outubro'
            'novembro'
            'dezembro'
            'Contribuição sobre 13º')
        end
        object spedAnoRef: TSpinEdit
          Left = 517
          Top = 27
          Width = 55
          Height = 22
          MaxLength = 4
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 1998
          OnChange = spedAnoRefChange
        end
        object chkCobNaoDiverg: TCheckBox
          Left = 6
          Top = 32
          Width = 347
          Height = 17
          Caption = 'Considerar cobranças não processadas como divergentes'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          State = cbChecked
          TabOrder = 2
        end
      end
      object pgctrlDivergencias: TPageControl
        Left = 0
        Top = 55
        Width = 579
        Height = 324
        ActivePage = tbsFiltro
        Align = alClient
        TabOrder = 1
        object tbsFiltro: TTabSheet
          Caption = 'Filtrar por ...'
          object pnlTabSheetFiltro: TPanel
            Left = 0
            Top = 0
            Width = 571
            Height = 296
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 0
            object pnlFiltroEsq: TPanel
              Left = 1
              Top = 1
              Width = 261
              Height = 294
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              object pnlFiltro1: TPanel
                Left = 0
                Top = 0
                Width = 261
                Height = 41
                Align = alTop
                TabOrder = 0
                object chkPatro: TCheckBox
                  Left = 12
                  Top = 12
                  Width = 97
                  Height = 17
                  Caption = 'Patrocinadora'
                  TabOrder = 0
                  OnClick = chkPatroClick
                end
              end
              object pnlFiltro2: TPanel
                Left = 0
                Top = 41
                Width = 261
                Height = 41
                Align = alTop
                TabOrder = 1
                object chkPlano: TCheckBox
                  Left = 12
                  Top = 12
                  Width = 184
                  Height = 17
                  Caption = 'Plano Previdenciário'
                  TabOrder = 0
                  OnClick = chkPlanoClick
                end
              end
              object pnlFiltro3: TPanel
                Left = 0
                Top = 123
                Width = 261
                Height = 41
                Align = alTop
                TabOrder = 2
                object chkContrib: TCheckBox
                  Left = 12
                  Top = 12
                  Width = 97
                  Height = 17
                  Caption = 'Contribuição'
                  TabOrder = 0
                  OnClick = chkContribClick
                end
              end
              object pnlFiltro4: TPanel
                Left = 0
                Top = 164
                Width = 261
                Height = 41
                Align = alTop
                TabOrder = 3
                object chkTempo: TCheckBox
                  Left = 12
                  Top = 12
                  Width = 223
                  Height = 17
                  Caption = 'Tempo de Divergência (meses)'
                  TabOrder = 0
                  OnClick = chkTempoClick
                end
              end
              object pnlFiltro5: TPanel
                Left = 0
                Top = 246
                Width = 261
                Height = 41
                Align = alTop
                TabOrder = 5
                object chkParticipante: TCheckBox
                  Left = 12
                  Top = 12
                  Width = 142
                  Height = 17
                  Caption = 'Participante'
                  TabOrder = 0
                  OnClick = chkParticipanteClick
                end
              end
              object Panel1: TPanel
                Left = 0
                Top = 205
                Width = 261
                Height = 41
                Align = alTop
                Caption = 'Panel1'
                TabOrder = 4
                object chkValor: TCheckBox
                  Left = 12
                  Top = 12
                  Width = 244
                  Height = 17
                  Caption = 'Valor de Divergência (recebido - esperado)'
                  TabOrder = 0
                  OnClick = chkValorClick
                end
              end
              object Panel4: TPanel
                Left = 0
                Top = 82
                Width = 261
                Height = 41
                Align = alTop
                TabOrder = 6
                object ckplanass: TCheckBox
                  Left = 12
                  Top = 12
                  Width = 142
                  Height = 17
                  Caption = 'Plano Assistencial'
                  TabOrder = 0
                  OnClick = chkParticipanteClick
                end
              end
            end
            object pnlFiltroDir: TPanel
              Left = 262
              Top = 1
              Width = 308
              Height = 294
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object ConsPart1: TConsPart
                Left = 256
                Top = 248
                Width = 25
                Height = 25
                Caption = 'Consulta'
                Flat = True
                Glyph.Data = {
                  96010000424D9601000000000000760000002800000018000000180000000100
                  0400000000002001000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00188888880FFF
                  F0FFF0FF073888888880FFFFFF0FFFF073808888880FFFFFFFF0FF07380F8888
                  80FFFF000000807380FF88880FF00000000007380FFF8880FF00000000000380
                  FF0F880FF00077FFF8877030FFF080FFF00E8FF888888700FFFF0FFF00EEF888
                  87477870F0FF80FF0EFF8888887477870F0F880F0EF88888888747870FF08880
                  0EF88888888748870FFF88880E888F8888787F870FFF88880E888FF8888F8F87
                  0FFF88880E788EFEFFF8F870FFFF888887E788FFEF8F87E0FFF08888807E7888
                  FF887E0FFF0888888807E777777EE0FFF0888888888007E7E7E00FFF08888888
                  88888000000FFFF088888888888888880FFFFF08888888888888888880FFF088
                  8888888888888888880F08888888888888888888888088888888}
                Visible = False
                OnClick = ConsPart1Click
                DataBaseName = 'BaseDados'
              end
              object pnlFiltroDir1: TPanel
                Left = 0
                Top = 0
                Width = 308
                Height = 41
                Align = alTop
                TabOrder = 0
                object dblkpcmbPatro: TwwDBLookupCombo
                  Left = 6
                  Top = 9
                  Width = 268
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'60'#9'Patrocinadora')
                  LookupTable = qryPatro
                  LookupField = 'IDPESSOA'
                  Options = [loTitles]
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  OnChange = dblkpcmbPatroChange
                  OnCloseUp = dblkpcmbPatroCloseUp
                  OnExit = dblkpcmbPatroExit
                end
              end
              object pnlFiltroDir2: TPanel
                Left = 0
                Top = 41
                Width = 308
                Height = 41
                Align = alTop
                TabOrder = 1
                object dblkpcmbPlano: TwwDBLookupCombo
                  Left = 6
                  Top = 9
                  Width = 268
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'50'#9'Plano Previdenciário')
                  LookupTable = qryPlano
                  LookupField = 'IDPLANOPREV'
                  Options = [loTitles]
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  OnChange = dblkpcmbPlanoChange
                  OnCloseUp = dblkpcmbPlanoCloseUp
                  OnExit = dblkpcmbPlanoExit
                end
              end
              object pnlFiltroDir3: TPanel
                Left = 0
                Top = 123
                Width = 308
                Height = 41
                Align = alTop
                TabOrder = 2
                object dblkpcmbContrib: TwwDBLookupCombo
                  Left = 6
                  Top = 9
                  Width = 268
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'60'#9'Contribuição Previdenciária')
                  LookupTable = qryContrib
                  LookupField = 'IDCONTRIBUICAO'
                  Options = [loTitles]
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  OnChange = dblkpcmbContribChange
                  OnCloseUp = dblkpcmbContribCloseUp
                  OnExit = dblkpcmbContribExit
                end
              end
              object pnlFiltroDir4: TPanel
                Left = 0
                Top = 164
                Width = 308
                Height = 41
                Align = alTop
                TabOrder = 3
                object cmbFiltraTempo: TComboBox
                  Left = 6
                  Top = 12
                  Width = 130
                  Height = 21
                  ItemHeight = 13
                  TabOrder = 0
                  OnChange = cmbFiltraTempoChange
                  Items.Strings = (
                    'é igual a'
                    'é maior que'
                    'é maior ou igual que'
                    'é menor que'
                    'é menor ou igual que'
                    'é diferente de')
                end
                object edTempo: TEdit
                  Left = 141
                  Top = 12
                  Width = 133
                  Height = 21
                  TabOrder = 1
                  OnExit = edTempoExit
                end
              end
              object pnlFiltroDir5: TPanel
                Left = 0
                Top = 205
                Width = 308
                Height = 41
                Align = alTop
                TabOrder = 4
                object cmbFiltraValor: TComboBox
                  Left = 6
                  Top = 12
                  Width = 130
                  Height = 21
                  ItemHeight = 13
                  TabOrder = 0
                  OnChange = cmbFiltraValorChange
                  Items.Strings = (
                    'é igual a'
                    'é maior que'
                    'é maior ou igual que'
                    'é menor que'
                    'é menor ou igual que'
                    'é diferente de')
                end
                object edValor: TEdit
                  Left = 144
                  Top = 12
                  Width = 130
                  Height = 21
                  TabOrder = 1
                  OnExit = edValorExit
                end
              end
              object pnlFiltroDir6: TPanel
                Left = 0
                Top = 246
                Width = 308
                Height = 41
                Align = alTop
                TabOrder = 5
                object spbtnProcParticip: TSpeedButton
                  Left = 252
                  Top = 9
                  Width = 25
                  Height = 25
                  Hint = 'Procurar Participante'
                  Glyph.Data = {
                    4E010000424D4E01000000000000760000002800000012000000120000000100
                    040000000000D800000000000000000000001000000010000000000000000000
                    BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                    DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
                    FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
                    0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
                    870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
                    FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
                    0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
                    DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
                  ParentShowHint = False
                  ShowHint = True
                  OnClick = spbtnProcParticipClick
                end
                object edParticipante: TEdit
                  Left = 9
                  Top = 12
                  Width = 238
                  Height = 21
                  Enabled = False
                  TabOrder = 0
                end
              end
              object Panel5: TPanel
                Left = 0
                Top = 82
                Width = 308
                Height = 41
                Align = alTop
                TabOrder = 6
                object cmbplanass: TwwDBLookupCombo
                  Left = 6
                  Top = 9
                  Width = 268
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'40'#9'NOME')
                  LookupTable = qryplanass
                  LookupField = 'IDPLANASS'
                  Options = [loTitles]
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  OnChange = cmbplanassChange
                  OnCloseUp = cmbplanassCloseUp
                  OnExit = cmbplanassExit
                end
              end
            end
          end
        end
        object tbsDivergencias: TTabSheet
          Caption = 'Divergências'
          object pnlDivergencia: TPanel
            Left = 0
            Top = 0
            Width = 571
            Height = 296
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 0
            object dbgrdDivergSintet: TwwDBGrid
              Left = 1
              Top = 1
              Width = 569
              Height = 294
              Hint = 'Clique com o botão da direita para visualizar opções'
              Selected.Strings = (
                'NOME'#9'40'#9'Nome'
                'NOMECONTRIB'#9'20'#9'Contribuição'
                'VALORESPERADO'#9'10'#9'Valor esperado'
                'VALORRECEBIDO'#9'10'#9'Valor recebido'
                'PLANASS'#9'40'#9'Plano Assistencial'
                'PESSJUR'#9'30'#9'Patrocinadora'
                'PLANPREV'#9'50'#9'Plano Previdenciário')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 1
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsDivergSintet
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              TitleLines = 2
              TitleButtons = False
              OnMouseDown = dbgrdDivergSintetMouseDown
              IndicatorColor = icBlack
            end
            object dbgrdDivergAnalit: TwwDBGrid
              Left = 1
              Top = 1
              Width = 569
              Height = 294
              Hint = 'Clique com o botão da direita para visualizar opções'
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 1
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsDivergAnalit
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              TitleLines = 2
              TitleButtons = False
              OnMouseDown = dbgrdDivergAnalitMouseDown
              IndicatorColor = icBlack
            end
          end
        end
      end
      object pnlFiltroBottom: TPanel
        Left = 0
        Top = 379
        Width = 579
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object Dock97Top: TDock97
          Left = 0
          Top = 0
          Width = 579
          Height = 40
          Background.Data = {
            760F0000424D760F0000000000007600000028000000800000003C0000000100
            040000000000000F000000000000000000001000000000000000000000008080
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            777777777777171717777777777777177771777777777777777077F7FF7FFFF7
            77F77F77F7F7F7F7F7F7F7F7F777777777771777177777777777777777777777
            777777777771717717777777777777777717777777777777777777777FFFFF7F
            7F7F77F7F7F7F7F7F7F7F7F77777777777777717177777777777777777777777
            77777777777777171777777777777777717777777777777777777777777FF7FF
            7F77777777F7F7FF7F7F77F77F77777777777777177777777777777777777777
            7777777777771771777777777777777771777777777777777777777777777FFF
            FF7F7777F7F7F7F7F7F77F777777777777777771717777777777777777777777
            777777777777771777777777777777777777777777777777777777777777777F
            F7F7F7F777F7F7F7F7F7F7F7F777777777777777177777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            FFFF7F7F7F7F7F7F7F7F777777777F7777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7FF7F7F7F7F7F7FFFFF7F7F7F7F7777777777777717717177777777777777777
            7777777777777777777777777777777777777777777777777777777777777771
            77FFFFF7F7777F77F7F7F77F77777F7777777777777171777777777777777777
            7777777777777177777777777777777777777777777777777777777777777777
            777FFFFFF7F7F77F7F7FF7F7F77F777777777777777777177777777777777777
            7777777777777777771777777777777777777777777777777777777777777777
            7177FFFF7F7F77F7F7FF7FF7F7F7F77F77777777777171717777777777777777
            7777777777777717771777777777777777777777777777777777777777777777
            77777FFFFF7F7777F7F7FF7FF7F77F7777777777777777777777771777777777
            7777777777777771777777777777777777777777777777777777777777777777
            777777FFFF7F77F7F7F7F7F7F7F7F77F7F777777777771717771777177177777
            7777777777777777777777777777777777777777777777777777777777777777
            777777FFFFFF7F77F7F7F7FF7FF7F7F7777F7777777777771717717777777777
            7777777777777777177777777777777777777777777777777777777777777777
            7777777FFFF7F7F777F7F7F7F7F7F777F7777F77777777717771777777777777
            7777777777777777717777777777777777777777777777777777777777777777
            7777777F7FFF7F77F7F77F7FFF7F7F7F777F7777777777171717717777777F77
            7777777777777777777771777777777777777777777777777777777777777777
            7777777FFFF7F7777777F7F7F7F7F7F77F77F7777777777771771777777F7777
            F7F7777777777777771777777777177777777777777777777777777777777777
            77777177FFFFF7F777F77F7F7FF7F7F7F77F77F777777777171717177777F777
            777F7F7777777777777177177771717777777777777777777777777777777777
            77777777FFFF7F777777F7F7FF7F7F7F7F7F7F77777777777771717717777777
            77777F7F77777777777717771777777777777777777777777777777777777777
            777777177FFFF7F7F77F7F7FF7F7FF7F7F7F7F7F777777777717177177777777
            1777777777777777777771717717777177777777777777777777777777777777
            777777777FFFF7F77777777F7F7FF7F7F7F7F777F77777777771771717777771
            7777777777771777777777177771777777777777777777777777777777777777
            77777771777F7F7F77777F7F7F7F7F7F7F7F7F7F777777777777771717717717
            7777777777777777777771777777777777777777777777777777777777777777
            777777777777F7F7F7F77F7F7F7F7F7F7F7F7777777F77777777717717171717
            7777777777171777777717777777777777777777777777777777777777777777
            77777777777777F7F77777777F7F7F7F7F7F7F7F7F7777777777777777717777
            7777777777777177777771777777777777777777777777777777777777777777
            777777777777777F7F77777F7F7F7F7F7F7F7F777777F77F7777771777717777
            7777777777777777777771177777777777777777777777777777777777777777
            7177777777777777F7F7777777F77F7F7FF7F7F7F7F777777777777777717777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777F77F7F7F7F7F7F77777F7777777777771777777
            7777777777777777777771717777777777777777777777777777777777777777
            777777177777771777777777777F7F7F7F7F7F7F7F7F777F7777777777717777
            7777777777777777777777171777777777777777777777777777777777777777
            71777777777777777777777777F7F7F7F7F7F7F7F7F77F777777777777177777
            7777777777777777777777177777777777777777777777777777777777777717
            77777777777777717777777777777F77F7F7F7F7F7F7F7777777777777777777
            77777777777777777777777777777777777F7777777777777777777777777171
            7171777777777777171777777777F77F7F7F7F7F7F7F7F777777777777777777
            771777777777777777777777777777777177F777777777777777777777777717
            171777177777777717771777777777F7F7F7F7FF7F7F77F77777777777777171
            7777777777777777777777777777777777777F77777777777777777777777777
            77717177777777777171717177777F77F7F7F7F7F7F7F77F7777777777777171
            7177777177777777777777777777777777777FF7F77771777777777777777777
            1717777777777777771777777777777F7F7F7F7F7F7F77F7F777777777777777
            7777777717777777777777777777777777777777777777777777777777777777
            717777777777777777777777717777F77F7F7F7F7F7F7F7F77F7777777777771
            7177777777777777777777777777777777771777777777777777777777777777
            77177777777777777777777777777777F7F77F7F7F7F7F7FF777F77777777717
            777777F777777777777777777777777777777777717177717777777777777777
            77177777777777777777777771777777777F77F7F7F7F7F777F7777777777777
            171777F7F7777777777777177777777777777777777777777777777777777777
            777777777777777777777777177177777F77F7F7F7F7F7F7F7F7F7F777777777
            7777777F77777777777777777777777777777777777777777777777777777777
            77777777777777777777777771777777777F77F7F7F7F7F7F7F77777F7777777
            7717777F77777777777777717177777777777777777777777777777777777777
            7777777777777777777777777717777777777F7F7F7F7F7F7777F7F777777777
            777777777F777777777777777717777777777777777777777777777777777777
            777777777777777777777777777777777777F7F7F7F7F7F7F7F7F77777777777
            7777777777777777777777771777777777777777777777777777777777777777
            77777777777777777777777777717771777777F7F77F7F7F7F7F77F777777777
            7777777777777777777777777717177777777771777777777777777777777777
            7777777777777777777777777777177777777F7F77F7F7F7F7F77F777F777777
            7777777777777177777777777777777777777717177777777777777777777777
            77777777777777777177777777717171777777777F7F7FF7F7F7F77F77777777
            7777777777717777777777777717177777777777777777777777777777777777
            777777777777777777177777777711717777777F7F7F7F7F7F77F7F7F7F77777
            777777777717171717777777777777777777777771777777777F777777777777
            777777777777777777777777777117117777777777F77F7F7F7F77F77777F777
            77777777171777777777777777777777777777777777777777F7F77777777777
            77777777777777777771777777771117177777777F77F7F7F777F7F7F7F77777
            7777777777171777777777777777777777777777777777777777777777777777
            777777777777777777777777777771777777777777F77F7F7F7F7F7F777F7777
            7777777717177777777777777777777777777777777777777777777777777777
            77777777777777777777777777777777777177777777F77F7F77F7F7F7F77F77
            7777777777171777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777177777777F7F7F7F7F7F7F777F7777
            77777777777777777F7F77777717777777777777777777777777777771777777
            7777777777777777777777777777777777717777777777F7F7F77F7F7F7F77F7
            77777777777777777F7F7F777777777777777777777777777777771777777777
            77777777177777777777777777771777777717777777F7F7F77F7F7F7F77F777
            777777777777777777FFF77F7777717777777777777777777777777777177777
            77777777777777777777777777771777777771777777777777F7F7F7F77F77F7
            77F7777777777777777777F77777777777777777777777777777777777777777
            77777777777777777777777777777777777777171777777F7F77F7F7F7F77F77
            F77777777777777777777777F7F7777777777777777777777777777777777777
            777777777717777777777777777777777777717777777777777F7F7F7F77F77F
            77F77777777F77777717777777F7777777777777777777777777777777777777
            77777777777177777777777777777777777777777177777777F7F7F77F7F77F7
            7F77F77777777F77777717777777777777777777777777777777777777777777
            7777777777771777777777777777777777777777777777777F77F7F7F777F777
            F77F777777777777771771777777771777777777777777777777777777777777
            777777777777777771777777777777777777777777177777777F7F7F7F7F77F7
            F7F7777777777777777717171777777777777777777777777777777777777777
            77777777777771777777777777777177777777777771777777777777F777F777
            7777777777777777777171717177771777777777777777777777777777777777
            77777777777777777777777777777777777777777777777777777F7F7F7F7777
            F77F77F777777777777771771717177777777777777777777777777777777777
            7777777777777777777777777777777777777777777177777777}
          BoundLines = [blTop, blBottom]
          LimitToOneRow = True
          object tb97Atalho: TToolbar97
            Left = 5
            Top = 0
            Caption = 'Atalhos'
            CloseButton = False
            DefaultDock = Dock97Top
            DockableTo = [dpTop, dpBottom]
            DockPos = 5
            TabOrder = 0
            object sbtndiverganalit: TToolbarButton97
              Left = 142
              Top = 0
              Width = 126
              Height = 34
              Caption = 'Analíticas'
              Flat = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
                0000377777777777777707FFFFFFFFFFFF70773FF33333333F770F77FFFFFFFF
                77F07F773FFFFFFF77F70FFF7700000000007F337777777777770FFFFF0BBBBB
                BBB07F333F7F3FF33FF70FFF700B00BB00B07F3F777F77F377370F707F0BB0B0
                0BB07F77337F37F77337007EEE0BB0B0BBB077FFFF7F37F7F3370777770EE000
                EEE07777777F3777F3F7307EEE0E0E00E0E03773FF7F7377F73733707F0EE000
                0EE03337737F377773373333700EEE00EEE03333377F3377FF373333330EEEE0
                0EE03333337F33377F373333330EEEE00EE03333337F333773373333330EEEEE
                EEE03333337FFFFFFFF733333300000000003333337777777777}
              NumGlyphs = 2
              Opaque = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = spbtnDivergAnalitClick
            end
            object spbtnDivergSintet: TToolbarButton97
              Left = 8
              Top = 0
              Width = 126
              Height = 34
              Caption = 'Sintéticas'
              Flat = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
                0000377777777777777707FFFFFFFFFFFF70773FF33333333F770F77FFFFFFFF
                77F07F773FFFFFFF77F70FFF7700000000007F337777777777770FFFFF0FFFFF
                FFF07F333F7F3FFFF3370FFF700F0000FFF07F3F777F777733370F707F0FFFFF
                FFF07F77337F3FFFFFF7007EEE0F000000F077FFFF7F777777370777770FFFFF
                FFF07777777F3FFFFFF7307EEE0F000000F03773FF7F7777773733707F0FFFFF
                FFF03337737F3FFF33373333700F000FFFF03333377F77733FF73333330FFFFF
                00003333337F3FF377773333330F00FF0F033333337F77337F733333330FFFFF
                00333333337FFFFF773333333300000003333333337777777333}
              NumGlyphs = 2
              Opaque = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = spbtnDivergSintetClick
            end
            object sbtnFluxOper: TToolbarButton97
              Left = 276
              Top = 0
              Width = 126
              Height = 34
              Caption = 'Limpa Filtros'
              Flat = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
                555557777F777555F55500000000555055557777777755F75555005500055055
                555577F5777F57555555005550055555555577FF577F5FF55555500550050055
                5555577FF77577FF555555005050110555555577F757777FF555555505099910
                555555FF75777777FF555005550999910555577F5F77777775F5500505509990
                3055577F75F77777575F55005055090B030555775755777575755555555550B0
                B03055555F555757575755550555550B0B335555755555757555555555555550
                BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
                50BB555555555555575F555555555555550B5555555555555575}
              NumGlyphs = 2
              Opaque = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = sbtnFluxOperClick
            end
            object ToolbarSep973: TToolbarSep97
              Left = 268
              Top = 0
              Blank = True
              SizeHorz = 8
            end
            object bbtnVerResultado: TToolbarButton97
              Left = 410
              Top = 0
              Width = 126
              Height = 34
              Caption = 'Resultado'
              Enabled = False
              Flat = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76020000424D7602000000000000760000002800000040000000100000000100
                0400000000000002000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00331111133333
                333333FFFFF33333333333222223332222233333333333444443333199933333
                333333388883333333333332AAA333AAA2333333333333CCC433333199933333
                1133333888833333FF333332AAA333AAA2333334433333CCC433339919933333
                99133388F883333388F333AA2AA333AA2A2333CC433333CC4C43339133933333
                3913338F33833333388F33A233A333A33A2333C4333333C33CC4391333333333
                339138F333333333338F3A233333333333A23C433333333333C4391333333333
                339138F333333333338F3A233333333333A23C433333333333C4391333333333
                339138F333333333338F3A233333333333A23C433333333333C4391333333333
                339138F333333333338F3A233333333333A23C433333333333C4391333333333
                339138F333333333338F3A233333333333A23C433333333333C4339133333333
                3991338F33333333388F33A2333333333AA233C4333333333CC4339913333333
                99133388F333333388F333AA23333333AA2333CC43333333CC43333991333339
                913333388F3333388F33333AA233333AA233333CC433333CC433333399111119
                1333333388FFFFF8F3333333AA22222A23333333CC44444C4333333333999993
                33333333338888833333333333AAAAA33333333333CCCCC33333333333333333
                3333333333333333333333333333333333333333333333333333}
              NumGlyphs = 4
              Opaque = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = bbtnVerResultadoClick
            end
            object ToolbarSep972: TToolbarSep97
              Left = 134
              Top = 0
              Blank = True
              SizeHorz = 8
            end
            object ToolbarSep974: TToolbarSep97
              Left = 402
              Top = 0
              Blank = True
              SizeHorz = 8
            end
            object ToolbarSep975: TToolbarSep97
              Left = 536
              Top = 0
              Blank = True
              SizeHorz = 8
            end
            object ToolbarSep976: TToolbarSep97
              Left = 0
              Top = 0
              Blank = True
              SizeHorz = 8
            end
          end
        end
      end
    end
    object pnlEsquerda: TPanel
      Left = 1
      Top = 1
      Width = 212
      Height = 420
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object trvModos: TTreeView
        Left = 0
        Top = 0
        Width = 212
        Height = 420
        Align = alClient
        BiDiMode = bdRightToLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        HideSelection = False
        Images = imModos
        Indent = 19
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 0
        OnChange = trvModosChange
        OnCollapsing = trvModosCollapsing
        OnExpanding = trvModosExpanding
        Items.Data = {
          020000002E0000000200000000000000FFFFFFFFFFFFFFFF0000000004000000
          15436F6272616EE7617320446976657267656E7465732F000000000000000000
          0000FFFFFFFFFFFFFFFF0000000000000000164D656E73616C69646164657320
          4EE36F205061676173330000000000000000000000FFFFFFFFFFFFFFFF000000
          00000000001A4D656E73616C6964616465732050616761732061204D656E6F72
          330000000000000000000000FFFFFFFFFFFFFFFF00000000000000001A4D656E
          73616C6964616465732050616761732061204D61696F72350000000000000000
          000000FFFFFFFFFFFFFFFF00000000000000001C4D656E73616C696461646573
          20506167617320656D2041747261736F260000000200000000000000FFFFFFFF
          FFFFFFFF00000000000000000D496E6164696D706C656E746573}
      end
    end
  end
  inherited Dock971: TDock97
    Top = 422
    Width = 797
    inherited tb97Fundo: TToolbar97
      Left = 623
      DockPos = 623
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 175
      DockPos = 175
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  object pnlProgresso: TPanel [3]
    Left = 202
    Top = 115
    Width = 424
    Height = 150
    BevelWidth = 3
    Caption = 'pnlProgresso'
    TabOrder = 3
    Visible = False
    object lblMsg2: TLabel
      Left = 84
      Top = 48
      Width = 316
      Height = 34
      AutoSize = False
      Caption = 'Tratando Divergências...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object gagProgresso: TGauge
      Left = 76
      Top = 76
      Width = 316
      Height = 22
      ForeColor = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Progress = 0
    end
    object imVerifica: TImage
      Left = 21
      Top = 64
      Width = 36
      Height = 41
      IncrementalDisplay = True
      Picture.Data = {
        07544269746D617076020000424D760200000000000076000000280000002000
        0000200000000100040000000000000200000000000000000000100000001000
        000000000000000080000080000000808000800000008000800080800000C0C0
        C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF00777000000000000000222AA008877777700BBBBBBBBBBBBBBB0222AAA077
        77770BFBFBFBFBFBFBFBF02222AA07777777BFBFBFBFBFB0000002222AA08877
        7777FBFBFBFBFB0222222222AA0B08877777BFBFBFBFB0AAA222222AA0BFB088
        7777FBFF00000AAAAAA222AA0B0BFB087777BFFFF0A222AAAAA22AA0B0B0BF08
        7777FFFF0A222222AA22AA000B0B00088777FF00A2222222222AA070F0B0BFB0
        8777000A2222222222AA07770B0B0BF0777770AA222222222AA0777770B0B007
        77777700AA222222AA077777770707777777777700AA222AA088888888888877
        777777777700AA00000000000000088888887777777700B7B7B70FBFBFB7B000
        00007777777770FBFFFF0BFBFBFB7B7B7B7B7777777777000000BFBFBFFFB7B7
        B7B777777777707B7B7B0BFBFBFBFBFBFB7B7777777770BFBFFF0FFFFFFFBFBF
        BFB77777777777000000FBFFFFFBFFFBFBFB7777777770B7B7BF0FF0FFFFFFBF
        FFB77777777770FBFFFB0B0FFBFBFBFBFBFB7777777777000000BF0FBFFFFFFF
        FFBF77777777707B7BFB00FBFBFBFBFBFBFB7777777770BFBFFF00FFBFBF0000
        0000777777777700000000FBFBF077777777777777777777777770BFBF077777
        777777777777777777770BFBF0777777777777777777777777770FBF07777777
        777777777777777777770BF077777777777777777777777777770FB077777777
        7777}
      Transparent = True
    end
    object lblMsg1: TLabel
      Left = 22
      Top = 9
      Width = 376
      Height = 34
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object btncancelaprogress: TBitBtn
      Left = 312
      Top = 114
      Width = 89
      Height = 27
      Cancel = True
      Caption = '&Cancelar'
      TabOrder = 0
      OnClick = btncancelaprogressClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 115
    Top = 99
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object imModos: TImageList
    Left = 9
    Top = 174
    Bitmap = {
      494C010105000A00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      00000000000000000000000000000000000021A5390000000000FFFFFF00FFFF
      FF0000C68C000000000063000000310000000000000000000000FF1000000000
      000000BD18000000000021A5390000000000FFFFFF00FFFFFF00E7C68C000000
      00006B0000003100000000000000000000000010000000000000E7BD18000000
      000021A5390000000000FFFFFF00FFFFFF00C6C68C0000000000730000003100
      000000000000000000000810000000000000E7BD18000000000021A539000000
      0000FFFFFF00FFFFFF00A5CE8C00000000007B00000031000000000000000000
      00001010000000000000E7BD18000000000021A5390000000000FFFFFF00FFFF
      FF0084CE8C000000000084000000310000003900000031000000000000000000
      0000D610000000000000847318000000000021A5390000000000FFFFFF00FFFF
      FF0084B58C000000000042000000310000000000000000000000DE1000000000
      0000632118000000000021A5390000000000FFFFFF00FFFFFF0063B58C000000
      00004A000000310000000000000000000000E71000000000000063B518000000
      000021A5390000000000FFFFFF00FFFFFF0042BD8C00000000005A0000003100
      00000000000000000000EF1000000000000063B518000000000021A539000000
      0000FFFFFF00FFFFFF0021BD8C00000000005200000031000000000000000000
      0000F71000000000000063B51800000000008494180000000000639C8C000000
      0000FFFFFF00FFFFFF0021A58C00000000001800000031000000000000000000
      000010F70000000000002184180000000000639C8C0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0021000000310000000000000000000000001000000000
      000000A518000000000021A5390000000000FFFFFF00FFFFFF00E7A58C000000
      000031000000310000000000000000000000081000000000000000A518000000
      000021A5390000000000FFFFFF00FFFFFF00C6AD8C0000000000290000003100
      00000000000000000000CE1000000000000000A518000000000021A539000000
      0000FFFFFF00FFFFFF00A5AD8C000000000000A58C0000000000F70000003100
      00000000000000000000E7630800000000000084180000000000C6737B000000
      0000A5948C0000000000639C8C0000000000FF00000031000000000000000000
      000063B50000000000002184180000000000C68C8C0000000000FFFFFF00FFFF
      FF0084948C00000000000000000031000000000000000000000010F700000000
      00008494180000000000C68C8C0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000800000031000000000000000000000010B5000000000000849418000000
      0000C6737B0000000000429C8C0000000000C6E78C0000000000100000003100
      0000000000000000000063B50000000000000831000000000000847318000000
      0000847B8C0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF006B0000003100
      00000000000000000000E710000000000000847318000000000021A539000000
      0000FFFFFF00FFFFFF0021848C0000000000DE00000031000000000000000000
      0000EF10000000000000218418000000000021A5390000000000FFFFFF00FFFF
      FF00008C8C0000000000E7000000310000000000000000000000F71000000000
      0000008418000000000021A5390000000000FFFFFF00FFFFFF00E78C8C000000
      0000EF000000310000000000000000000000FF10000000000000008418000000
      000021A5390000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00E76B8C000000
      000042000000310000000000000000000000D610000000000000216318000000
      000021A5390000000000FFFFFF00FFFFFF00C6738C00000000004A0000003100
      00000000000000000000DE10000000000000214A18000000000021A539000000
      0000FFFFFF00FFFFFF0042848C00000000005200000031000000000000000000
      0000C663000000000000632118000000000000315A0000000000847B8C000000
      0000A5949400000000005A0000003100000000000000000000007B1000000000
      00008473180000000000A5738C0000000000637B8C0000000000FFFFFF00FFFF
      FF00630000003100000000000000000000000000000000000000F71000000000
      0000A55218000000000021A5390000000000FFFFFF00FFFFFF0063638C000000
      000021000000310000000000000000000000FF10000000000000A55218000000
      000021A5390000000000FFFFFF00FFFFFF0042638C0000000000290000003100
      000000000000000000000010000000000000C65218000000000021A539000000
      0000FFFFFF00FFFFFF00216B8C00000000003100000031000000000000000000
      0000C610000000000000216318000000000021A5390000000000FFFFFF00FFFF
      FF00006B8C000000000039000000310000000000000000000000CE1000000000
      0000216318000000000021A539000000000063428C0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF009C100000290000000000000000000000E71000000000
      0000214A18000000000021A5390000000000FFFFFF00FFFFFF00E7528C000000
      000008000000310000000000000000000000EF10000000000000214A18000000
      000021A5390000000000FFFFFF00FFFFFF00845A8C0000000000000000003100
      000000000000000000009463000000000000C65218000000000000C639000000
      0000FFFFFF00FFFFFF00A55A8C00000000001000000031000000000000000000
      00000839000000000000A55218000000000000C6390000000000FFFFFF00FFFF
      FF00C621A5000000000018000000310000007310000029000000000000000000
      000010F7000000000000C631180000000000E7318C0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF007B100000290000000000000000000000DE1000000000
      0000C63118000000000021A5390000000000FFFFFF00FFFFFF0000528C000000
      0000841000002900000000000000000000007B42000000000000422918000000
      0000C6737B0000000000424A8C0000000000C68C8C00000000008C1000002900
      0000000000000000000063B5000000000000632118000000000063428C000000
      0000FFFFFF00FFFFFF00214A8C00000000009410000029000000000000000000
      000010F7000000000000214A180000000000422918000000000021A539000000
      0000FFFFFF00FFFFFF0021318C00000000005210000029000000000000000000
      0000CE10000000000000422918000000000021A5390000000000FFFFFF00FFFF
      FF0000318C00000000005A100000290000000000000000000000D61000000000
      0000422918000000000021A5390000000000FFFFFF00FFFFFF0084428C000000
      000063100000290000000000000000000000108C000000000000E73118000000
      0000C6737B0000000000C6398C000000000063428C00000000006B1000002900
      0000000000000000000063B5000000000000C631180000000000E7318C000000
      0000FFFFFF00FFFFFF00A5398C000000000084218C0000000000291000002900
      000000000000000000000821000000000000C61818000000000000E721000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF003110000029000000000000000000
      00004A94000000000000A51818000000000063D6210000000000FFFFFF00FFFF
      FF0063BD94000000000039100000290000000000000000000000FF1000000000
      0000A51818000000000021A5390000000000FFFFFF00FFFFFF0063298C000000
      000042100000290000000000000000000000BD10000000000000632118000000
      000021A5390000000000FFFFFF00FFFFFF0042298C00000000004A1000002900
      00000000000000000000C610000000000000D61000000000000021FF00000000
      000021A5390000000000FFFFFF00FFFFFF0042108C0000000000081000002900
      00000000000000000000DE10000000000000E70008000000000021A539000000
      0000FFFFFF00FFFFFF0021108C00000000001010000029000000000000000000
      0000E710000000000000A50808000000000021A5390000000000FFFFFF00FFFF
      FF0000188C00000000004A080000290000000000000000000000EF1000000000
      0000631008000000000021A5390000000000FFFFFF00FFFFFF00E7188C000000
      000021100000290000000000000000000000F710000000000000A52900000000
      000021A5390000000000FFFFFF00FFFFFF00E7FF840000000000E7318C000000
      0000E708000029000000000000000000000063B500000000000021E700000000
      000000FF840000000000FFFFFF00FFFFFF00C6008C0000000000EF0800002900
      0000000000000000000010F7000000000000E7E700000000000000FF84000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00F708000029000000000000000000
      0000E76B000000000000A5EF000000000000E7C6080000000000FFFFFF00FFFF
      FF0084088C0000000000FF080000290000000000000000000000BD4A00000000
      000063F7000000000000E7C6080000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00001000002900000000000000000000000000000000000000298400000000
      000063BD000000000000C6737B0000000000FFFFFF00FFFFFF0063F784000000
      0000C60800002900000000000000000000008C3100000000000021C600000000
      0000C6737B000000000042F784000000000000FF840000000000CE0800002900
      0000000000000000000063B5000000000000E7CE00000000000063F784000000
      0000FFFFFF00FFFFFF0021FF840000000000D608000029000000000000000000
      000010F7000000000000A5D600000000000063F7840000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DE0800002900000000000000000000009C2100000000
      000063DE000000000000C6737B000000000042DE840000000000FFFFFF00FFFF
      FF0000E78400000000009C08000029000000000000000000000010F700000000
      000021AD00000000000042DE840000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A5080000290000000000000000000000088C000000000000E7AD00000000
      0000C6737B0000000000C6E784000000000084EF840000000000AD0800002900
      0000000000000000000063B5000000000000A59C000000000000E7E784000000
      0000FFFFFF00FFFFFF00A5EF840000000000B508000029000000000000000000
      000010F7000000000000A5B5000000000000E7E7840000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00BD080000290000007308000029000000000000000000
      0000CE5A00000000000021FF000000000000C6737B000000000084D684000000
      000042DE8400000000007B08000029000000000000000000000063B500000000
      0000E700080000000000A5CE840000000000FFFFFF00FFFFFF0063D684000000
      00008408000029000000000000000000000010F7000000000000A50808000000
      0000A5CE840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF008C0800002900
      00000000000000000000A5730000000000006310080000000000C6737B000000
      000021DE840000000000E7E78400000000009408000029000000000000000000
      000063B5000000000000218C0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000021A5390000000000FFFFFF00FFFF
      FF0063088C00000000005A08000029000000000000000000000094C600000000
      0000E7E7000000000000C6737B0000000000E7C6840000000000A5CE84000000
      00006308000029000000000000000000000063B5000000000000A5EF00000000
      000000C6840000000000FFFFFF00FFFFFF00C6CE8400000000006B0800002900
      0000000000000000000010F700000000000063F700000000000000C684000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003108000029000000000000000000
      0000F71000000000000021C600000000000021A5390000000000FFFFFF00FFFF
      FF0084B584000000000039080000290000000000000000000000B51000000000
      0000E7CE00000000000021A5390000000000FFFFFF00FFFFFF0063BD84000000
      000042080000290000000000000000000000BD10000000000000A5D600000000
      000021A5390000000000FFFFFF00FFFFFF0042BD840000000000BD0800002900
      00000000000000000000C6100000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000000000000000000000000
      00000000000000000000000000000000000021AD000000000000849C84000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF001008000029000000000000000000
      000021AD000000000000E7AD000000000000C6737B000000000000AD84000000
      000000C68400000000001808000029000000000000000000000063B500000000
      0000A59C00000000000021A5840000000000FFFFFF00FFFFFF00E7AD84000000
      00002108000029000000000000000000000010F7000000000000A5B500000000
      000021A5840000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C694840000000000EF0800002900
      00000000000000000000DE10000000000000E70008000000000021A539000000
      0000FFFFFF00FFFFFF00A594840000000000F708000029000000000000000000
      0000E710000000000000A50808000000000021A5390000000000FFFFFF00FFFF
      FF00C6AD840000000000FF080000290000000000000000000000BD6B00000000
      00006310080000000000C6737B0000000000639C84000000000021A584000000
      0000000800002900000000000000000000000000000000000000FFFFFF000000
      0000000000000000000084848400000000000000000000000000000000000000
      000000000000000000000000000000000000CE1000000000000021E700000000
      000021A5390000000000FFFFFF00FFFFFF00E78C840000000000CE0800002900
      000000000000000000001873000000000000E7E7000000000000C6737B000000
      0000218C840000000000849C840000000000D608000029000000000000000000
      000063B5000000000000A5EF0000000000004284840000000000FFFFFF00FFFF
      FF00008C840000000000DE08000029000000000000000000000010F700000000
      000063F70000000000004284840000000000000000000000000000000000FFFF
      FF00000000000000000084848400848484008484840084848400848484008484
      840000000000000000000000000000000000FFFFFF00FFFFFF00E77384000000
      0000A5080000290000000000000000000000AD1000000000000021C600000000
      000021A5390000000000FFFFFF00FFFFFF00C673840000000000AD0800002900
      00000000000000000000B510000000000000E7CE00000000000021A539000000
      0000FFFFFF00FFFFFF00A57B840000000000B508000029000000000000000000
      0000BD10000000000000A5D600000000000021A5390000000000FFFFFF00FFFF
      FF00847B84000000000052080000290000000000000000000000000000000000
      000000000000FFFFFF000000000084848400C6C6C600C6C6C600848484000000
      0000848484008484840000000000000000000000000000000000BD4A00000000
      000021AD00000000000063D6210000000000FFFFFF00FFFFFF00A5218C000000
      000084080000290000000000000000000000D610000000000000E7AD00000000
      000021A5390000000000FFFFFF00FFFFFF00426B8400000000008C0800002900
      00000000000000000000DE10000000000000A59C00000000000021A539000000
      0000FFFFFF00FFFFFF00216B8400000000009408000029000000000000000000
      0000E710000000000000A5B50000000000000000000000000000000000000000
      0000000000000000000084848400C6C6C600C6C6C600FFFFFF00C6C6C6008484
      84000000000084848400000000000000000021A5390000000000FFFFFF00FFFF
      FF0000528400000000005A080000290000000000000000000000BD1000000000
      0000E70008000000000021A5390000000000FFFFFF00FFFFFF00E75284000000
      000063080000290000000000000000000000C610000000000000A50808000000
      000021A5390000000000FFFFFF00FFFFFF00C65A8400000000006B0800002900
      00000000000000000000CE10000000000000631008000000000021A539000000
      0000FFFFFF00FFFFFF0063638400000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00C6C6
      C600848484000000000000000000000000003108000029000000000000000000
      0000A51000000000000021E700000000000021A5390000000000FFFFFF00FFFF
      FF00424A84000000000039080000290000000000000000000000420800000000
      0000E7E700000000000000E7210000000000FFFFFF00FFFFFF00A55A84000000
      0000420800002900000000000000000000000042000000000000A5EF00000000
      000063D6210000000000FFFFFF00FFFFFF0084638400000000004A0800002900
      00000000000000000000AD100000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFF
      FF00C6C6C60000000000000000000000000063BD00000000000021A539000000
      0000FFFFFF00FFFFFF0021318400000000001008000029000000000000000000
      0000CE1000000000000021C600000000000021A5390000000000FFFFFF00FFFF
      FF00003984000000000018080000290000000000000000000000D61000000000
      0000E7CE00000000000021A5390000000000FFFFFF00FFFFFF00E73984000000
      000021080000290000000000000000000000DE10000000000000A5D600000000
      000021A5390000000000FFFFFF00FFFFFF000000000000000000000000000000
      00000000000000000000C6C6C600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000C621840000000000EF0000002900
      00000000000000000000A51000000000000021AD00000000000021A539000000
      0000FFFFFF00FFFFFF00A521840000000000F700000029000000000000000000
      0000AD10000000000000E7AD00000000000021A5390000000000FFFFFF00FFFF
      FF008429840000000000FF000000290000000000000000000000B51000000000
      0000A59C00000000000021A5390000000000FFFFFF00FFFFFF00632984000000
      0000000800002900000000000000000000000000000000000000000000000000
      0000000000008484840084848400FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6
      C600848484008484840000000000000000008C4A000000000000630810000000
      0000C608000000000000FFFFFF00FFFFFF0084B5940000000000AD0000002900
      000000000000000000001039000000000000421010000000000021DE8C000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00C600000031000000000000000000
      00006318000000000000630810000000000084EF7B0000000000C6529C000000
      0000FFFFFF00FFFFFF00CE000000310000000000000000000000DE1000000000
      0000001810000000000021A53900000000000000000000000000000000000000
      000000000000000000008484840084848400C6C6C600C6C6C600C6C6C6008484
      840000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000002900000000000000000000001839000000000000E7CE00000000
      00002152730000000000C600840000000000E7A59C00000000008C0000002900
      00000000000000000000AD6B000000000000A5D6000000000000E70084000000
      0000FFFFFF00FFFFFF00A5088400000000009400000029000000000000000000
      0000DE2100000000000084EF080000000000E700840000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF009C000000290000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484000000
      0000000000000000000000000000000000006BBDF7000000000073BDF7000000
      00007BBDF7000000000084BDF700000000008CBDF7000000000094BDF7000000
      00009CBDF70000000000A5BDF70000000000ADBDF70000000000B5BDF7000000
      0000BDBDF70000000000C6BDF70000000000CEBDF70000000000D6BDF7000000
      0000DEBDF70000000000E7BDF70000000000EFBDF70000000000F7BDF7000000
      0000FFBDF7000000000000C6F70000000000C6630000000000008C4A00000000
      000063EF7B0000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006BBDF7000000000073BDF7000000
      00007BBDF7000000000084BDF700000000008CBDF7000000000094BDF7000000
      00009CBDF70000000000A5BDF70000000000ADBDF70000000000B5BDF7000000
      0000BDBDF70000000000C6BDF70000000000CEBDF70000000000D6BDF7000000
      0000DEBDF70000000000E7BDF70000000000EFBDF70000000000F7BDF7000000
      0000FFBDF7000000000000BDF7000000000008BDF7000000000010BDF7000000
      000018BDF7000000000021BDF700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006BB5F7000000000073B5F7000000
      00007BB5F7000000000084B5F700000000008CB5F7000000000094B5F7000000
      00009CB5F70000000000A5B5F70000000000ADB5F70000000000B5B5F7000000
      0000BDB5F70000000000C6B5F70000000000CEB5F70000000000D6B5F7000000
      0000DEB5F70000000000E7B5F70000000000EFB5F70000000000F7B5F7000000
      0000FFB5F7000000000000BDF7000000000008BDF7000000000010BDF7000000
      000018BDF7000000000021BDF700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000000000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000848484008484840000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484000000000000FFFF000000000000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00848484000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      00008484840000000000FFFFFF008484840000000000FFFFFF0000FFFF000000
      000000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF0000000000FFFFFF000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00000000008484
      840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0084848400FFFFFF00848484000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF000000000000000000000000000000000000000000000000000000000000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF000000000000000000000000000000000084848400FFFFFF00000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      84008484840084848400000000008484840000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000FFFFFF000000
      000000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF0000000000000000000000000084848400FFFFFF00000000000000
      0000000000000000000084848400FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF0000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF000000000000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C60000FFFF00000000000000000084848400FFFFFF00000000000000
      0000000000000000000084848400FFFFFF008484840084848400848484008484
      84008484840084848400000000008484840000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000000000000000000084848400FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF0000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      000000000000000000000000000000000000000000008484840000000000FFFF
      FF00FFFFFF00FFFFFF0084848400FFFFFF008484840084848400848484008484
      8400848484008484840000000000848484000000000084848400000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400FFFFFF0000000000FFFFFF00FFFFFF000000
      000000000000FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF008484840084848400000000000000
      0000848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000008484
      8400000000000000000000000000000000008484840000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF000000000000000000000000000000
      000084848400FFFFFF0084848400000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF00EF7BFFFFFFFFFFFFEF7BFFFFEF7BFFFF
      EF7BFFFFEF7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFEF7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFEF7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF7BFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF7BFFFFFFFFFFFF0000
      E3FFFFFFFFFFEF7BC3FFFFFFFFFFFFFFC1FFFFFFFFFFFFFFC00FFFFFFFFFFFFF
      F003FFFFFFFFFFFFF803FFFFFFFFFFFFF803FFFFFFFFFFFFF803EF7BFFFFFFFF
      F803FFFFFFFFFFFFF803EF7BFFFFFFFFFC07FFFFFFFFFFFFFC0FFFFFFFFFFFFF
      FFFFFFFFEF7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC00F801FFFFFFFFF8010
      0000FFFFFFFF2FE00000E007FFFF17F40000C007C00F28000000C00780073002
      0000C00780033C800000C00780013C020000C00780015C808000C007800FA002
      8000C00F800FC098FC00E07F801FFC30FC01E07FC0FFFCF1FC03FFFFC0FFFC03
      FC07FFFFFFFFFC07FFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  DISTINCT  P.IDPESSOA , P.NOME'
      'FROM PESSOA P, PATRO PT'
      'WHERE P.IDPESSOA = PT.IDPESSOA'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 66
    Top = 282
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV,NOME '
      'FROM PLANPREV'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 12
    Top = 282
  end
  object qryContrib: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCONTRIBUICAO,NOME'
      'FROM CONTRIBUICAO'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 14
    Top = 330
  end
  object MontaSelectPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PATRO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'Inscrição Previdenciária'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PESSOA PATRO'
      'PLANPREV'
      'PARTASS')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'PESSOA.NOME')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.FLGDESATIVADO = 0'
      'PARTASS.IDPESSOA = PARTPREVPLAN.IDPESSOA'
      'PARTASS.IDPESSJUR = PARTPREVPLAN.IDPESSJUR'
      'PARTASS.IDPLANOPREV = PARTPREVPLAN.IDPLANOPREV'
      'PARTASS.SEQPROPOSTA = PARTPREVPLAN.SEQPROPOSTA'
      'PARTPREVPLAN.IDPESSJUR = PATRO.IDPESSOA'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      '( NVL(PARTASS.FLGINSCRICAOCANC,0) = 0 )')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '40'
      '10'
      '20'
      '20')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      '')
    Left = 296
    Top = 251
  end
  object qryDivergSintet: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SUM(H.VALORESPERADO) VALORESPERADO,'
      'SUM(H.VALORRECEBIDO) VALORRECEBIDO,'
      
        'C.NOME, C.NOME NOMECONTRIB, C.IDCONTRIBUICAO, PL.IDPLANOPREV, PL' +
        '.NOME PLANPREV,'
      'PLA.IDPLANASS, PLA.NOME PLANASS, H.IDCONTASS,'
      
        'PESSJUR.NOME PESSJUR, PESSJUR.IDPESSOA IDPESSJUR,  H.NUMRECEBIME' +
        'NTO'
      
        'FROM   CONTRIBUICAO C, SITPLANOPREV SP,  PLANPREV PL,CONTRIBASS ' +
        'CT,PARTASS PP, '
      'PESSOA PESSJUR, HSTCONTRIBASS H, PLANASS PLA'
      'WHERE  (H.MES = '#39'1999/10'#39' ) AND '
      '(H.SITRECEBIMENTO = 3) '
      'AND (H.IDTITULAR    = 1)'
      'AND (H.SEQPROPOSTA = 1)'
      'AND (H.IDPESSJUR   = 1)'
      'AND (H.IDPLANOPREV = 1)'
      'AND (H.IDTITULAR    = PP.IDPESSOA) '
      'AND (H.SEQPROPOSTA = PP.SEQPROPOSTA) '
      'AND (H.IDPESSJUR   = PP.IDPESSJUR) '
      'AND (H.IDPLANOPREV = PP.IDPLANOPREV) '
      'AND (H.IDPLANASS = PP.IDPLANASS)'
      'AND C.IDCONTRIBUICAO = CT.IDCONTASS '
      'AND C.IDCONTRIBUICAO = H.IDCONTASS  '
      'AND PP.IDPLANASS = CT.IDPLANASS '
      'AND (PP.IDSITPART  = SP.IDSITPLANOPREV) '
      'AND H.IDPESSJUR = PESSJUR.IDPESSOA '
      'AND H.IDPLANOPREV = PL.IDPLANOPREV '
      'AND H.IDPLANASS = PLA.IDPLANASS'
      'GROUP BY C.NOME, C.IDCONTRIBUICAO, PL.IDPLANOPREV, PL.NOME,'
      'PLA.IDPLANASS, PLA.NOME ,'
      
        'PESSJUR.NOME, PESSJUR.IDPESSOA, H.IDCONTASS ,PESSJUR.NOME, PESSJ' +
        'UR.IDPESSOA, H.IDCONTASS, H.NUMRECEBIMENTO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 54
    Top = 236
  end
  object dsDivergSintet: TwwDataSource
    DataSet = qryDivergSintet
    Left = 190
    Top = 76
  end
  object qryDivergAnalit: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT H.VALORESPERADO, H.VALORRECEBIDO,'
      ' C.NOME AS NOMECONTRIB,P.NOME AS NOMEPARTICIP, EL.MATRICULA,'
      ' PD.NOME AS NOMEDEP,'
      ' C.IDCONTRIBUICAO, CT.IDPLANASS,H.MES, H.MESCOBRANCA,'
      ' PP.IDPESSJUR,PP.IDPESSOA, PP.IDPLANASS,'
      ' H.CODDOCPREV CODDOCUMENTOPREV ,PPV.IDSITPART,'
      ' SIT.FLGINTERNO FLGSITPART,PL.NOME PLANPREV,'
      ' PESSJUR.NOME PESSJUR,H.IDMOTIVO, SP.DESCRICAO SITPLANOASS,'
      ' PLA.NOME PLANASS,SP.FLGINTERNO FLGSITPLANOASS,'
      ' PP.SEQPROPOSTA, H.DATA,'
      ' CT.IDPROVENTOATRASO IDRUBRICAATRASO,'
      ' CT.IDPROVENTODEVOL IDRUBRICADEVOLUC,'
      ' H.IDREGRA IDREGRACALCULO,'
      ' H.CODDOCPREV CODDOCUMENTOPREV,'
      ' H.PLNCODPREV PLNCODIGOPREV,H.IDTITULAR, H.IDDEPENDENTE,'
      ' H.IDCONTASS, H.FLGCOBCARNE, H.IDPLANOPREV, H.NUMRECEBIMENTO'
      'FROM SITPART SIT,SITPLANOPREV SP,PLANPREV PL, PLANASS PLA,'
      ' CONTRIBUICAO C,CONTRIBASS CT,PARTASS PP,PARTPREVPLAN PPV,'
      
        ' ELEGPATRO EL, PESSOA P, PESSOA PESSJUR, HSTCONTRIBASS H, PESSOA' +
        ' PD'
      'WHERE  (H.MES = '#39'1999/10'#39' )'
      ' AND (H.SITRECEBIMENTO = 3) '
      ' AND (H.IDTITULAR    =  1)'
      ' AND (H.SEQPROPOSTA = 1)'
      ' AND (H.IDPESSJUR   = 1)'
      ' AND (H.IDPLANOPREV = 1)'
      ' AND (H.IDPLANASS = 1)'
      ' AND (H.IDTITULAR    = PP.IDPESSOA)'
      ' AND (H.SEQPROPOSTA = PP.SEQPROPOSTA)'
      ' AND (H.IDPESSJUR   = PP.IDPESSJUR)'
      ' AND (H.IDPLANOPREV = PP.IDPLANOPREV)'
      ' AND (H.IDTITULAR    = PPV.IDPESSOA)'
      ' AND (H.IDDEPENDENTE = PD.IDPESSOA)'
      ' AND (H.SEQPROPOSTA = PPV.SEQPROPOSTA)'
      ' AND (H.IDPESSJUR   = PPV.IDPESSJUR)'
      ' AND (H.IDPLANOPREV = PPV.IDPLANOPREV)'
      ' AND (H.IDPLANASS = PP.IDPLANASS) '
      ' AND (EL.IDPESSOA  = PP.IDPESSOA)'
      ' AND (EL.IDPESSJUR = PP.IDPESSJUR)'
      ' AND (C.IDCONTRIBUICAO = CT.IDCONTASS)'
      ' AND (C.IDCONTRIBUICAO = H.IDCONTASS)'
      ' AND (PP.IDPLANASS = CT.IDPLANASS)'
      ' AND (P.IDPESSOA = PP.IDPESSOA)'
      ' AND (H.IDPESSJUR = PESSJUR.IDPESSOA)'
      ' AND (H.IDPLANOPREV = PL.IDPLANOPREV)'
      ' AND (H.IDPLANASS = PLA.IDPLANASS)'
      ' AND (PP.IDSITPART = SP.IDSITPLANOPREV)'
      ' AND (PPV.IDSITPART = SIT.IDSITPART)'
      'ORDER BY P.NOME, C.NOME'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 54
    Top = 181
    object qryDivergAnalitNOMEPARTICIP: TStringField
      DisplayLabel = 'Participante'
      DisplayWidth = 40
      FieldName = 'NOMEPARTICIP'
      Origin = '"CM.PESSOA".NOME'
      Size = 60
    end
    object qryDivergAnalitVALORESPERADO: TFloatField
      DisplayLabel = 'Valor esperado'
      DisplayWidth = 10
      FieldName = 'VALORESPERADO'
      Origin = '"CM.HSTCONTRIBASS".VALORESPERADO'
    end
    object qryDivergAnalitVALORRECEBIDO: TFloatField
      DisplayLabel = 'Valor recebido'
      DisplayWidth = 10
      FieldName = 'VALORRECEBIDO'
      Origin = '"CM.HSTCONTRIBASS".VALORRECEBIDO'
    end
    object qryDivergAnalitMES: TStringField
      DisplayLabel = 'Mês'
      DisplayWidth = 7
      FieldName = 'MES'
      Origin = '"CM.HSTCONTRIBASS".MES'
      Size = 7
    end
    object qryDivergAnalitMESCOBRANCA: TStringField
      DisplayLabel = 'Mês cobrança'
      DisplayWidth = 7
      FieldName = 'MESCOBRANCA'
      Origin = '"CM.HSTCONTRIBASS".MESCOBRANCA'
      Size = 7
    end
    object qryDivergAnalitNOMECONTRIB: TStringField
      DisplayLabel = 'Contribuição'
      DisplayWidth = 40
      FieldName = 'NOMECONTRIB'
      Origin = '"CM.CONTRIBUICAO".NOME'
      Size = 60
    end
    object qryDivergAnalitMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 13
      FieldName = 'MATRICULA'
      Origin = '"CM.ELEGPATRO".MATRICULA'
      Size = 13
    end
    object qryDivergAnalitNOMEDEP: TStringField
      DisplayLabel = 'Beneficiário Assistencial'
      DisplayWidth = 40
      FieldName = 'NOMEDEP'
      Origin = '"CM.PESSOA".NOME'
      Size = 60
    end
    object qryDivergAnalitPESSJUR: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 40
      FieldName = 'PESSJUR'
      Origin = '"CM.PESSOA".NOME'
      Size = 60
    end
    object qryDivergAnalitPLANASS: TStringField
      DisplayLabel = 'Plano Assistencial'
      DisplayWidth = 40
      FieldName = 'PLANASS'
      Origin = '"CM.PLANASS".NOME'
      Size = 40
    end
    object qryDivergAnalitPLANPREV: TStringField
      DisplayLabel = 'Plano previdenciário'
      DisplayWidth = 30
      FieldName = 'PLANPREV'
      Origin = '"CM.PLANPREV".NOME'
      Size = 50
    end
    object qryDivergAnalitDATA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 18
      FieldName = 'DATA'
      Origin = '"CM.HSTCONTRIBASS".DATA'
    end
    object qryDivergAnalitIDCONTRIBUICAO: TFloatField
      FieldName = 'IDCONTRIBUICAO'
      Origin = '"CM.CONTRIBUICAO".IDCONTRIBUICAO'
      Visible = False
    end
    object qryDivergAnalitIDPLANASS: TFloatField
      FieldName = 'IDPLANASS'
      Origin = '"CM.CONTRIBASS".IDPLANASS'
      Visible = False
    end
    object qryDivergAnalitIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = '"CM.PARTASS".IDPESSJUR'
      Visible = False
    end
    object qryDivergAnalitIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.PARTASS".IDPESSOA'
      Visible = False
    end
    object qryDivergAnalitIDPLANASS_1: TFloatField
      FieldName = 'IDPLANASS_1'
      Origin = '"CM.PARTASS".IDPLANASS'
      Visible = False
    end
    object qryDivergAnalitCODDOCUMENTOPREV: TFloatField
      FieldName = 'CODDOCUMENTOPREV'
      Origin = '"CM.HSTCONTRIBASS".CODDOCPREV'
      Visible = False
    end
    object qryDivergAnalitIDSITPART: TFloatField
      FieldName = 'IDSITPART'
      Origin = '"CM.PARTPREVPLAN".IDSITPART'
      Visible = False
    end
    object qryDivergAnalitFLGSITPART: TStringField
      FieldName = 'FLGSITPART'
      Origin = '"CM.SITPART".FLGINTERNO'
      Visible = False
      Size = 2
    end
    object qryDivergAnalitIDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
      Origin = '"CM.HSTCONTRIBASS".IDMOTIVO'
      Visible = False
    end
    object qryDivergAnalitSITPLANOASS: TStringField
      FieldName = 'SITPLANOASS'
      Origin = '"CM.SITPLANOPREV".DESCRICAO'
      Visible = False
      Size = 50
    end
    object qryDivergAnalitFLGSITPLANOASS: TStringField
      FieldName = 'FLGSITPLANOASS'
      Origin = '"CM.SITPLANOPREV".FLGINTERNO'
      Visible = False
      Size = 2
    end
    object qryDivergAnalitSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
      Origin = '"CM.PARTASS".SEQPROPOSTA'
      Visible = False
    end
    object qryDivergAnalitIDRUBRICAATRASO: TFloatField
      FieldName = 'IDRUBRICAATRASO'
      Origin = '"CM.CONTRIBASS".IDPROVENTOATRASO'
      Visible = False
    end
    object qryDivergAnalitIDRUBRICADEVOLUC: TFloatField
      FieldName = 'IDRUBRICADEVOLUC'
      Origin = '"CM.CONTRIBASS".IDPROVENTODEVOL'
      Visible = False
    end
    object qryDivergAnalitIDREGRACALCULO: TFloatField
      FieldName = 'IDREGRACALCULO'
      Origin = '"CM.HSTCONTRIBASS".IDREGRA'
      Visible = False
    end
    object qryDivergAnalitCODDOCUMENTOPREV_1: TFloatField
      FieldName = 'CODDOCUMENTOPREV_1'
      Origin = '"CM.HSTCONTRIBASS".CODDOCPREV'
      Visible = False
    end
    object qryDivergAnalitPLNCODIGOPREV: TFloatField
      FieldName = 'PLNCODIGOPREV'
      Origin = '"CM.HSTCONTRIBASS".PLNCODPREV'
      Visible = False
    end
    object qryDivergAnalitIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Origin = '"CM.HSTCONTRIBASS".IDTITULAR'
      Visible = False
    end
    object qryDivergAnalitIDDEPENDENTE: TFloatField
      FieldName = 'IDDEPENDENTE'
      Origin = '"CM.HSTCONTRIBASS".IDDEPENDENTE'
      Visible = False
    end
    object qryDivergAnalitIDCONTASS: TFloatField
      FieldName = 'IDCONTASS'
      Origin = '"CM.HSTCONTRIBASS".IDCONTASS'
      Visible = False
    end
    object qryDivergAnalitFLGCOBCARNE: TFloatField
      FieldName = 'FLGCOBCARNE'
      Origin = '"CM.HSTCONTRIBASS".FLGCOBCARNE'
      Visible = False
    end
    object qryDivergAnalitIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = '"CM.HSTCONTRIBASS".IDPLANOPREV'
      Visible = False
    end
  end
  object dsDivergAnalit: TwwDataSource
    DataSet = qryDivergAnalit
    Left = 22
    Top = 118
  end
  object pmnu: TPopupMenu
    OnPopup = pmnuPopup
    Left = 740
    Top = 106
    object ParmetrosPadro1: TMenuItem
      Caption = 'Parâmetros Padrão'
      OnClick = ParmetrosPadro1Click
    end
    object DadosdoParticipante1: TMenuItem
      Caption = 'Dados do Participante'
      OnClick = DadosdoParticipante1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Titulo1: TMenuItem
      Caption = 'Titulo'
      Enabled = False
    end
    object pmnuCobraProx: TMenuItem
      Caption = 'Cobrar Diferença no Próximo Mês'
      OnClick = pmnuCobraProxClick
    end
    object pmnuCobraImed: TMenuItem
      Caption = 'Cobrar Diferença Imediatamente'
      Enabled = False
      OnClick = pmnuCobraImedClick
    end
    object pmnuDevolveProx: TMenuItem
      Caption = 'Devolver Diferença no Próximo Mês'
      OnClick = pmnuDevolveProxClick
    end
    object pmnuDevolveImed: TMenuItem
      Caption = 'Devolver Diferença Imediatamente'
      Enabled = False
      OnClick = pmnuDevolveImedClick
    end
    object pmnuDevolveIgnora: TMenuItem
      Caption = 'Ignorar Diferença'
      OnClick = pmnuDevolveIgnoraClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object Marcardesmarcardiverdncia1: TMenuItem
      Caption = 'Marcar/desmarcar divergência   (Shift+Click)'
      OnClick = Marcardesmarcardiverdncia1Click
    end
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Salvar cálculo de contribuições'
    Left = 531
    Top = 65533
  end
  object qryparam: TwwQuery
    BeforeOpen = qryparamBeforeOpen
    AfterOpen = qryparamAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCONTASS,PLANASS.IDPLANASS,'
      'VLRACEITADIVERG,'
      'PLANASS.NOME PLANASS '
      'FROM CONTRIBASS, PLANASS'
      'WHERE CONTRIBASS.IDPLANASS = PLANASS.IDPLANASS'
      'AND CONTRIBASS.IDCONTASS = :IDCONT'
      'AND CONTRIBASS.IDPLANASS = :IDPLANO')
    ValidateWithMask = True
    Left = 450
    Top = 173
    ParamData = <
      item
        DataType = ftString
        Name = 'IDCONT'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPLANO'
        ParamType = ptUnknown
      end>
  end
  object dsparam: TwwDataSource
    AutoEdit = False
    DataSet = qryparam
    Left = 90
    Top = 381
  end
  object qryaux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 173
    Top = 165
  end
  object qrybusca: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 126
    Top = 180
  end
  object RegCalculo: TRegra
    QueryIn = qryatraso
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 394
    Top = 53
  end
  object qryexecuta: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 325
    Top = 153
  end
  object qryatraso: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 515
    Top = 155
  end
  object qryalterador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLANO,PLACONTA, RECPAG, RECPAG, '
      '                         CODCENTROCUSTO,IDPESSOA, IDEMPRESA'
      '                         FROM TIPOALTERADOR '
      '                         WHERE CODALTERADOR =  :codalterador')
    ValidateWithMask = True
    Left = 125
    Top = 277
    ParamData = <
      item
        DataType = ftString
        Name = 'codalterador'
        ParamType = ptUnknown
      end>
  end
  object qryDivergSintetAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 474
    Top = 65533
  end
  object qryalteradorxcontrib: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsparam
    SQL.Strings = (
      'SELECT AXC.IDPLANASS, AXC.IDCONTRIBUICAO, TA.CODALTERADOR,'
      '               IDREGRACALCULO, FLGCOBRA, FLGATRASO,'
      '               FLGDEVOL, R.NOMEREGRA, TA.DESCRICAO,'
      '               PA.NOME NOMEPLANASS, C.NOME NOMECONTRIB'
      'FROM ALTERXCONTRIBASS AXC, REGRA R, TIPOALTERADOR TA,'
      '           PLANASS PA, CONTRIBUICAO C'
      'WHERE (AXC.IDREGRACALCULO = R.IDREGRA)'
      '      AND (AXC.IDPLANASS = :IDPLANASS)'
      '      AND (AXC.IDCONTRIBUICAO = :IDCONTASS)'
      '      AND (TA.CODALTERADOR = AXC.CODALTERADOR)'
      '      AND (AXC.IDPLANASS = PA.IDPLANASS)'
      '      AND (AXC.IDCONTRIBUICAO = C.IDCONTRIBUICAO)')
    ControlType.Strings = (
      'FLGCOBRA;CheckBox;1;0'
      'FLGATRASO;CheckBox;1;0'
      'FLGDEVOL;CheckBox;1;0')
    ValidateWithMask = True
    Left = 429
    Top = 240
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPLANASS'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDCONTASS'
        ParamType = ptUnknown
      end>
  end
  object dsalteradorxcontrib: TwwDataSource
    AutoEdit = False
    DataSet = qryalteradorxcontrib
    Left = 533
    Top = 232
  end
  object qryaltaux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 402
    Top = 65533
  end
  object qrycontribaux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 125
    Top = 133
  end
  object qryplanass: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANASS, NOME'
      'FROM PLANASS')
    ValidateWithMask = True
    Left = 15
    Top = 381
  end
  object qry2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLANO,PLACONTA, RECPAG, RECPAG, '
      '                         CODCENTROCUSTO,IDPESSOA, IDEMPRESA'
      '                         FROM TIPOALTERADOR '
      '                         WHERE CODALTERADOR =  :codalterador')
    ValidateWithMask = True
    Left = 149
    Top = 333
    ParamData = <
      item
        DataType = ftString
        Name = 'codalterador'
        ParamType = ptUnknown
      end>
  end
  object mnuprinc: TMainMenu
    Left = 66
    Top = 117
    object GerarContribuies1: TMenuItem
      Caption = '&Tratamento de Divergências'
      object ParmetrosPadro2: TMenuItem
        Caption = '&Parâmetros Padrão'
        Enabled = False
        OnClick = ParmetrosPadro1Click
      end
      object DadosdoParticipante2: TMenuItem
        Caption = '&Dados do Participante'
        Enabled = False
        OnClick = DadosdoParticipante1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object CobrarDiferenanoProximoMs1: TMenuItem
        Caption = '&Cobrar Diferença no Próximo Mês'
        Enabled = False
        OnClick = pmnuCobraProxClick
      end
      object CobrarDiferenaImediatamente1: TMenuItem
        Caption = 'C&obrar Diferença Imediatamente'
        Enabled = False
        OnClick = pmnuCobraImedClick
      end
      object DevolverDiferenanoPrximoMs1: TMenuItem
        Caption = 'De&volver Diferença no Próximo Mês'
        Enabled = False
        OnClick = pmnuDevolveProxClick
      end
      object DevolverDiferenaImediatamente1: TMenuItem
        Caption = 'Devolver Diferença &Imediatamente'
        Enabled = False
        OnClick = pmnuDevolveImedClick
      end
      object IgnorarDiferena1: TMenuItem
        Caption = 'I&gnorar Diferença'
        Enabled = False
        OnClick = pmnuDevolveIgnoraClick
      end
    end
  end
end
