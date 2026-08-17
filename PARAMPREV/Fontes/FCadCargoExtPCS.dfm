inherited frmCadCargoExtPCS: TfrmCadCargoExtPCS
  Left = 202
  Top = 128
  HelpContext = 160147
  Caption = 'Cadastro de Cargos e Funções'
  ClientHeight = 473
  ClientWidth = 691
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 691
    Height = 387
    inherited pnlMestre: TPanel
      Width = 689
      Height = 230
      Align = alClient
      object Label2: TLabel
        Left = 94
        Top = 53
        Width = 35
        Height = 13
        Caption = 'Título'
      end
      object lblCodigo: TLabel
        Left = 9
        Top = 53
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object lblNomeResumido: TLabel
        Left = 488
        Top = 53
        Width = 92
        Height = 13
        Caption = 'Nome Resumido'
      end
      object pnlCargo: TPanel
        Left = 0
        Top = 90
        Width = 681
        Height = 108
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        object lblCarreira: TLabel
          Left = 95
          Top = -1
          Width = 45
          Height = 13
          Caption = 'Carreira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblDesc: TLabel
          Left = 95
          Top = 35
          Width = 58
          Height = 13
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPCS: TLabel
          Left = 95
          Top = 70
          Width = 154
          Height = 13
          Caption = 'Plano de Cargos e Salários'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblJornada: TLabel
          Left = 488
          Top = 35
          Width = 46
          Height = 13
          Caption = 'Jornada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblHs: TLabel
          Left = 553
          Top = 56
          Width = 14
          Height = 13
          Caption = 'hs'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCBO: TLabel
          Left = 488
          Top = -1
          Width = 26
          Height = 13
          Caption = 'CBO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dblkpcmbCarreira: TwwDBLookupCombo
          Left = 95
          Top = 12
          Width = 386
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'Carreira'
            'CODIGO'#9'15'#9'Código')
          DataField = 'IDCARREIRA'
          DataSource = ds
          LookupTable = qryCarreira
          LookupField = 'IDCARREIRA'
          Options = [loTitles]
          Color = clWhite
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object dbedDescricao: TwwDBEdit
          Left = 95
          Top = 48
          Width = 386
          Height = 21
          DataField = 'DESCRICAO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dblkpcmbPCS: TwwDBLookupCombo
          Left = 95
          Top = 84
          Width = 386
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'Plano de Cargos e Salários')
          DataField = 'IDPCS'
          DataSource = ds
          LookupTable = qryPCS
          LookupField = 'IDPCS'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object dbspedJornada: TwwDBSpinEdit
          Left = 488
          Top = 48
          Width = 65
          Height = 21
          Increment = 1
          MaxValue = 1000
          DataField = 'JORNADA'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          UnboundDataType = wwDefault
        end
        object dbedCBO: TwwDBEdit
          Left = 488
          Top = 12
          Width = 67
          Height = 21
          DataField = 'CBO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 5
          ParentFont = False
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
      object pnlFuncao: TPanel
        Left = 0
        Top = 90
        Width = 681
        Height = 121
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object lblDescricao: TLabel
          Left = 95
          Top = 0
          Width = 90
          Height = 13
          Caption = 'Tipo de Função'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblFuncaoCorresp: TLabel
          Left = 95
          Top = 35
          Width = 214
          Height = 13
          Caption = 'Função Correspondente na Fundação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object sbtnBuscaFuncaoCorresp: TSpeedButton
          Left = 460
          Top = 48
          Width = 21
          Height = 23
          Hint = 'Selecionar Função Correspondente'
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
            300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
            330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
            333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
            339977FF777777773377000BFB03333333337773FF733333333F333000333333
            3300333777333333337733333333333333003333333333333377333333333333
            333333333333333333FF33333333333330003333333333333777333333333333
            3000333333333333377733333333333333333333333333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnBuscaFuncaoCorrespClick
        end
        object Label1: TLabel
          Left = 95
          Top = 70
          Width = 93
          Height = 13
          Caption = 'Data da Criação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dblkpcmbTipoFunc: TCMDBLookupCombo
          Left = 95
          Top = 13
          Width = 386
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'60'#9'Descrição')
          DataField = 'IDTIPOFUNC'
          DataSource = ds
          LookupTable = qryTipoFunc
          LookupField = 'IDTIPOFUNC'
          Options = [loTitles]
          Style = csDropDownList
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dblkpcmbFuncaoCorresp: TwwDBLookupCombo
          Left = 95
          Top = 49
          Width = 359
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'TITULO'#9'40'#9'Título'#9'F'
            'CODIGO'#9'15'#9'Código'#9'F')
          DataField = 'IDCARGOCORRESP'
          DataSource = ds
          LookupTable = qryFuncaoCorresp
          LookupField = 'IDCARGOEXT'
          Options = [loTitles]
          ParentFont = False
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object dbrgrpFLGPCC: TDBRadioGroup
          Left = 488
          Top = -2
          Width = 124
          Height = 45
          Hint = 'Indica se o cargo pertence a Plano de Cargo Comissionado'
          Caption = ' Pertence a PCC '
          DataField = 'FLGPCC'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Não'
            'Sim')
          ParentFont = False
          TabOrder = 1
          TabStop = True
          Values.Strings = (
            '0'
            '1')
        end
        object dbgrpAtivo: TDBRadioGroup
          Left = 488
          Top = 43
          Width = 124
          Height = 55
          DataField = 'FLGATIVO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Ativa'
            'Desativada'
            'em Extinção')
          ParentFont = False
          TabOrder = 3
          TabStop = True
          Values.Strings = (
            '1'
            '0'
            '2')
        end
        object CMDateTimePicker1: TCMDateTimePicker
          Left = 95
          Top = 84
          Width = 121
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'DATACRIACAO'
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
      object dbedTitulo: TwwDBEdit
        Left = 95
        Top = 67
        Width = 386
        Height = 21
        DataField = 'TITULO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object stPatro: TStaticText
        Left = 8
        Top = 1
        Width = 112
        Height = 23
        Caption = 'Patrocinadora :'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 5
      end
      object stNomePatro: TStaticText
        Left = 133
        Top = 1
        Width = 98
        Height = 23
        Caption = 'stNomePatro'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 6
      end
      object dbedCodigoCargoExt: TDBEdit
        Left = 8
        Top = 67
        Width = 73
        Height = 21
        DataField = 'CODIGO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnExit = dbedCodigoCargoExtExit
      end
      object dbedNomeResumido: TDBEdit
        Left = 488
        Top = 67
        Width = 187
        Height = 21
        DataField = 'NOMERESUMIDO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object dbgrpCargoFuncao: TDBRadioGroup
        Left = 9
        Top = 18
        Width = 187
        Height = 33
        Columns = 2
        DataField = 'TIPO'
        DataSource = ds
        Items.Strings = (
          'Cargo'
          'Função')
        TabOrder = 4
        TabStop = True
        Values.Strings = (
          'C'
          'F')
        OnClick = dbgrpCargoFuncaoClick
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 231
      Width = 689
      Height = 155
      Align = alBottom
      Tabs.Strings = (
        'Codificação na Patrocinadora'
        'Grupos de Função'
        'Níveis de Cargo')
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgrdGrupo'
        'dbgrdNivel')
      inherited pgctrlDetalhe: TPageControl
        Width = 591
        Height = 96
        inherited tbsDet: TTabSheet
          Caption = 'Codificação na Patrocinadora'
          inherited pnlControlesDet: TPanel [0]
            Width = 583
            Height = 68
            object Label9: TLabel
              Left = 8
              Top = 22
              Width = 93
              Height = 13
              Caption = 'Data da Criação'
            end
            object Label10: TLabel
              Left = 144
              Top = 22
              Width = 99
              Height = 13
              Caption = 'Data da Extinção'
            end
            object Label11: TLabel
              Left = 280
              Top = 22
              Width = 141
              Height = 13
              Caption = 'Código na Patrocinadora'
            end
            object dbedCodigo: TwwDBEdit
              Left = 280
              Top = 38
              Width = 121
              Height = 21
              DataField = 'CODPATRO'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedDataFinal: TCMDateTimePicker
              Left = 144
              Top = 38
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAFIM'
              DataSource = dsDet
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
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 1
            end
            object dbedDataInicio: TCMDateTimePicker
              Left = 8
              Top = 38
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAINICIO'
              DataSource = dsDet
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
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 0
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 583
            Height = 68
            Selected.Strings = (
              'DATAINICIO'#9'20'#9'Data da Criação'
              'DATAFIM'#9'20'#9'Data da Extinção'#9'F'
              'CODPATRO'#9'25'#9'Código na Patrocinadora')
          end
        end
        object tbsGrupo: TTabSheet
          Caption = 'Grupos de Função'
          object pnlControlesGrupo: TPanel
            Left = 0
            Top = 0
            Width = 583
            Height = 68
            Align = alClient
            BevelOuter = bvNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Label12: TLabel
              Left = 279
              Top = 15
              Width = 105
              Height = 13
              Caption = 'Início da Vigência'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label13: TLabel
              Left = 12
              Top = 15
              Width = 94
              Height = 13
              Caption = 'Grupo Funcional'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblFimVigencia: TLabel
              Left = 432
              Top = 16
              Width = 91
              Height = 13
              Caption = 'Fim da Vigência'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedInicioVigGrupo: TCMDateTimePicker
              Left = 279
              Top = 30
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAVIGENCIA'
              DataSource = dsGrupo
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
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 1
            end
            object dblkpcmbGrupoFunc: TwwDBLookupCombo
              Left = 12
              Top = 30
              Width = 237
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Grupo Funcional'
                'CODIGO'#9'15'#9'Código')
              DataField = 'IDGRUPOFUNC'
              DataSource = dsGrupo
              LookupTable = qryGrupoFunc
              LookupField = 'IDGRUPOFUNC'
              Options = [loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dbedFimVigGrupo: TCMDateTimePicker
              Left = 432
              Top = 30
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAFIM'
              DataSource = dsGrupo
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
              TabOrder = 2
            end
          end
          object dbgrdGrupo: TwwDBGrid
            Left = 0
            Top = 0
            Width = 583
            Height = 68
            Selected.Strings = (
              'CODIGO'#9'10'#9'Código do ~Grupo'
              'NOME'#9'35'#9'Grupo de Função'
              'DATAVIGENCIA'#9'10'#9'Início da ~Vigência'
              'DATAFIM'#9'10'#9'Término da ~Vigência')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsGrupo
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
        object tbsNivel: TTabSheet
          Caption = 'Níveis de Cargo'
          object dbgrdNivel: TwwDBGrid
            Left = 0
            Top = 0
            Width = 583
            Height = 68
            Selected.Strings = (
              'CODIGO'#9'16'#9'Nível'
              'DATAVIGENCIA'#9'13'#9'Início da ~Vigência'
              'DATAFIM'#9'10'#9'Término da ~Vigência')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsNivel
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object pnlControlesNivel: TPanel
            Left = 0
            Top = 0
            Width = 583
            Height = 68
            Align = alClient
            BevelOuter = bvNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object Label14: TLabel
              Left = 282
              Top = 15
              Width = 105
              Height = 13
              Caption = 'Início da Vigência'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label15: TLabel
              Left = 12
              Top = 15
              Width = 91
              Height = 13
              Caption = 'Nível Funcional'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object lblDataFimNivel: TLabel
              Left = 433
              Top = 16
              Width = 91
              Height = 13
              Caption = 'Fim da Vigência'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedInicioVigNivel: TCMDateTimePicker
              Left = 282
              Top = 30
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAVIGENCIA'
              DataSource = dsNivel
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
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 1
            end
            object dblkpcmbNivelFunc: TwwDBLookupCombo
              Left = 12
              Top = 30
              Width = 245
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODIGO'#9'15'#9'Código')
              DataField = 'IDNIVEL'
              DataSource = dsNivel
              LookupTable = qryNivelFunc
              LookupField = 'IDNIVEL'
              Options = [loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dbedDataFimNivel: TCMDateTimePicker
              Left = 432
              Top = 30
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAFIM'
              DataSource = dsNivel
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
              TabOrder = 2
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 681
      end
      inherited Dock974: TDock97
        Left = 595
        Height = 96
      end
    end
  end
  inherited Dock972: TDock97
    Width = 691
  end
  inherited Dock971: TDock97
    Top = 434
    Width = 691
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 1033
    Top = 65502
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 390
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 388
    Top = 45
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CARGOEXT'
      'set'
      '  CODIGO = :CODIGO,'
      '  IDPCS = :IDPCS,'
      '  TITULO = :TITULO,'
      '  DESCRICAO = :DESCRICAO,'
      '  CBO = :CBO,'
      '  TIPO = :TIPO,'
      '  JORNADA = :JORNADA,'
      '  FLGATIVO = :FLGATIVO,'
      '  IDCARREIRA = :IDCARREIRA,'
      '  IDTIPOFUNC = :IDTIPOFUNC,'
      '  NOMERESUMIDO = :NOMERESUMIDO,'
      '  FLGPCC = :FLGPCC,'
      '  IDCARGOCORRESP = :IDCARGOCORRESP,'
      '  DATACRIACAO = :DATACRIACAO'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDCARGOEXT = :OLD_IDCARGOEXT')
    InsertSQL.Strings = (
      'insert into CARGOEXT'
      
        '  (IDPESSJUR, IDFAIXASALEXT, IDCARGOEXT, CODIGO, IDPCS, TITULO, ' +
        'DESCRICAO, '
      
        '   CBO, TIPO, JORNADA, FLGATIVO, IDCARREIRA, IDTIPOFUNC, NOMERES' +
        'UMIDO, '
      '   FLGPCC, IDCARGOCORRESP, DATACRIACAO)'
      'values'
      
        '  (:IDPESSJUR, :IDFAIXASALEXT, :IDCARGOEXT, :CODIGO, :IDPCS, :TI' +
        'TULO, :DESCRICAO, '
      
        '   :CBO, :TIPO, :JORNADA, :FLGATIVO, :IDCARREIRA, :IDTIPOFUNC, :' +
        'NOMERESUMIDO, '
      '   :FLGPCC, :IDCARGOCORRESP, :DATACRIACAO)')
    DeleteSQL.Strings = (
      'delete from CARGOEXT'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDCARGOEXT = :OLD_IDCARGOEXT')
    Left = 469
    Top = 45
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Cargos ou Funções '
    Colunas.Strings = (
      'CARGOEXT.CODIGO'
      'CARGOEXT.TITULO'
      'PCS.CODIGO'
      'CARGOEXT.NOMERESUMIDO'
      'CARGOEXT.TIPO')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Título do Cargo ou Função'
      'Código do PCS'
      'Nome Resumido'
      'Cargo (C) ou Função (F)')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CARGOEXT'
      'PCS')
    CamposChave.Strings = (
      'CARGOEXT.IDPESSJUR'
      'CARGOEXT.IDCARGOEXT')
    Filtro.Strings = (
      'CARGOEXT.IDPCS = PCS.IDPCS(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '40'
      '10'
      '15'
      '1')
    Left = 345
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 1036
    Top = 65497
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 256
    Top = 1
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    SQL.Strings = (
      
        'SELECT IDPESSJUR, IDFAIXASALEXT, IDCARGOEXT, CODIGO, IDPCS, TITU' +
        'LO, DESCRICAO, CBO, TIPO,'
      
        '       JORNADA, FLGATIVO, IDCARREIRA, IDTIPOFUNC, NOMERESUMIDO, ' +
        'FLGPCC,'
      '       IDCARGOCORRESP, DATACRIACAO '
      'FROM   CARGOEXT'
      'WHERE  IDPESSJUR  = :IDPESSJUR'
      'AND    IDCARGOEXT = :IDCARGOEXT'
      ' ')
    Left = 429
    Top = 45
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARGOEXT'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 301
    Top = 1
  end
  object qryPCS: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPCS, NOME'
      'FROM PCS'
      'WHERE IDPESSJUR = :IDPESSJUR'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 693
    Top = 125
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryCarreira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCARREIRA, CODIGO, NOME FROM CARREIRA'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 669
    Top = 93
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSJUR, IDCARGOEXT, DATAINICIO, CODPATRO, DATAFIM'
      'FROM CARGOEXTXPESS'
      'WHERE IDPESSJUR = :IDPESSJUR'
      'AND      IDCARGOEXT =:IDCARGOEXT'
      'ORDER BY DATAINICIO')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 434
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARGOEXT'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update CARGOEXTXPESS'
      'set'
      '  CODPATRO = :CODPATRO,'
      '  DATAFIM = :DATAFIM'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDCARGOEXT = :OLD_IDCARGOEXT and'
      '  DATAINICIO = :OLD_DATAINICIO')
    InsertSQL.Strings = (
      'insert into CARGOEXTXPESS'
      '  (IDPESSJUR, IDCARGOEXT, DATAINICIO, CODPATRO, DATAFIM)'
      'values'
      '  (:IDPESSJUR, :IDCARGOEXT, :DATAINICIO, :CODPATRO, :DATAFIM)')
    DeleteSQL.Strings = (
      'delete from CARGOEXTXPESS'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDCARGOEXT = :OLD_IDCARGOEXT and'
      '  DATAINICIO = :OLD_DATAINICIO')
    Left = 479
    Top = 1
  end
  object dsGrupo: TwwDataSource
    AutoEdit = False
    DataSet = qryGrupo
    Left = 526
  end
  object qryGrupo: TwwQuery
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT GC.IDGRUPOFUNC, GC.IDPESSJUR, GC.IDCARGOEXT, GC.DATAVIGEN' +
        'CIA,'
      '       G.CODIGO, G.NOME, GC.DATAFIM, GC.IDPESSJURGRUPO'
      'FROM  GRUPOFUNC G, GRUPOCARGOEXT GC'
      'WHERE GC.IDPESSJUR   = :IDPESSJUR'
      'AND   GC.IDCARGOEXT  = :IDCARGOEXT'
      'AND   GC.IDPESSJURGRUPO = G.IDPESSJUR'
      'AND   GC.IDGRUPOFUNC   = G.IDGRUPOFUNC'
      'ORDER BY GC.DATAVIGENCIA')
    UpdateObject = updGrupo
    ValidateWithMask = True
    Left = 566
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARGOEXT'
        ParamType = ptUnknown
      end>
  end
  object updGrupo: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPOCARGOEXT'
      'set'
      '  IDGRUPOFUNC = :IDGRUPOFUNC,'
      '  DATAVIGENCIA = :DATAVIGENCIA,'
      '  DATAFIM = :DATAFIM,'
      '  IDPESSJURGRUPO = :IDPESSJURGRUPO'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDCARGOEXT = :OLD_IDCARGOEXT and'
      '  DATAVIGENCIA = :OLD_DATAVIGENCIA')
    InsertSQL.Strings = (
      'insert into GRUPOCARGOEXT'
      '  (IDGRUPOFUNC, IDPESSJUR, IDCARGOEXT, DATAVIGENCIA, DATAFIM, '
      'IDPESSJURGRUPO)'
      'values'
      
        '  (:IDGRUPOFUNC, :IDPESSJUR, :IDCARGOEXT, :DATAVIGENCIA, :DATAFI' +
        'M, '
      ':IDPESSJURGRUPO)')
    DeleteSQL.Strings = (
      'delete from GRUPOCARGOEXT'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDCARGOEXT = :OLD_IDCARGOEXT and'
      '  DATAVIGENCIA = :OLD_DATAVIGENCIA')
    Left = 606
  end
  object qryGrupoFunc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDGRUPOFUNC, CODIGO, NOME'
      'FROM GRUPOFUNC'
      'WHERE IDPESSJUR = :IDPESSJUR'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 665
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object dsNivel: TwwDataSource
    AutoEdit = False
    DataSet = qryNivel
    Left = 527
    Top = 45
  end
  object qryNivel: TwwQuery
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CN.IDNIVEL , CN.IDPESSJUR, CN.IDCARGOEXT, CN.DATAVIGENCIA' +
        ','
      '       N.CODIGO, CN.DATAFIM, CN.IDPESSJURNIVEL'
      'FROM  NIVEL N, CARGOXNIVEL CN'
      'WHERE CN.IDPESSJUR   = :IDPESSJUR'
      'AND   CN.IDCARGOEXT  = :IDCARGOEXT'
      'AND   CN.IDNIVEL     = N.IDNIVEL    '
      'AND   CN.IDPESSJUR = N.IDPESSJUR '
      'ORDER BY CN.DATAVIGENCIA')
    UpdateObject = updNivel
    ValidateWithMask = True
    Left = 567
    Top = 45
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARGOEXT'
        ParamType = ptUnknown
      end>
  end
  object updNivel: TUpdateSQL
    ModifySQL.Strings = (
      'update CARGOXNIVEL'
      'set'
      '  IDNIVEL = :IDNIVEL,'
      '  DATAVIGENCIA = :DATAVIGENCIA,'
      '  DATAFIM = :DATAFIM,'
      '  IDPESSJURNIVEL = :IDPESSJURNIVEL'
      'where'
      '  IDNIVEL = :OLD_IDNIVEL and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDCARGOEXT = :OLD_IDCARGOEXT and'
      '  DATAVIGENCIA = :OLD_DATAVIGENCIA')
    InsertSQL.Strings = (
      'insert into CARGOXNIVEL'
      
        '  (IDNIVEL, IDPESSJUR, IDCARGOEXT, DATAVIGENCIA, DATAFIM, IDPESS' +
        'JURNIVEL)'
      'values'
      
        '  (:IDNIVEL, :IDPESSJUR, :IDCARGOEXT, :DATAVIGENCIA, :DATAFIM, :' +
        'IDPESSJURNIVEL)')
    DeleteSQL.Strings = (
      'delete from CARGOXNIVEL'
      'where'
      '  IDNIVEL = :OLD_IDNIVEL and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDCARGOEXT = :OLD_IDCARGOEXT and'
      '  DATAVIGENCIA = :OLD_DATAVIGENCIA')
    Left = 607
    Top = 45
  end
  object qryNivelFunc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDNIVEL, CODIGO'
      'FROM NIVEL'
      'WHERE IDPESSJUR = :IDPESSJUR'
      'ORDER BY CODIGO')
    ValidateWithMask = True
    Left = 670
    Top = 45
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryTipoFunc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOFUNC, DESCRICAO'
      'FROM TIPOFUNC'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 661
    Top = 212
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 660
    Top = 9
  end
  object qryFuncaoCorresp: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT IDCARGOEXT, CODIGO, TITULO'
      'FROM   CARGOEXT'
      'WHERE IDPESSJUR = :IDPESSJUR'
      'AND TIPO = '#39'F'#39' '
      'ORDER BY TITULO')
    ValidateWithMask = True
    Left = 514
    Top = 295
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object dsFuncaoCorresp: TwwDataSource
    AutoEdit = False
    DataSet = qryFuncaoCorresp
    Left = 482
    Top = 293
  end
  object MSFuncao: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Procurar Função ...'
    Colunas.Strings = (
      'C.CODIGO'
      'C.TITULO'
      'G.CODIGO'
      'G.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código da Função'
      'Função'
      'Código do Grupo'
      'Grupo Funcional')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'S'
      'N')
    Tabelas.Strings = (
      'CARGOEXT C'
      'GRUPOCARGOEXT GE'
      'GRUPOFUNC G')
    CamposChave.Strings = (
      'C.IDPESSJUR'
      'C.IDCARGOEXT'
      'G.IDGRUPOFUNC')
    Filtro.Strings = (
      'C.IDPESSJUR = 1'
      'C.TIPO         = '#39'F'#39
      'GE.IDPESSJUR   = C.IDPESSJUR'
      'GE.IDCARGOEXT  = C.IDCARGOEXT'
      'G.IDPESSJUR    = GE.IDPESSJUR'
      'G.IDGRUPOFUNC  = GE.IDGRUPOFUNC')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '40'
      '10'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 599
    Top = 298
  end
end
