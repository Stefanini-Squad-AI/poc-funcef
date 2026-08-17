inherited frmCadProcesso: TfrmCadProcesso
  Left = 18
  Top = 66
  HelpContext = 1100013
  Caption = 'Processo Previdenciário'
  ClientHeight = 467
  ClientWidth = 752
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 752
    Height = 381
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 744
      object Label1: TLabel
        Left = 6
        Top = 3
        Width = 83
        Height = 13
        Caption = 'Nosso Número'
        FocusControl = dbedNumero
      end
      object Label2: TLabel
        Left = 6
        Top = 51
        Width = 100
        Height = 13
        Caption = 'Data Ajuizamento'
      end
      object Label19: TLabel
        Left = 114
        Top = 51
        Width = 93
        Height = 13
        Caption = 'Data da Citação'
      end
      object Label30: TLabel
        Left = 217
        Top = 1
        Width = 118
        Height = 13
        Caption = 'Número do Processo'
        FocusControl = dbedNumJCJ
      end
      object dbedNumero: TDBEdit
        Left = 6
        Top = 18
        Width = 100
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'NUMPROCTRAB'
        DataSource = ds
        ReadOnly = True
        TabOrder = 0
      end
      object dbedDataAju: TCMDateTimePicker
        Left = 6
        Top = 66
        Width = 100
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAJUIZO'
        DataSource = ds
        Epoch = 1950
        ButtonGlyph.Data = {
          06050000424D06050000000000003604000028000000100000000D0000000100
          080000000000D000000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
          000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
          A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
          FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
          04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
          000000000000000000FF}
        ShowButton = True
        TabOrder = 4
      end
      object dbedDataNot: TCMDateTimePicker
        Left = 114
        Top = 66
        Width = 100
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATANOTIF'
        DataSource = ds
        Epoch = 1950
        ButtonGlyph.Data = {
          06050000424D06050000000000003604000028000000100000000D0000000100
          080000000000D000000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
          000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
          A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
          FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
          04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
          000000000000000000FF}
        ShowButton = True
        TabOrder = 5
      end
      object dbrgMateria: TDBRadioGroup
        Left = 306
        Top = 39
        Width = 101
        Height = 50
        Caption = 'Matéria'
        DataField = 'INDMATERIA'
        DataSource = ds
        Items.Strings = (
          'Previdenc.'
          'Previd/Trab')
        TabOrder = 7
        Values.Strings = (
          '2'
          '3')
        OnClick = rgSituacaoClick
      end
      object rgSituacao: TDBRadioGroup
        Left = 112
        Top = 1
        Width = 100
        Height = 49
        Caption = 'Situação'
        DataField = 'FLGSITPROC'
        DataSource = ds
        Items.Strings = (
          'Aberto'
          'Encerrado')
        TabOrder = 1
        Values.Strings = (
          '0'
          '1')
        OnClick = rgSituacaoClick
      end
      object dbedNumJCJ: TDBEdit
        Left = 217
        Top = 16
        Width = 190
        Height = 21
        DataField = 'PROCJCJNUM'
        DataSource = ds
        TabOrder = 2
        OnExit = dbedNumJCJExit
      end
      object rgAtivo: TDBRadioGroup
        Left = 217
        Top = 39
        Width = 86
        Height = 50
        Caption = 'Somos Parte'
        DataField = 'FLGPARTEATIVA'
        DataSource = ds
        Items.Strings = (
          'Passiva'
          'Ativa')
        TabOrder = 6
        Values.Strings = (
          '0'
          '1')
      end
      object gbxRequerente: TGroupBox
        Left = 414
        Top = 2
        Width = 321
        Height = 41
        Caption = 'Contraparte'
        TabOrder = 3
        object edNomeRequerente: TEdit
          Left = 6
          Top = 13
          Width = 280
          Height = 21
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
      object gbxSitReq: TGroupBox
        Left = 416
        Top = 43
        Width = 321
        Height = 45
        Caption = 'Situação da Contraparte'
        TabOrder = 8
        object lblSitReq: TLabel
          Left = 10
          Top = 19
          Width = 40
          Height = 13
          Caption = 'Normal'
        end
        object dblcMotivoReq: TwwDBLookupCombo
          Left = 72
          Top = 16
          Width = 241
          Height = 21
          DropDownAlignment = taRightJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'DESCRICAO'#9'F')
          DataField = 'IDMOTIVO'
          DataSource = ds
          LookupTable = qryMotivo
          LookupField = 'IDMOTIVO'
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          OnChange = dblcMotivoReqChange
        end
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 102
      Width = 744
      Height = 275
      Tabs.Strings = (
        'Contraparte'
        'Litisconsortes'
        'OutrosDados'
        'Objetos do Processo'
        'Etapas'
        'Vinculações'
        'Encerramento')
      detdbGrids.Strings = (
        ''
        'dbgrDet2'
        ''
        'dbgrdDet'
        'dbGrdEtapa'
        ''
        ''
        ' ')
      inherited pgctrlDetalhe: TPageControl
        Width = 646
        Height = 216
        ActivePage = tbshReclamante
        object tbshReclamante: TTabSheet [0]
          Caption = 'Contraparte'
          object Label40: TLabel
            Left = 174
            Top = 10
            Width = 33
            Height = 13
            Caption = 'Plano'
          end
          object Label32: TLabel
            Left = 174
            Top = 43
            Width = 53
            Height = 13
            Caption = 'Inscrição'
          end
          object Label23: TLabel
            Left = 174
            Top = 76
            Width = 80
            Height = 13
            Caption = 'Patrocinadora'
          end
          object Label9: TLabel
            Left = 174
            Top = 110
            Width = 73
            Height = 13
            Caption = 'Último Cargo'
          end
          object Label10: TLabel
            Left = 174
            Top = 141
            Width = 79
            Height = 13
            Caption = 'Último Salário'
          end
          object Label11: TLabel
            Left = 174
            Top = 176
            Width = 54
            Height = 13
            Caption = 'Admissão'
          end
          object Label12: TLabel
            Left = 399
            Top = 175
            Width = 55
            Height = 13
            Caption = 'Demissão'
          end
          object Label49: TLabel
            Left = 430
            Top = 43
            Width = 28
            Height = 13
            Caption = 'Data'
          end
          object dbedPlano: TDBEdit
            Left = 295
            Top = 7
            Width = 259
            Height = 21
            TabStop = False
            Color = clGray
            DataField = 'PLANO'
            DataSource = ds5
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object dbedInscNum: TDBEdit
            Left = 295
            Top = 40
            Width = 90
            Height = 21
            TabStop = False
            Color = clGray
            DataField = 'INSCRICAONUMERO'
            DataSource = ds5
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object dbedInscData: TDBEdit
            Left = 463
            Top = 40
            Width = 90
            Height = 21
            TabStop = False
            Color = clGray
            DataField = 'INSCRICAODATA'
            DataSource = ds5
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object dbedPatro: TDBEdit
            Left = 295
            Top = 73
            Width = 259
            Height = 21
            TabStop = False
            Color = clGray
            DataField = 'PATROC'
            DataSource = ds5
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object dbedCargoI: TDBEdit
            Left = 295
            Top = 107
            Width = 259
            Height = 21
            TabStop = False
            Color = clGray
            DataField = 'TITULO'
            DataSource = ds5
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object dbedSalAtual: TDBEdit
            Left = 295
            Top = 139
            Width = 90
            Height = 21
            TabStop = False
            Color = clGray
            DataField = 'SALPARTICIPACAO'
            DataSource = ds5
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object dbedAdm: TDBEdit
            Left = 295
            Top = 171
            Width = 90
            Height = 21
            TabStop = False
            Color = clGray
            DataField = 'DATAADMISSAO'
            DataSource = ds5
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
          end
          object dbedDem: TDBEdit
            Left = 463
            Top = 171
            Width = 90
            Height = 21
            TabStop = False
            Color = clGray
            DataField = 'DATADEMISSAO'
            DataSource = ds5
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
          end
        end
        object tbsLitisconsortes: TTabSheet [1]
          Caption = 'Litisconsortes'
          object pnlDet2: TPanel
            Left = 0
            Top = 0
            Width = 638
            Height = 188
            Align = alClient
            TabOrder = 0
            object gbxLitisconsorte: TGroupBox
              Left = 215
              Top = 44
              Width = 400
              Height = 44
              Caption = 'Litisconsorte ou Testemunha'
              TabOrder = 0
              object spbtnProcLitisconsorte: TSpeedButton
                Left = 367
                Top = 13
                Width = 25
                Height = 24
                Hint = 'Procura Litisconsorte por qualquer Tipo de Documento'
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
                ParentShowHint = False
                ShowHint = True
                OnClick = bbtnProcRequerenteClick
              end
              object edLitisconsorte: TEdit
                Left = 9
                Top = 15
                Width = 352
                Height = 21
                Color = clGray
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
            end
            object gbxSitLitis: TGroupBox
              Left = 215
              Top = 110
              Width = 400
              Height = 44
              Caption = 'Situação do Litisconsorte ou Testemunha'
              TabOrder = 1
              object lblSitLit: TLabel
                Left = 10
                Top = 18
                Width = 40
                Height = 13
                Caption = 'Normal'
              end
              object dblcMotivoLit: TwwDBLookupCombo
                Left = 72
                Top = 15
                Width = 320
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'50'#9'DESCRICAO'#9'F')
                DataField = 'IDMOTIVO'
                DataSource = dsDet2
                LookupTable = qryMotivo
                LookupField = 'IDMOTIVO'
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                OnChange = dblcMotivoLitChange
              end
            end
            object dbrgCategoria: TDBRadioGroup
              Left = 16
              Top = 11
              Width = 185
              Height = 160
              Caption = 'Categoria'
              DataField = 'INDTESTEMUNHA'
              DataSource = dsDet2
              Items.Strings = (
                'Litisconsorte Contraparte'
                'Nossa Litisconsorte'
                'Testemunha Contraparte'
                'Nossa Testemunha')
              TabOrder = 2
              Values.Strings = (
                '0'
                '3'
                '1'
                '2')
            end
          end
          object dbgrDet2: TwwDBGrid
            Left = 0
            Top = 0
            Width = 638
            Height = 188
            Selected.Strings = (
              'NOME'#9'50'#9'Nome'
              'SITUACAO'#9'30'#9'Situação'
              'CATEGORIA'#9'22'#9'Categoria')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDet2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
        object tbshOutrosDados: TTabSheet [2]
          Caption = 'OutrosDados'
          object pgCtrlOutrosDados: TPageControl
            Left = 0
            Top = 0
            Width = 638
            Height = 188
            ActivePage = tbshTipos
            Align = alClient
            TabOrder = 0
            object tbshTipos: TTabSheet
              Caption = 'Tipo e Localização'
              object Label3: TLabel
                Left = 40
                Top = 9
                Width = 105
                Height = 13
                Caption = 'Data da Postagem'
              end
              object Label16: TLabel
                Left = 216
                Top = 9
                Width = 109
                Height = 13
                Caption = 'Número na 2a Inst.'
                FocusControl = dbedNumTRT
              end
              object Label18: TLabel
                Left = 39
                Top = 51
                Width = 115
                Height = 13
                Caption = 'Quant. Requerentes'
                FocusControl = dbedQtde
              end
              object Label17: TLabel
                Left = 216
                Top = 51
                Width = 121
                Height = 13
                Caption = 'Número na Inst. Sup.'
                FocusControl = dbedNumTST
              end
              object Label31: TLabel
                Left = 39
                Top = 93
                Width = 100
                Height = 13
                Caption = 'Tipo de Processo'
              end
              object Label33: TLabel
                Left = 383
                Top = 94
                Width = 77
                Height = 13
                Caption = 'Tipo de Açao'
              end
              object Label35: TLabel
                Left = 39
                Top = 154
                Width = 267
                Height = 13
                Caption = 'Pasta do Processo (Identificação/Localização)'
                FocusControl = dbedPasta
              end
              object Label36: TLabel
                Left = 383
                Top = 154
                Width = 175
                Height = 13
                Caption = 'Cidade Onde Corre o Processo'
              end
              object Label21: TLabel
                Left = 653
                Top = 153
                Width = 17
                Height = 13
                Caption = 'UF'
              end
              object Label4: TLabel
                Left = 383
                Top = 11
                Width = 176
                Height = 13
                Caption = 'Órgão Jurisdicional (Vara) e Nº'
              end
              object Label13: TLabel
                Left = 383
                Top = 51
                Width = 47
                Height = 13
                Caption = 'Tribunal'
              end
              object dbedPost: TCMDateTimePicker
                Left = 40
                Top = 24
                Width = 120
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAPOST'
                DataSource = ds
                Epoch = 1950
                ButtonGlyph.Data = {
                  06050000424D06050000000000003604000028000000100000000D0000000100
                  080000000000D000000000000000000000000001000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                  A6000020400000206000002080000020A0000020C0000020E000004000000040
                  20000040400000406000004080000040A0000040C0000040E000006000000060
                  20000060400000606000006080000060A0000060C0000060E000008000000080
                  20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                  200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                  200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                  200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                  20004000400040006000400080004000A0004000C0004000E000402000004020
                  20004020400040206000402080004020A0004020C0004020E000404000004040
                  20004040400040406000404080004040A0004040C0004040E000406000004060
                  20004060400040606000406080004060A0004060C0004060E000408000004080
                  20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                  200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                  200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                  200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                  20008000400080006000800080008000A0008000C0008000E000802000008020
                  20008020400080206000802080008020A0008020C0008020E000804000008040
                  20008040400080406000804080008040A0008040C0008040E000806000008060
                  20008060400080606000806080008060A0008060C0008060E000808000008080
                  20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                  200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                  200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                  200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                  2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                  2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                  2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                  2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                  2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                  2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                  2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                  000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                  A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                  FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                  04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                  000000000000000000FF}
                ShowButton = True
                TabOrder = 0
              end
              object dbedNumTRT: TDBEdit
                Left = 216
                Top = 24
                Width = 120
                Height = 21
                DataField = 'PROCTRTNUM'
                DataSource = ds
                TabOrder = 1
              end
              object dbedQtde: TDBEdit
                Left = 39
                Top = 66
                Width = 120
                Height = 21
                DataField = 'QTDERECTES'
                DataSource = ds
                TabOrder = 4
              end
              object dbedNumTST: TDBEdit
                Left = 216
                Top = 66
                Width = 120
                Height = 21
                DataField = 'PROCTSTNUM'
                DataSource = ds
                TabOrder = 5
              end
              object dblcTipProc: TwwDBLookupCombo
                Left = 39
                Top = 108
                Width = 300
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOMETIPOPROC'#9'60'#9'Tipo de Processo')
                DataField = 'IDTIPOPROC'
                DataSource = ds
                LookupTable = qryTipoProc
                LookupField = 'IDTIPOPROC'
                TabOrder = 7
                AutoDropDown = True
                ShowButton = True
                SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
                AllowClearKey = True
              end
              object dblcTipAcao: TwwDBLookupCombo
                Left = 383
                Top = 109
                Width = 300
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'40'#9'DESCRICAO')
                DataField = 'IDTIPOACAO'
                DataSource = ds
                LookupTable = qryTipAcao
                LookupField = 'IDTIPOACAO'
                TabOrder = 8
                AutoDropDown = True
                ShowButton = True
                SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
                AllowClearKey = True
              end
              object dbedPasta: TDBEdit
                Left = 39
                Top = 169
                Width = 300
                Height = 21
                DataField = 'IDENTPASTA'
                DataSource = ds
                TabOrder = 9
              end
              object ProcuraCidade: TCMProcura
                Left = 382
                Top = 166
                Width = 268
                Height = 27
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                MostraMensagens = True
                Mensagens.EmBranco = 'Chave não pode estar em branco'
                Mensagens.NaoExiste = 'Chave não existe'
                PermiteChaveInvalida = False
                PermiteChaveEmBranco = False
                OnValidaDados = ProcuraCidadeValidaDados
                DataSource = ds
                DataField = 'IDCIDADES'
                LookupChave = 'IDCIDADES'
                LookupDescricao = 'NOME'
                MontaSelect = MontaSelectCidade
                LookupTabela = 'CM.CIDADES'
                DataBaseName = 'BaseDados'
                ReadOnly = False
              end
              object edUF: TwwDBEdit
                Left = 653
                Top = 166
                Width = 27
                Height = 21
                DataField = 'CODESTADO'
                DataSource = dsUF
                TabOrder = 11
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dblckVara: TwwDBLookupCombo
                Left = 383
                Top = 26
                Width = 266
                Height = 21
                DropDownAlignment = taRightJustify
                Selected.Strings = (
                  'DESCRICAO'#9'40'#9'DESCRICAO')
                DataField = 'IDVARAJUSTICA'
                DataSource = ds
                LookupTable = qryVara
                LookupField = 'IDVARAJUSTICA'
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
                AllowClearKey = True
              end
              object dbedNumVara: TwwDBEdit
                Left = 649
                Top = 26
                Width = 27
                Height = 21
                DataField = 'NumVaraJustica'
                DataSource = ds
                TabOrder = 3
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
              object dblcTRT: TwwDBLookupCombo
                Left = 383
                Top = 66
                Width = 300
                Height = 21
                BiDiMode = bdLeftToRight
                ParentBiDiMode = False
                DropDownAlignment = taRightJustify
                Selected.Strings = (
                  'DESCRICAO'#9'40'#9'DESCRICAO')
                DataField = 'CODIGOTRT'
                DataSource = ds
                LookupTable = qryTRT
                LookupField = 'CODIGOTRT'
                Options = [loColLines, loTitles]
                TabOrder = 6
                AutoDropDown = True
                ShowButton = True
                SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
                OrderByDisplay = False
                AllowClearKey = True
              end
            end
            object tbshAdvogados: TTabSheet
              Caption = 'Advogados e Assistente'
              object Label34: TLabel
                Left = 367
                Top = 127
                Width = 102
                Height = 13
                Caption = 'Advogado Interno'
              end
              object CMProcuraAdv1: TCMProcuraSubTipo
                Left = 26
                Top = 27
                Width = 300
                Height = 50
                Caption = 'Escritório/Advogado da Contraparte'
                TabOrder = 0
                CampoEdit = ceRazaoSocial
                MostraMensagens = True
                DataSource = ds
                DataField = 'IDADVOGRECTE'
                Mensagens.EmBranco = 'Chave não pode estar em branco'
                Mensagens.NaoExiste = 'Chave não existe'
                PermiteChaveInvalida = False
                PermiteChaveEmBranco = False
                SubTipo = stFornecedor
                FiltraSubTipo = True
              end
              object CMProcuraAdv2: TCMProcuraSubTipo
                Left = 367
                Top = 27
                Width = 300
                Height = 50
                Caption = 'Nosso Escritório/Advogado'
                TabOrder = 1
                CampoEdit = ceRazaoSocial
                MostraMensagens = True
                DataSource = ds
                DataField = 'IDADVOGRECDA'
                Mensagens.EmBranco = 'Chave não pode estar em branco'
                Mensagens.NaoExiste = 'Chave não existe'
                PermiteChaveInvalida = False
                PermiteChaveEmBranco = False
                SubTipo = stFornecedor
                FiltraSubTipo = True
              end
              object CMProcuraAssist: TCMProcuraSubTipo
                Left = 26
                Top = 120
                Width = 300
                Height = 50
                Caption = 'Assistente Técnico'
                TabOrder = 2
                CampoEdit = ceRazaoSocial
                MostraMensagens = True
                DataSource = ds
                DataField = 'IDASSISTTECN'
                Mensagens.EmBranco = 'Chave não pode estar em branco'
                Mensagens.NaoExiste = 'Chave não existe'
                PermiteChaveInvalida = False
                PermiteChaveEmBranco = False
                SubTipo = stFornecedor
                FiltraSubTipo = True
              end
              object dblcAdvCasa: TwwDBLookupCombo
                Left = 367
                Top = 141
                Width = 300
                Height = 21
                DropDownAlignment = taRightJustify
                Selected.Strings = (
                  'NOME'#9'60'#9'NOME')
                DataField = 'IDADVOGCASA'
                DataSource = ds
                LookupTable = qryAdvCasa
                LookupField = 'IDUSUARIO'
                TabOrder = 3
                AutoDropDown = True
                ShowButton = True
                SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
                AllowClearKey = True
              end
            end
            object tbshValores: TTabSheet
              Caption = 'Valores e Sua Atualização'
              object Label28: TLabel
                Left = 19
                Top = 2
                Width = 117
                Height = 13
                Caption = 'Custo Real Histórico'
              end
              object Label14: TLabel
                Left = 241
                Top = 2
                Width = 126
                Height = 13
                Caption = 'Custo Real Atualizado'
              end
              object Label8: TLabel
                Left = 489
                Top = 2
                Width = 56
                Height = 13
                Caption = 'Despesas'
              end
              object dbrgIndTaxaConv: TDBRadioGroup
                Left = 165
                Top = 50
                Width = 300
                Height = 33
                Caption = 'Forma de Atualização Monetária'
                Columns = 3
                DataField = 'INDTAXACONV'
                DataSource = ds
                Items.Strings = (
                  'Indice'
                  'Regra'
                  'Nenhuma')
                TabOrder = 0
                Values.Strings = (
                  '0'
                  '1'
                  '2')
                OnChange = dbrgIndTaxaConvChange
              end
              object gbxIndice: TGroupBox
                Left = 11
                Top = 103
                Width = 300
                Height = 50
                Caption = 'Indice de Atualização Monetária'
                TabOrder = 1
                object dblcMoeda: TwwDBLookupCombo
                  Left = 15
                  Top = 19
                  Width = 270
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'MOEDESC'#9'20'#9'Descrição'
                    'MOESIGLA'#9'10'#9'Sigla')
                  DataField = 'MOEDAPROCTRAB'
                  DataSource = ds
                  LookupTable = qryMoeda
                  LookupField = 'MOECODIGO'
                  Options = [loColLines, loTitles]
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = True
                  OnCloseUp = dblcMoedaCloseUp
                end
              end
              object gbxRegra: TGroupBox
                Left = 370
                Top = 103
                Width = 300
                Height = 50
                Caption = 'Regra de Cálculo'
                TabOrder = 2
                object dblcRegraNormal: TwwDBLookupCombo
                  Left = 15
                  Top = 19
                  Width = 270
                  Height = 21
                  DropDownAlignment = taRightJustify
                  Selected.Strings = (
                    'NOMEREGRA'#9'60'#9'Regra')
                  DataField = 'IDREGRA'
                  DataSource = ds
                  LookupTable = qryRegra
                  LookupField = 'IDREGRA'
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                  OnCloseUp = dblcRegraNormalCloseUp
                end
              end
              object dbreCusto: TDBRealEdit
                Left = 19
                Top = 15
                Width = 121
                Height = 21
                TabStop = False
                Alignment = taRightJustify
                Color = clBtnFace
                Enabled = False
                Lines.Strings = (
                  '      0,00')
                ReadOnly = True
                TabOrder = 3
                WordWrap = False
                OnChange = dbreCustoChange
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'CUSTOPROC'
                DataSource = ds
              end
              object redValorAtual: TRealEdit
                Left = 241
                Top = 15
                Width = 126
                Height = 21
                TabStop = False
                Alignment = taRightJustify
                Color = clBtnFace
                Enabled = False
                Lines.Strings = (
                  '      0,00')
                ReadOnly = True
                TabOrder = 4
                WordWrap = False
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
              end
              object dbreDespesa: TDBRealEdit
                Left = 489
                Top = 15
                Width = 121
                Height = 21
                TabStop = False
                Alignment = taRightJustify
                Color = clBtnFace
                Enabled = False
                Lines.Strings = (
                  '      0,00')
                ReadOnly = True
                TabOrder = 5
                WordWrap = False
                IntDigits = 10
                DecDigits = 2
                NumberFormat = fNumber
                Signal = False
                DataField = 'DESPESAPROC'
                DataSource = ds
              end
            end
            object tbsContabCAP: TTabSheet
              Caption = 'Contabilização e Contas a Pagar'
              object gbxContabilizacao: TGroupBox
                Left = 11
                Top = 14
                Width = 657
                Height = 60
                Caption = 'Contabilização'
                TabOrder = 0
                object Label44: TLabel
                  Left = 7
                  Top = 16
                  Width = 103
                  Height = 13
                  Caption = 'Tipo de Operação'
                end
                object Label45: TLabel
                  Left = 389
                  Top = 16
                  Width = 81
                  Height = 13
                  Caption = 'Taxa de Juros'
                end
                object dblcTipOper: TwwDBLookupCombo
                  Left = 6
                  Top = 30
                  Width = 376
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'TIPDESCRICAO'#9'25'#9'TIPDESCRICAO')
                  LookupTable = qryTipoOper
                  LookupField = 'TIPCODIGO'
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
                  AllowClearKey = True
                end
                object redJuros: TRealEdit
                  Left = 389
                  Top = 30
                  Width = 80
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '      1,00')
                  TabOrder = 1
                  WordWrap = False
                  IntDigits = 10
                  DecDigits = 2
                  NumberFormat = fNumber
                  Signal = False
                end
                object rgJuros: TRadioGroup
                  Left = 477
                  Top = 15
                  Width = 175
                  Height = 36
                  Caption = 'Juros'
                  Columns = 2
                  ItemIndex = 0
                  Items.Strings = (
                    'Simples'
                    'Compostos')
                  TabOrder = 2
                end
              end
              object gbxCAP: TGroupBox
                Left = 13
                Top = 97
                Width = 657
                Height = 60
                Caption = 'Contas a Pagar'
                TabOrder = 1
                object Label46: TLabel
                  Left = 6
                  Top = 15
                  Width = 95
                  Height = 13
                  Caption = 'Data Pagamento'
                end
                object Label47: TLabel
                  Left = 116
                  Top = 15
                  Width = 112
                  Height = 13
                  Caption = 'Tipo de Documento'
                end
                object Label48: TLabel
                  Left = 388
                  Top = 15
                  Width = 116
                  Height = 13
                  Caption = 'Tipo de Desembolso'
                end
                object dtPagamento: TCMDateTimePicker
                  Left = 6
                  Top = 29
                  Width = 100
                  Height = 21
                  CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                  CalendarAttributes.Font.Color = clWindowText
                  CalendarAttributes.Font.Height = -11
                  CalendarAttributes.Font.Name = 'MS Sans Serif'
                  CalendarAttributes.Font.Style = []
                  ButtonStyle = cbsCustom
                  Epoch = 1950
                  ButtonGlyph.Data = {
                    06050000424D06050000000000003604000028000000100000000D0000000100
                    080000000000D000000000000000000000000001000000000000000000000000
                    80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                    A6000020400000206000002080000020A0000020C0000020E000004000000040
                    20000040400000406000004080000040A0000040C0000040E000006000000060
                    20000060400000606000006080000060A0000060C0000060E000008000000080
                    20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                    200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                    200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                    200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                    20004000400040006000400080004000A0004000C0004000E000402000004020
                    20004020400040206000402080004020A0004020C0004020E000404000004040
                    20004040400040406000404080004040A0004040C0004040E000406000004060
                    20004060400040606000406080004060A0004060C0004060E000408000004080
                    20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                    200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                    200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                    200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                    20008000400080006000800080008000A0008000C0008000E000802000008020
                    20008020400080206000802080008020A0008020C0008020E000804000008040
                    20008040400080406000804080008040A0008040C0008040E000806000008060
                    20008060400080606000806080008060A0008060C0008060E000808000008080
                    20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                    200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                    200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                    200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                    2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                    2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                    2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                    2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                    2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                    2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                    2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                    000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                    A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                    A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                    A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                    FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                    04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                    000000000000000000FF}
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ShowButton = True
                  TabOrder = 0
                end
                object dblcTipoDoc: TwwDBLookupCombo
                  Left = 116
                  Top = 29
                  Width = 260
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'35'#9'DESCRICAO')
                  LookupTable = qryTipoDoc
                  LookupField = 'CODTIPDOC'
                  Style = csDropDownList
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
                  AllowClearKey = True
                end
                object dblcTipoDesemb: TwwDBLookupCombo
                  Left = 388
                  Top = 29
                  Width = 260
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'35'#9'DESCRICAO')
                  LookupTable = qryTipoDesemb
                  LookupField = 'CODTIPRECDES'
                  Style = csDropDownList
                  TabOrder = 2
                  AutoDropDown = True
                  ShowButton = True
                  SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
                  AllowClearKey = True
                end
              end
            end
          end
        end
        inherited tbsDet: TTabSheet
          Caption = 'Objetos do Processo'
          inherited dbgrdDet: TwwDBGrid
            Width = 638
            Height = 188
            Selected.Strings = (
              'DESCRICAO'#9'40'#9'Descrição do Objeto Reclamado'#9'F'
              'VALORRECL'#9'16'#9'Valor Reclamado'#9'F'
              'PERCPROB'#9'17'#9'Probab. Contraparte (%)'#9'F'
              'VALORESPERADO'#9'12'#9'Valor Estimado'#9'F'
              'VALORSENTENCA'#9'10'#9'Valor Real'#9'F'
              'OBSERVACAO'#9'240'#9'Observação'#9'F')
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
          end
          inherited pnlControlesDet: TPanel
            Width = 638
            Height = 188
            object Label5: TLabel
              Left = 3
              Top = 0
              Width = 85
              Height = 13
              Caption = 'Tipo de Objeto'
            end
            object Label39: TLabel
              Left = 3
              Top = 80
              Width = 69
              Height = 13
              Caption = 'Observação'
            end
            object Label6: TLabel
              Left = 3
              Top = 41
              Width = 97
              Height = 13
              Caption = 'Valor Reclamado'
            end
            object Label7: TLabel
              Left = 120
              Top = 41
              Width = 113
              Height = 13
              Caption = 'Probab. Original (%)'
            end
            object Label24: TLabel
              Left = 246
              Top = 41
              Width = 136
              Height = 13
              Caption = 'Probab. Contraparte (%)'
            end
            object Label50: TLabel
              Left = 404
              Top = 41
              Width = 87
              Height = 13
              Caption = 'Valor Esperado'
            end
            object lblValReal: TLabel
              Left = 532
              Top = 41
              Width = 60
              Height = 13
              Caption = 'Valor Real'
            end
            object dblcTipObj: TwwDBLookupCombo
              Left = 3
              Top = 15
              Width = 629
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'40'#9'DESCRICAO')
              DataField = 'CODTIPOOBJETO'
              DataSource = dsDet
              LookupTable = qryTipoObj
              LookupField = 'CODTIPOOBJETO'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
            object dbmemObserv: TDBMemo
              Left = 3
              Top = 94
              Width = 629
              Height = 89
              DataField = 'OBSERVACAO'
              DataSource = dsDet
              ScrollBars = ssVertical
              TabOrder = 1
            end
            object dbedValRecl: TDBRealEdit
              Left = 3
              Top = 54
              Width = 100
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALORRECL'
              DataSource = dsDet
            end
            object dbedPercOrig: TDBRealEdit
              Left = 120
              Top = 54
              Width = 113
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 3
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'PERCORIG'
              DataSource = dsDet
            end
            object dbedPerc: TDBRealEdit
              Left = 246
              Top = 54
              Width = 141
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 4
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'PERCPROB'
              DataSource = dsDet
            end
            object edValor: TRealEdit
              Left = 404
              Top = 54
              Width = 100
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 5
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object dbedValReal: TDBRealEdit
              Left = 532
              Top = 54
              Width = 100
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 6
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALORSENTENCA'
              DataSource = dsDet
            end
          end
        end
        object tbsEtapas: TTabSheet
          Caption = 'Etapas'
          object dbGrdEtapa: TwwDBGrid
            Left = 0
            Top = 0
            Width = 745
            Height = 110
            Selected.Strings = (
              'DATAREALOCOR'#9'17'#9'Data e Hora'#9'F'
              'DESCRICAO'#9'38'#9'Tipo de Etapa'#9'F'
              'ASSUNTO'#9'40'#9'Assunto Resumido'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = ds2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object pnlEtapas: TPanel
            Left = 0
            Top = 0
            Width = 638
            Height = 188
            Align = alClient
            TabOrder = 1
            object Label22: TLabel
              Left = 103
              Top = 1
              Width = 156
              Height = 13
              Caption = 'Tipo de Etapa (Andamento)'
            end
            object Label20: TLabel
              Left = 439
              Top = 1
              Width = 28
              Height = 13
              Caption = 'Data'
            end
            object Label41: TLabel
              Left = 103
              Top = 37
              Width = 113
              Height = 13
              Caption = 'Assunto (Resumido)'
            end
            object Label42: TLabel
              Left = 481
              Top = 37
              Width = 122
              Height = 13
              Hint = 'Valor do Depósito do Recurso ou Despesa Processual'
              Caption = 'Depósito ou Despesa'
              ParentShowHint = False
              ShowHint = True
            end
            object lblHonor: TLabel
              Left = 481
              Top = 72
              Width = 83
              Height = 13
              Caption = 'Honorário Fixo'
              ParentShowHint = False
              ShowHint = False
              Visible = False
            end
            object Label43: TLabel
              Left = 103
              Top = 112
              Width = 146
              Height = 13
              Caption = 'Descrição / Observações'
            end
            object Label25: TLabel
              Left = 557
              Top = 1
              Width = 28
              Height = 13
              Caption = 'Hora'
            end
            object dblcTipoEtp: TwwDBLookupCombo
              Left = 103
              Top = 13
              Width = 320
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'40'#9'DESCRICAO')
              DataField = 'CODTIPORECURSO'
              DataSource = ds2
              LookupTable = qryTipoEtapa
              LookupField = 'CODTIPORECURSO'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnCloseUp = dblcTipoEtpCloseUp
            end
            object dtedDataReal: TCMDateTimePicker
              Left = 439
              Top = 13
              Width = 100
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              Epoch = 1950
              ButtonGlyph.Data = {
                06050000424D06050000000000003604000028000000100000000D0000000100
                080000000000D000000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                A6000020400000206000002080000020A0000020C0000020E000004000000040
                20000040400000406000004080000040A0000040C0000040E000006000000060
                20000060400000606000006080000060A0000060C0000060E000008000000080
                20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                20004000400040006000400080004000A0004000C0004000E000402000004020
                20004020400040206000402080004020A0004020C0004020E000404000004040
                20004040400040406000404080004040A0004040C0004040E000406000004060
                20004060400040606000406080004060A0004060C0004060E000408000004080
                20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                20008000400080006000800080008000A0008000C0008000E000802000008020
                20008020400080206000802080008020A0008020C0008020E000804000008040
                20008040400080406000804080008040A0008040C0008040E000806000008060
                20008060400080606000806080008060A0008060C0008060E000808000008080
                20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                000000000000000000FF}
              ShowButton = True
              TabOrder = 1
            end
            object mskedHora: TMaskEdit
              Left = 555
              Top = 13
              Width = 50
              Height = 21
              EditMask = '!90:00;1;_'
              MaxLength = 5
              TabOrder = 2
              Text = '  :  '
            end
            object dbedAssunto: TDBEdit
              Left = 103
              Top = 49
              Width = 320
              Height = 21
              DataField = 'ASSUNTO'
              DataSource = ds2
              TabOrder = 3
            end
            object redHonor: TRealEdit
              Left = 481
              Top = 84
              Width = 125
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 5
              Visible = False
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object dbmObserv: TDBMemo
              Left = 103
              Top = 124
              Width = 503
              Height = 70
              DataField = 'OBSERVETAPA'
              DataSource = ds2
              ScrollBars = ssVertical
              TabOrder = 6
            end
            object dbrgAbate: TDBRadioGroup
              Left = 104
              Top = 72
              Width = 320
              Height = 33
              Caption = 'Depósito ou Despesa Abate do Valor da Causa ?'
              Columns = 2
              DataField = 'FLGVALORABATE'
              DataSource = ds2
              Items.Strings = (
                'Sim'
                'Não')
              TabOrder = 4
              Values.Strings = (
                '1'
                '0')
            end
            object dbedValRec: TDBRealEdit
              Left = 481
              Top = 50
              Width = 125
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 7
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALORREC'
              DataSource = ds2
            end
          end
        end
        object tbshVinculos: TTabSheet
          Caption = 'Vinculações'
          object pnlLigado: TPanel
            Left = 0
            Top = 0
            Width = 638
            Height = 41
            Align = alTop
            TabOrder = 0
            object Label37: TLabel
              Left = 130
              Top = 14
              Width = 245
              Height = 13
              Caption = 'Este Processo Está Vinculado ao Processo'
            end
            object spbProcVinc: TSpeedButton
              Left = 664
              Top = 8
              Width = 24
              Height = 24
              Hint = 'Escolhe o processo a que este está ligado'
              Glyph.Data = {
                66010000424D6601000000000000760000002800000014000000140000000100
                040000000000F000000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FFFFF
                FFF0000000003333333BFBFBFBF0FFF000003333333FFFFFFF00000000003333
                333BFBFBF0FBFBFB00003333333F00000FF0000000003333333B0FFF0000FFF0
                00003333333F00000FF0000000003333330BFBFBF0FBFBFB000033333010FFFF
                FF0000000000333330180BFBFBF0FFF000003333301180FFFFF0000000003333
                0811190BFBFBFBFB0000333307719990FFFFFFFF0000333077FF999903333333
                000033077FFFF0003333333300003077FFF00333333333330000077FFF033333
                33333333000007FFF093333333333333000030FF093333333333333300003300
                33333333333333330000}
              ParentShowHint = False
              ShowHint = True
              OnClick = spbProcVincClick
            end
            object spbApagaVinc: TSpeedButton
              Left = 697
              Top = 8
              Width = 24
              Height = 24
              Hint = 'Exclui a Vinculação'
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
              ParentShowHint = False
              ShowHint = True
              OnClick = spbApagaVincClick
            end
            object dbedNumVinc: TDBEdit
              Left = 388
              Top = 10
              Width = 120
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'IDPROCVINCULADO'
              DataSource = ds
              ReadOnly = True
              TabOrder = 0
            end
          end
          object gbxVinculados: TGroupBox
            Left = 0
            Top = 41
            Width = 638
            Height = 147
            Align = alClient
            Caption = 'Processos Ligados a Este'
            TabOrder = 1
            object wwDBGrid1: TwwDBGrid
              Left = 2
              Top = 15
              Width = 634
              Height = 130
              Selected.Strings = (
                'NOME'#9'40'#9'Contraparte'
                'DATAJUIZO'#9'10'#9'Data Ajuiz.'
                'DATANOTIF'#9'10'#9'Data Notif.'
                'JCJ'#9'10'#9'Órgão Jur.'
                'PROCJCJNUM'#9'15'#9'Número na 1.a Inst.'
                'PROCTRTNUM'#9'15'#9'Número na 2.a Inst.'
                'PROCTSTNUM'#9'15'#9'Número na Inst. Sup.'
                'FLGSITPROC'#9'10'#9'Encerrado?'
                'DATAEFETENC'#9'10'#9'Data Encerr.'
                'FLGVINCULADO'#9'10'#9'Vinculado?'
                'NUMPROCTRAB'#9'10'#9'Número Interno')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsProcVinc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              ParentFont = False
              TabOrder = 0
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
        end
        object tbshEncer: TTabSheet
          Caption = 'Encerramento'
          object Label15: TLabel
            Left = 314
            Top = 21
            Width = 99
            Height = 13
            Caption = 'Prev.Encerramto.'
          end
          object rgTipEncer: TDBRadioGroup
            Left = 127
            Top = 52
            Width = 121
            Height = 120
            Caption = 'Tipo'
            DataField = 'TIPOENCER'
            DataSource = ds
            Items.Strings = (
              'Arquivamento'
              'Acordo'
              'Desistência'
              'Sentença')
            TabOrder = 0
            Values.Strings = (
              'A'
              'C'
              'D'
              'S')
            OnClick = rgTipEncerClick
          end
          object gbxAcordo: TGroupBox
            Left = 295
            Top = 70
            Width = 139
            Height = 43
            Caption = 'Número de Parcelas'
            TabOrder = 1
            Visible = False
            object sbspeParc: TwwDBSpinEdit
              Left = 42
              Top = 16
              Width = 55
              Height = 21
              Increment = 1
              DataField = 'QTDEPARCACOR'
              DataSource = ds
              TabOrder = 0
              UnboundDataType = wwDefault
            end
          end
          object gbxDataEncer: TGroupBox
            Left = 476
            Top = 70
            Width = 125
            Height = 43
            Caption = 'Data Encerramento'
            TabOrder = 2
            object dbedEncerr: TCMDateTimePicker
              Left = 10
              Top = 15
              Width = 100
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAEFETENC'
              DataSource = ds
              Epoch = 1950
              ButtonGlyph.Data = {
                06050000424D06050000000000003604000028000000100000000D0000000100
                080000000000D000000000000000000000000001000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                A6000020400000206000002080000020A0000020C0000020E000004000000040
                20000040400000406000004080000040A0000040C0000040E000006000000060
                20000060400000606000006080000060A0000060C0000060E000008000000080
                20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                20004000400040006000400080004000A0004000C0004000E000402000004020
                20004020400040206000402080004020A0004020C0004020E000404000004040
                20004040400040406000404080004040A0004040C0004040E000406000004060
                20004060400040606000406080004060A0004060C0004060E000408000004080
                20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                20008000400080006000800080008000A0008000C0008000E000802000008020
                20008020400080206000802080008020A0008020C0008020E000804000008040
                20008040400080406000804080008040A0008040C0008040E000806000008060
                20008060400080606000806080008060A0008060C0008060E000808000008080
                20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                000000000000000000FF}
              ShowButton = True
              TabOrder = 0
            end
          end
          object gbxSent: TGroupBox
            Left = 295
            Top = 130
            Width = 306
            Height = 42
            Caption = 'Tipo de Sentença'
            TabOrder = 3
            Visible = False
            object dblcTipSent: TwwDBLookupCombo
              Left = 10
              Top = 15
              Width = 285
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'40'#9'DESCRICAO')
              DataField = 'CODTIPOSENT'
              DataSource = ds
              LookupTable = tblTipSent
              LookupField = 'CODTIPOSENT'
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
          end
          object dbedPrevEnc: TCMDateTimePicker
            Left = 314
            Top = 36
            Width = 100
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAPREVENCER'
            DataSource = ds
            Epoch = 1950
            ButtonGlyph.Data = {
              06050000424D06050000000000003604000028000000100000000D0000000100
              080000000000D000000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A6000020400000206000002080000020A0000020C0000020E000004000000040
              20000040400000406000004080000040A0000040C0000040E000006000000060
              20000060400000606000006080000060A0000060C0000060E000008000000080
              20000080400000806000008080000080A0000080C0000080E00000A0000000A0
              200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
              200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
              200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
              20004000400040006000400080004000A0004000C0004000E000402000004020
              20004020400040206000402080004020A0004020C0004020E000404000004040
              20004040400040406000404080004040A0004040C0004040E000406000004060
              20004060400040606000406080004060A0004060C0004060E000408000004080
              20004080400040806000408080004080A0004080C0004080E00040A0000040A0
              200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
              200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
              200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
              20008000400080006000800080008000A0008000C0008000E000802000008020
              20008020400080206000802080008020A0008020C0008020E000804000008040
              20008040400080406000804080008040A0008040C0008040E000806000008060
              20008060400080606000806080008060A0008060C0008060E000808000008080
              20008080400080806000808080008080A0008080C0008080E00080A0000080A0
              200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
              200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
              200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
              2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
              2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
              2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
              2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
              2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
              2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
              2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
              000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
              A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
              A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
              A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
              FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
              04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
              000000000000000000FF}
            ShowButton = True
            TabOrder = 4
          end
        end
      end
      inherited Dock973: TDock97
        Width = 736
      end
      inherited Dock974: TDock97
        Left = 650
        Height = 216
        inherited tb97Detalhe: TToolbar97
          inherited bbtnVoltarDet: TBitBtn
            Enabled = False
            Visible = False
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 752
    inherited Toolbar971: TToolbar97
      object sbtnProcurarLitis: TToolbarButton97
        Left = 240
        Top = 0
        Width = 202
        Height = 41
        Hint = 'Esta opção é bem mais demorada'
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Procurar Incluindo &Litisconsortes'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
          8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
          F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
          F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
          0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
          B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
          B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
          333333333777733333333333FBFBFB3333333333333333333333}
        ImageIndex = 3
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = sbtnProcurarLitisClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 428
    Width = 752
    inherited tb97Fundo: TToolbar97
      Left = 582
      DockPos = 590
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 415
      DockPos = 423
    end
  end
  object bbtnProcRequerente: TBitBtn [3]
    Left = 708
    Top = 64
    Width = 25
    Height = 24
    Hint = 'Procura Contraparte por qualquer Tipo de Documento'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = bbtnProcRequerenteClick
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
  inherited qry: TwwQuery
    AfterOpen = qryAfterOpen
    BeforeInsert = qryBeforeInsert
    AfterInsert = qryAfterInsert
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT * FROM PROCESSOTRAB'
      'WHERE NUMPROCTRAB = :NumProcTrab')
    Left = 3
    Top = 251
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NumProcTrab'
        ParamType = ptUnknown
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = qryObjeto
    Left = 12
    Top = 329
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 480
    Top = 14
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PROCESSOTRAB'
      'set'
      '  IDRECLAMANTE = :IDRECLAMANTE,'
      '  IDADVOGRECTE = :IDADVOGRECTE,'
      '  CODTIPOSENT = :CODTIPOSENT,'
      '  CODIGOTRT = :CODIGOTRT,'
      '  JCJ = :JCJ,'
      '  QTDERECTES = :QTDERECTES,'
      '  DATANOTIF = :DATANOTIF,'
      '  DATAPOST = :DATAPOST,'
      '  PROCTRTNUM = :PROCTRTNUM,'
      '  PROCTSTNUM = :PROCTSTNUM,'
      '  DATAPREVENCER = :DATAPREVENCER,'
      '  DATAEFETENC = :DATAEFETENC,'
      '  CUSTOPROC = :CUSTOPROC,'
      '  TIPOENCER = :TIPOENCER,'
      '  FLGSITPROC = :FLGSITPROC,'
      '  QTDEPARCACOR = :QTDEPARCACOR,'
      '  IDADVOGRECDA = :IDADVOGRECDA,'
      '  IDASSISTTECN = :IDASSISTTECN,'
      '  PROCJCJNUM = :PROCJCJNUM,'
      '  IDTIPOPROC = :IDTIPOPROC,'
      '  INDMATERIA = :INDMATERIA,'
      '  IDTIPOACAO = :IDTIPOACAO,'
      '  IDENTPASTA = :IDENTPASTA,'
      '  DATAJUIZO = :DATAJUIZO,'
      '  IDVARAJUSTICA = :IDVARAJUSTICA,'
      '  IDCIDADES = :IDCIDADES,'
      '  IDADVOGCASA = :IDADVOGCASA,'
      '  FLGPARTEATIVA = :FLGPARTEATIVA,'
      '  IDLITISCONSORTE = :IDLITISCONSORTE,'
      '  IDPROCVINCULADO = :IDPROCVINCULADO,'
      '  FLGVINCULADO = :FLGVINCULADO,'
      '  DESPESAPROC = :DESPESAPROC,'
      '  NUMVARAJUSTICA = :NUMVARAJUSTICA,'
      '  IDPATRO = :IDPATRO,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  IDEMPRESAPROP = :IDEMPRESAPROP,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  INDTAXACONV = :INDTAXACONV,'
      '  IDREGRA = :IDREGRA,'
      '  MOEDAPROCTRAB = :MOEDAPROCTRAB,'
      '  IDMOTIVO = :IDMOTIVO'
      'where'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB')
    InsertSQL.Strings = (
      'insert into PROCESSOTRAB'
      '  (NUMPROCTRAB, IDRECLAMANTE, IDADVOGRECTE, CODTIPOSENT, '
      'CODIGOTRT, JCJ, '
      '   QTDERECTES, DATANOTIF, DATAPOST, PROCTRTNUM, PROCTSTNUM, '
      'DATAPREVENCER, '
      '   DATAEFETENC, CUSTOPROC, TIPOENCER, FLGSITPROC, QTDEPARCACOR, '
      'IDADVOGRECDA, '
      
        '   IDASSISTTECN, PROCJCJNUM, IDTIPOPROC, INDMATERIA, IDTIPOACAO,' +
        ' '
      'IDENTPASTA, '
      
        '   DATAJUIZO, IDVARAJUSTICA, IDCIDADES, IDADVOGCASA, FLGPARTEATI' +
        'VA, '
      'IDLITISCONSORTE, '
      '   IDPROCVINCULADO, FLGVINCULADO, DESPESAPROC, NUMVARAJUSTICA, '
      'IDPATRO, '
      '   IDPLANOPREV, CODSUBCONTA, IDEMPRESAPROP, CODCENTROCUSTO, '
      'UNIDNEGOC, '
      '   INDTAXACONV, IDREGRA, MOEDAPROCTRAB, IDMOTIVO)'
      'values'
      '  (:NUMPROCTRAB, :IDRECLAMANTE, :IDADVOGRECTE, :CODTIPOSENT, '
      ':CODIGOTRT, '
      '   :JCJ, :QTDERECTES, :DATANOTIF, :DATAPOST, :PROCTRTNUM, '
      ':PROCTSTNUM, '
      '   :DATAPREVENCER, :DATAEFETENC, :CUSTOPROC, :TIPOENCER, '
      ':FLGSITPROC, :QTDEPARCACOR, '
      '   :IDADVOGRECDA, :IDASSISTTECN, :PROCJCJNUM, :IDTIPOPROC, '
      ':INDMATERIA, '
      
        '   :IDTIPOACAO, :IDENTPASTA, :DATAJUIZO, :IDVARAJUSTICA, :IDCIDA' +
        'DES, '
      ':IDADVOGCASA, '
      
        '   :FLGPARTEATIVA, :IDLITISCONSORTE, :IDPROCVINCULADO, :FLGVINCU' +
        'LADO, '
      ':DESPESAPROC, '
      '   :NUMVARAJUSTICA, :IDPATRO, :IDPLANOPREV, :CODSUBCONTA, '
      ':IDEMPRESAPROP, '
      '   :CODCENTROCUSTO, :UNIDNEGOC, :INDTAXACONV, :IDREGRA, '
      ':MOEDAPROCTRAB, '
      '   :IDMOTIVO)')
    DeleteSQL.Strings = (
      'delete from PROCESSOTRAB'
      'where'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB')
    Left = 4
    Top = 239
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Processo'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PROCESSOTRAB.DATANOTIF'
      'PROCESSOTRAB.PROCJCJNUM'
      'VARAJUSTICA.DESCRICAO'
      'PROCESSOTRAB.NUMVARAJUSTICA'
      'PROCESSOTRAB.PROCTRTNUM'
      'PROCESSOTRAB.PROCTSTNUM'
      'PROCESSOTRAB.NUMPROCTRAB')
    TipodeDado.Strings = (
      'C'
      'D'
      'C'
      'C'
      'N'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome Contraparte'
      'Data de Notificação'
      'Número Proc. na 1a Inst.'
      'Órgão Jurisd. (Vara)'
      'Número da Vara'
      'Número Proc. na 2a Inst.'
      'Número Proc. na 3a Inst.'
      'Número Proc. Interno')
    Tabelas.Strings = (
      'PESSOA'
      'PROCESSOTRAB'
      'VARAJUSTICA')
    CamposChave.Strings = (
      'PROCESSOTRAB.NUMPROCTRAB')
    Filtro.Strings = (
      'PROCESSOTRAB.IDRECLAMANTE  = PESSOA.IDPESSOA'
      'PROCESSOTRAB.IDVARAJUSTICA  = VARAJUSTICA .IDVARAJUSTICA (+)'
      'PROCESSOTRAB.INDMATERIA       > 1'
      'PROCESSOTRAB.INDMATERIA       < 4')
    Larguras.Strings = (
      '50'
      '12'
      '15'
      '40'
      '15'
      '15'
      '15'
      '15')
    Left = 634
    Top = 14
  end
  inherited ds: TwwDataSource
    Left = 4
    Top = 226
  end
  inherited ImlPadrao: TImageList
    Left = 481
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 712
    Top = 15
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 712
    Top = 1
  end
  object ds2: TwwDataSource
    AutoEdit = False
    DataSet = qryEtapa
    Left = 45
    Top = 378
  end
  object qryEtapa: TwwQuery
    CachedUpdates = True
    BeforeInsert = qryEtapaBeforeInsert
    AfterInsert = qryEtapaAfterInsert
    BeforeEdit = qryEtapaBeforeEdit
    BeforePost = qryEtapaBeforePost
    AfterScroll = qryEtapaAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select ET.ASSUNTO, ET.DATAREALOCOR, ET.NUMSEQ, ET.FLGVALORABATE,'
      '       ET.OBSERVETAPA, TP.DESCRICAO, ET.CODTIPORECURSO,'
      '       ET.VALORREC, ET.NUMPROCTRAB, TP.VALORHONOR'
      'from etapaproctrab ET, tiporectrab TP'
      'where ET.CODTIPORECURSO = TP.CODTIPORECURSO'
      'and   ET.NUMPROCTRAB = :NumProcTrab'
      'order by ET.DATAREALOCOR')
    UpdateObject = UpdEtapa
    ValidateWithMask = True
    Left = 45
    Top = 367
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NumProcTrab'
        ParamType = ptUnknown
      end>
  end
  object tblTipRec: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'CODTIPORECURSO'
    TableName = 'CM.TIPORECTRAB'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 130
    Top = 277
  end
  object qryProcVinc: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT PESSOA.NOME, PESSOA.IDPESSOA, PROCESSOTRAB.* '
      'FROM PESSOA, PROCESSOTRAB '
      'WHERE PESSOA.IDPESSOA = PROCESSOTRAB.IDRECLAMANTE'
      'AND      PROCESSOTRAB.IDPROCVINCULADO = :NumProcTrab')
    ControlType.Strings = (
      'FLGSITPROC;CheckBox;1;0'
      'FLGVINCULADO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 266
    Top = 357
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NUMPROCTRAB'
        ParamType = ptUnknown
      end>
  end
  object qryPartic: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'Select  P.NOME, PP.IDPESSOA, PP.INSCRICAONUMERO, PP.INSCRICAODAT' +
        'A,'
      '       PP.SALPARTICIPACAO, EL.MATRICULA, EL.DATAADMISSAO,'
      '       EL.DATADEMISSAO, CE.TITULO, PPR.NOME AS PLANO,'
      '       PA.NOME AS PATROC'
      'from PESSOA P, PARTPREVPLAN PP, ELEGPATRO EL, CARGOEXT CE,'
      '        PLANPREV PPR, PESSOA PA'
      'where P.IDPESSOA     = PP.IDPESSOA'
      'and   P.IDPESSOA      = EL.IDPESSOA'
      'and   PP.IDPESSOA    = EL.IDPESSOA'
      'and   PP.IDPESSJUR  = EL.IDPESSJUR'
      'and   PP.IDPESSJUR  = PA.IDPESSOA'
      'and   PP.IDPLANOPREV = PPR.IDPLANOPREV '
      'and   EL.IDCARGOEXT = CE.IDCARGOEXT(+)'
      'and   P.IDPESSOA =  :IdReclamante')
    ValidateWithMask = True
    Left = 266
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IdReclamante'
        ParamType = ptUnknown
      end>
  end
  object ds5: TwwDataSource
    DataSet = qryPartic
    Left = 311
    Top = 250
  end
  object qryTipAcao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDTIPOACAO, DESCRICAO from TIPOACAOPROCJUR'
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 165
    Top = 256
  end
  object ds4: TwwDataSource
    Left = 241
    Top = 421
  end
  object tblTipSent: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'CODTIPOSENT'
    TableName = 'CM.TIPOSENTENCA'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 423
    Top = 352
  end
  object dsProcVinc: TwwDataSource
    DataSet = qryProcVinc
    Left = 322
    Top = 353
  end
  object qryAdvCasa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select p.nome, s.idusuario from pessoa p, usuariosistema s'
      'where p.idpessoa=s.idusuario'
      'order by upper(p.nome)')
    ValidateWithMask = True
    Left = 359
    Top = 246
  end
  object qryTipoProc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDTIPOPROC, NOMETIPOPROC from TIPOPROCESSO '
      'order by upper(NOMETIPOPROC)')
    ValidateWithMask = True
    Left = 97
    Top = 309
  end
  object tblTipObj: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'CODTIPOOBJETO'
    TableName = 'CM.TIPOOBJPROCTRAB'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 218
    Top = 361
  end
  object qryTipoObj: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CODTIPOOBJETO, DESCRICAO from TIPOOBJPROCTRAB'
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 361
    Top = 296
  end
  object qryVara: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDVARAJUSTICA, DESCRICAO from VARAJUSTICA'
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 313
    Top = 304
  end
  object dsDet2: TwwDataSource
    AutoEdit = False
    DataSet = qryLitis
    Left = 40
    Top = 252
  end
  object qryLitis: TwwQuery
    CachedUpdates = True
    BeforePost = qryLitisBeforePost
    AfterScroll = qryLitisAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DECODE(P.TIPO,'#39'F'#39', P.NOME, P.RAZAOSOCIAL) AS NOME,'
      'DECODE(C.IDMOTIVO,NULL,'#39'Normal'#39', M.DESCRICAO) AS SITUACAO,'
      'DECODE(NVL(C.INDTESTEMUNHA,0),0,'#39'Listisconsorte C.Parte'#39',1,'
      
        '       '#39'Testemunha C.Parte'#39',2,'#39'Nossa Testemunha'#39','#39'Nossa Listisco' +
        'nsorte'#39') AS CATEGORIA,'
      'C.IDPESSOA, C.NUMPROCTRAB, C.IDMOTIVO, C.INDTESTEMUNHA'
      'FROM PESSOA P, COPARTPROCTRAB C, MOTIVO M'
      'WHERE C.NUMPROCTRAB = :NumProcTrab'
      'AND       C.IDPESSOA           = P.IDPESSOA'
      'AND       C.IDMOTIVO           = M.IDMOTIVO(+)'
      ' ')
    UpdateObject = updLitis
    ValidateWithMask = True
    Left = 40
    Top = 237
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NumProcTrab'
        ParamType = ptUnknown
      end>
  end
  object updLitis: TUpdateSQL
    ModifySQL.Strings = (
      'update COPARTPROCTRAB'
      'set'
      '  IDMOTIVO = :IDMOTIVO,'
      '  INDTESTEMUNHA = :INDTESTEMUNHA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB')
    InsertSQL.Strings = (
      'insert into COPARTPROCTRAB'
      '  (IDPESSOA, NUMPROCTRAB, IDMOTIVO, INDTESTEMUNHA)'
      'values'
      '  (:IDPESSOA, :NUMPROCTRAB, :IDMOTIVO, :INDTESTEMUNHA)')
    DeleteSQL.Strings = (
      'delete from COPARTPROCTRAB'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB')
    Left = 40
    Top = 224
  end
  object tblTRT: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'CODIGOTRT'
    TableName = 'CM.TRT'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 371
    Top = 355
  end
  object UpdEtapa: TUpdateSQL
    ModifySQL.Strings = (
      'update ETAPAPROCTRAB'
      'set'
      '  ASSUNTO = :ASSUNTO,'
      '  DATAREALOCOR = :DATAREALOCOR,'
      '  FLGVALORABATE = :FLGVALORABATE,'
      '  OBSERVETAPA = :OBSERVETAPA,'
      '  CODTIPORECURSO = :CODTIPORECURSO,'
      '  VALORREC = :VALORREC'
      'where'
      '  NUMSEQ = :OLD_NUMSEQ and'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB')
    InsertSQL.Strings = (
      'insert into ETAPAPROCTRAB'
      '  (ASSUNTO, DATAREALOCOR, NUMSEQ, FLGVALORABATE, OBSERVETAPA, '
      'CODTIPORECURSO, '
      '   VALORREC, NUMPROCTRAB)'
      'values'
      
        '  (:ASSUNTO, :DATAREALOCOR, :NUMSEQ, :FLGVALORABATE, :OBSERVETAP' +
        'A, '
      ':CODTIPORECURSO, '
      '   :VALORREC, :NUMPROCTRAB)')
    DeleteSQL.Strings = (
      'delete from ETAPAPROCTRAB'
      'where'
      '  NUMSEQ = :OLD_NUMSEQ and'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB')
    Left = 45
    Top = 353
  end
  object tblHonor: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'NUMPROCTRAB;DATAPAGTOHONOR;IDFORNSERV'
    TableName = 'CM.HONORARIOS'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 159
    Top = 361
  end
  object qryTipoEtapa: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCRICAO, CODTIPORECURSO'
      'FROM  TIPORECTRAB '
      'ORDER  BY  UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 103
    Top = 256
  end
  object qryNumSeq: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(NUMSEQ)  AS ULTSEQ'
      'FROM ETAPAPROCTRAB'
      'WHERE NUMPROCTRAB = :NUMPROC')
    ValidateWithMask = True
    Left = 128
    Top = 420
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NUMPROC'
        ParamType = ptUnknown
      end>
  end
  object MontaSelectCidade: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Cidade'
    Colunas.Strings = (
      'CIDADES.NOME'
      'ESTADO.CODESTADO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Cidade'
      'Sigla UF')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CIDADES'
      'ESTADO')
    CamposChave.Strings = (
      'CIDADES.IDCIDADES')
    Filtro.Strings = (
      'CIDADES.IDESTADO = ESTADO.IDESTADO')
    Larguras.Strings = (
      '60'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 634
    Top = 1
  end
  object dsUF: TwwDataSource
    AutoEdit = False
    DataSet = qryUF
    Left = 443
    Top = 296
  end
  object qryUF: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select E.CODESTADO '
      'from CIDADES C, ESTADO E'
      'WHERE C.IDESTADO = E.IDESTADO'
      'AND      C.IDCIDADES = :IDCIDADES')
    ValidateWithMask = True
    Left = 410
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDCIDADES'
        ParamType = ptUnknown
      end>
  end
  object qryMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select  MOECODIGO, MOEDESC, MOESIGLA '
      'from MOEDA '
      'order by upper(MOEDESC)')
    ValidateWithMask = True
    Left = 102
    Top = 365
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDREGRA,'
      '  RTRIM(NOMEREGRA) AS NOMEREGRA'
      'FROM'
      '  REGRA'
      'ORDER BY'
      '  UPPER(NOMEREGRA)')
    ValidateWithMask = True
    Left = 218
    Top = 257
  end
  object tblParam: TwwTable
    DatabaseName = 'BaseDados'
    TableName = 'CM.PARAMRH'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 213
    Top = 307
  end
  object qrySubConta: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODSUBCONTA,IDPESSOA,NOMESUBCONTA'
      'FROM SUBCONTA'
      'WHERE CODSUBCONTA = :CODSUBCONTA')
    UpdateObject = updSubConta
    ValidateWithMask = True
    Left = 523
    Top = 241
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODSUBCONTA'
        ParamType = ptUnknown
      end>
  end
  object updSubConta: TUpdateSQL
    ModifySQL.Strings = (
      'update SUBCONTA'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  NOMESUBCONTA = :NOMESUBCONTA'
      'where'
      '  CODSUBCONTA = :OLD_CODSUBCONTA')
    InsertSQL.Strings = (
      'insert into SUBCONTA'
      '  (CODSUBCONTA, IDPESSOA, NOMESUBCONTA)'
      'values'
      '  (:CODSUBCONTA, :IDPESSOA, :NOMESUBCONTA)')
    DeleteSQL.Strings = (
      'delete from SUBCONTA'
      'where'
      '  CODSUBCONTA = :OLD_CODSUBCONTA')
    Left = 523
    Top = 228
  end
  object Regra: TRegra
    QueryIn = qryIn
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 566
    Top = 2
  end
  object qryIn: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 535
    Top = 1
  end
  object qryValores: TwwQuery
    CachedUpdates = True
    BeforePost = qryLitisBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPOOBJETO, VALORSENTENCA,'
      '      VALORRECL AS VALORRECLAMADO,'
      '               VALORRECL * PERCPROB /100 AS VALORPROVAVEL'
      'FROM OBJPROCTRAB'
      'WHERE NUMPROCTRAB = :NumProcTrab')
    ValidateWithMask = True
    Left = 527
    Top = 296
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NumProcTrab'
        ParamType = ptUnknown
      end>
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 191
    Top = 420
  end
  object qryTipoOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  TIPCODIGO,'
      '  TIPDESCRICAO'
      'FROM TIPOPER'
      'ORDER BY UPPER(TIPDESCRICAO)')
    ValidateWithMask = True
    Left = 267
    Top = 310
  end
  object qryTipoDesemb: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPRECDES,  DESCRICAO'
      'FROM TIPORECEBDESEMB '
      'WHERE (ANASINT  = '#39'A'#39') AND '
      '      (RECPAG   = '#39'P'#39')'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 520
    Top = 358
  end
  object qryTipoDoc: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT '
      '  CODTIPDOC, DESCRICAO, DEBCRE'
      'FROM'
      '  TIPODOCRECPAG'
      'WHERE'
      '  (RECPAG = '#39'P'#39')'
      'ORDER BY'
      '  UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 592
    Top = 358
  end
  object qryDocumentos: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  D.CODDOCUMENTO, D.PLANO, D.PLACONTA, L.PLNCODIGO, L.NUMLANCTO,'
      
        '  R.UNIDNEGOC, R.CODCENTRORESPON, R.CODTIPRECDES, R.VALOR, D.COD' +
        'PORTFORMA,'
      '  L.DEBCRE, 1 PORTFORMAPARTICIP, R.CODCENTROCUSTO'
      'FROM'
      '  DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R'
      'WHERE'
      '  (D.CODDOCUMENTO = :CODDOCUMENTO)  AND'
      '  (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '  (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      'ORDER BY'
      '  D.PLACONTA, R.UNIDNEGOC, R.CODCENTRORESPON, R.CODTIPRECDES')
    UpdateObject = updDocumentos
    ValidateWithMask = True
    Left = 685
    Top = 295
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qryDocumentosCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'RATEIODOCUM.CODTIPRECDES'
      Size = 15
    end
    object qryDocumentosCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'DOCUMENTO.CODDOCUMENTO'
    end
    object qryDocumentosPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'DOCUMENTO.PLANO'
    end
    object qryDocumentosPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'DOCUMENTO.PLACONTA'
      Size = 18
    end
    object qryDocumentosPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'LANCTODOCUM.PLNCODIGO'
    end
    object qryDocumentosNUMLANCTO: TFloatField
      FieldName = 'NUMLANCTO'
      Origin = 'LANCTODOCUM.NUMLANCTO'
    end
    object qryDocumentosUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'RATEIODOCUM.UNIDNEGOC'
    end
    object qryDocumentosCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'RATEIODOCUM.CODCENTRORESPON'
      Size = 10
    end
    object qryDocumentosVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'RATEIODOCUM.VALOR'
    end
    object qryDocumentosCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'DOCUMENTO.CODPORTFORMA'
    end
    object qryDocumentosDEBCRE: TStringField
      FieldName = 'DEBCRE'
      Origin = 'LANCTODOCUM.DEBCRE'
      Size = 1
    end
    object qryDocumentosPORTFORMAPARTICIP: TFloatField
      FieldName = 'PORTFORMAPARTICIP'
    end
    object qryDocumentosCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Size = 10
    end
  end
  object updDocumentos: TUpdateSQL
    ModifySQL.Strings = (
      'update documento'
      'set'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  PLANO = :PLANO,'
      '  PLACONTA = :PLACONTA,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  NUMLANCTO = :NUMLANCTO,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  VALOR = :VALOR,'
      '  PORTFORMAPARTICIP = :PORTFORMAPARTICIP'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    InsertSQL.Strings = (
      'insert into documento'
      
        '  (CODDOCUMENTO, PLANO, PLACONTA, PLNCODIGO, NUMLANCTO, UNIDNEGO' +
        'C, CODCENTRORESPON, '
      '   CODTIPRECDES, VALOR, PORTFORMAPARTICIP)'
      'values'
      
        '  (:CODDOCUMENTO, :PLANO, :PLACONTA, :PLNCODIGO, :NUMLANCTO, :UN' +
        'IDNEGOC, '
      '   :CODCENTRORESPON, :CODTIPRECDES, :VALOR, :PORTFORMAPARTICIP)')
    DeleteSQL.Strings = (
      'delete from documento'
      'where'
      '  CODDOCUMENTO = :OLD_CODDOCUMENTO')
    Left = 687
    Top = 280
  end
  object qrySubContaAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODSUBCONTA,IDPESSOA,NOMESUBCONTA'
      'FROM SUBCONTA'
      'WHERE IDPESSOA             = :IDPESSOA'
      'AND       NOMESUBCONTA = :NOMESUBCONTA')
    ValidateWithMask = True
    Left = 619
    Top = 251
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NOMESUBCONTA'
        ParamType = ptUnknown
      end>
  end
  object qryRequerente: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  NOME'
      'FROM'
      '  PESSOA'
      'WHERE'
      '  (IDPESSOA = :IDPESSOA)')
    ValidateWithMask = True
    Left = 591
    Top = 296
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryHonorDELETE: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM HONORARIOS'
      'WHERE NUMPROCTRAB = :NUMPROCTRAB ')
    UpdateObject = updHonorDELETE
    ValidateWithMask = True
    Left = 684
    Top = 382
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMPROCTRAB'
        ParamType = ptUnknown
      end>
  end
  object updHonorDELETE: TUpdateSQL
    ModifySQL.Strings = (
      'update HONORARIOS'
      'set'
      '  NUMPROCTRAB = :NUMPROCTRAB,'
      '  DATAPAGTOHONOR = :DATAPAGTOHONOR,'
      '  IDFORNSERV = :IDFORNSERV,'
      '  VALORHONOR = :VALORHONOR,'
      'where'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB')
    InsertSQL.Strings = (
      'insert into HONORARIOS'
      '  (NUMPROCTRAB, DATAPAGTOHONOR, IDFORNSERV, VALORHONOR)'
      'values'
      '  (:NUMPROCTRAB, :DATAPAGTOHONOR, :IDFORNSERV, :VALORHONOR)')
    DeleteSQL.Strings = (
      'delete from HONORARIOS'
      'where'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB')
    Left = 684
    Top = 369
  end
  object qryMotivo: TwwQuery
    Tag = 5
    CachedUpdates = True
    AfterInsert = qryAfterInsert
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDMOTIVO, DESCRICAO'
      'FROM'
      '  MOTIVO'
      'WHERE'
      '  (GRUPOMOTIVO = '#39'O'#39')'
      'ORDER BY'
      '  UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 410
    Top = 238
  end
  object qryTRT: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CODIGOTRT, DESCRICAO from TRT '
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 367
    Top = 411
  end
  object qryObjeto: TwwQuery
    CachedUpdates = True
    AfterInsert = qryObjetoAfterInsert
    BeforeEdit = qryObjetoBeforeEdit
    BeforePost = qryObjetoBeforePost
    AfterPost = qryObjetoAfterPost
    OnCalcFields = qryObjetoCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT O.NUMPROCTRAB,'
      '       O.CODTIPOOBJETO,'
      '       O.VALORRECL,'
      '       O.PERCPROB,'
      '       O.PERCORIG,'
      '       O.VALORSENTENCA,'
      '       O.INDVALOR,'
      '       O.DATAINICIO,'
      '       O.DATAFINAL,'
      '       O.OBSERVACAO,'
      '       T.DESCRICAO'
      'FROM OBJPROCTRAB O, TIPOOBJPROCTRAB T'
      'WHERE O.NUMPROCTRAB = :NUMPROCTRAB'
      'AND   O.CODTIPOOBJETO = T.CODTIPOOBJETO'
      'ORDER  BY  UPPER(T.DESCRICAO)')
    UpdateObject = updObjeto
    ValidateWithMask = True
    Left = 11
    Top = 315
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMPROCTRAB'
        ParamType = ptUnknown
      end>
    object qryObjetoDESCRICAO: TStringField
      DisplayLabel = 'Descrição do Objeto Reclamado'
      DisplayWidth = 40
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object qryObjetoVALORRECL: TFloatField
      DisplayLabel = 'Valor Reclamado'
      DisplayWidth = 16
      FieldName = 'VALORRECL'
    end
    object qryObjetoPERCPROB: TFloatField
      DisplayLabel = 'Probab. Contraparte (%)'
      DisplayWidth = 17
      FieldName = 'PERCPROB'
    end
    object qryObjetoVALORESPERADO: TFloatField
      DisplayLabel = 'Valor Estimado'
      DisplayWidth = 12
      FieldKind = fkCalculated
      FieldName = 'VALORESPERADO'
      Calculated = True
    end
    object qryObjetoVALORSENTENCA: TFloatField
      DisplayLabel = 'Valor Real'
      DisplayWidth = 10
      FieldName = 'VALORSENTENCA'
    end
    object qryObjetoOBSERVACAO: TStringField
      DisplayLabel = 'Observação'
      DisplayWidth = 240
      FieldName = 'OBSERVACAO'
      Size = 240
    end
    object qryObjetoNUMPROCTRAB: TFloatField
      FieldName = 'NUMPROCTRAB'
      Visible = False
    end
    object qryObjetoCODTIPOOBJETO: TFloatField
      FieldName = 'CODTIPOOBJETO'
      Visible = False
    end
    object qryObjetoINDVALOR: TFloatField
      FieldName = 'INDVALOR'
      Visible = False
    end
    object qryObjetoDATAINICIO: TDateTimeField
      FieldName = 'DATAINICIO'
      Visible = False
    end
    object qryObjetoDATAFINAL: TDateTimeField
      FieldName = 'DATAFINAL'
      Visible = False
    end
    object qryObjetoPERCORIG: TFloatField
      FieldName = 'PERCORIG'
      Visible = False
    end
  end
  object updObjeto: TUpdateSQL
    ModifySQL.Strings = (
      'update OBJPROCTRAB'
      'set'
      '  CODTIPOOBJETO = :CODTIPOOBJETO,'
      '  VALORRECL = :VALORRECL,'
      '  PERCPROB = :PERCPROB,'
      '  VALORSENTENCA = :VALORSENTENCA,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  INDVALOR = :INDVALOR,'
      '  DATAINICIO = :DATAINICIO,'
      '  DATAFINAL = :DATAFINAL,'
      '  PERCORIG = :PERCORIG'
      'where'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB and'
      '  CODTIPOOBJETO = :OLD_CODTIPOOBJETO')
    InsertSQL.Strings = (
      'insert into OBJPROCTRAB'
      '  (NUMPROCTRAB, CODTIPOOBJETO, VALORRECL, PERCPROB, '
      'VALORSENTENCA, OBSERVACAO, '
      '   INDVALOR, DATAINICIO, DATAFINAL, PERCORIG)'
      'values'
      '  (:NUMPROCTRAB, :CODTIPOOBJETO, :VALORRECL, :PERCPROB, '
      ':VALORSENTENCA, '
      '   :OBSERVACAO, :INDVALOR, :DATAINICIO, :DATAFINAL, :PERCORIG)')
    DeleteSQL.Strings = (
      'delete from OBJPROCTRAB'
      'where'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB and'
      '  CODTIPOOBJETO = :OLD_CODTIPOOBJETO')
    Left = 11
    Top = 301
  end
  object qryProcVincDELETE: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM PROCESSOTRAB'
      'WHERE IDPROCVINCULADO = :NUMPROCTRAB')
    UpdateObject = updProcVincDELETE
    ValidateWithMask = True
    Left = 683
    Top = 355
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMPROCTRAB'
        ParamType = ptUnknown
      end>
  end
  object updProcVincDELETE: TUpdateSQL
    ModifySQL.Strings = (
      'update PROCESSOTRAB'
      'set'
      '  IDPROCVINCULADO = :IDPROCVINCULADO'
      'where'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB')
    InsertSQL.Strings = (
      'insert into PROCESSOTRAB'
      '  (IDPROCVINCULADO)'
      'values'
      '  (:IDPROCVINCULADO)')
    DeleteSQL.Strings = (
      'delete from PROCESSOTRAB'
      'where'
      '  NUMPROCTRAB = :OLD_NUMPROCTRAB')
    Left = 683
    Top = 341
  end
  object qryVerificaProcesso: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT '
      '  NUMPROCTRAB, INDMATERIA'
      'FROM'
      '  PROCESSOTRAB'
      'WHERE'
      '  (PROCJCJNUM = :NUMPROC)'
      'ORDER BY'
      '  NUMPROCTRAB')
    ValidateWithMask = True
    Left = 664
    Top = 142
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMPROC'
        ParamType = ptUnknown
      end>
  end
end
