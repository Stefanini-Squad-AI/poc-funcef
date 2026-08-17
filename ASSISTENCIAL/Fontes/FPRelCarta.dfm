inherited frmPRelCarta: TfrmPRelCarta
  Left = 30
  Top = 99
  Caption = 'Emissão Seletiva de Cartas '
  ClientHeight = 442
  ClientWidth = 744
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 744
    Height = 216
    inherited PageControl1: TPageControl
      Width = 734
      Height = 206
    end
  end
  inherited Dock971: TDock97
    Top = 403
    Width = 744
    inherited tb97Fundo: TToolbar97
      Left = 408
      DockPos = 408
      inherited rbtnVisualizar: TBitBtn
        OnClick = rbtnVisualizarClick
      end
      inherited rbtnImprimir: TBitBtn
        OnClick = rbtnImprimirClick
      end
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 216
    Width = 744
    Height = 187
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 1
    object Panel4: TPanel
      Left = 585
      Top = 1
      Width = 158
      Height = 185
      Align = alRight
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object sbtnTexto: TSpeedButton
        Left = 9
        Top = 84
        Width = 137
        Height = 37
        Hint = 'Editar ou Formatar texto'
        Caption = 'Editar'
        Glyph.Data = {
          96010000424D9601000000000000760000002800000018000000180000000100
          0400000000002001000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333380088333333333333333338007700833333
          3333333333307700770333000333300003307033003333090833309903077033
          3333330990000999030770333333333099999990330770833033333090000903
          3330708807033330990309033330770077033333090090333333007707033333
          099090333333330030333333309990338000033333333333309903300CCCC003
          3333333333090330CC00CCC03333333333090330C0330CC03333333333303330
          CC000CC03333333333333330CCCCCCC03333333333333330C0330C0333333333
          33333300C000CC0333333333333330CCCCCCCC03333333333333300000000033
          3333333333333333333333333333333333333333333333333333}
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnTextoClick
      end
      object bbtnEscolher: TBitBtn
        Left = 9
        Top = 6
        Width = 137
        Height = 37
        Caption = 'Escolher Carta'
        TabOrder = 0
        OnClick = bbtnEscolherClick
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888800008888888888888888888800008880000000000000000800008880
          FFFFFFFFFFFFFF0800008880FFFFF4444444FF0800008800FFFFFFFFFFFFFF08
          00008800FFFFF4444444FF0800008800FFFFFFFFFFFFFF0800008000FFFFFFFF
          FFF99F0800008000F4444FFFFFF99F0800008000FFFFFFFFFFFFFF0800008000
          00000000000000080000800F4444FFFFFF99F0880000800FFFFFFFFFFFFFF088
          000080000000000000000088000080F4444FFFFFF99F0888000080FFFFFFFFFF
          FFFF088800008000000000000000088800008888888888888888888800008888
          88888888888888880000}
      end
      object Panel3: TPanel
        Left = 9
        Top = 141
        Width = 137
        Height = 37
        BevelOuter = bvLowered
        TabOrder = 1
        object Label21: TLabel
          Left = 6
          Top = 9
          Width = 50
          Height = 13
          Caption = 'Nº de Vias'
        end
        object spedCopias: TSpinEdit
          Left = 66
          Top = 6
          Width = 64
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 0
          Value = 1
        end
      end
      object bbtnLocaliza: TBitBtn
        Left = 9
        Top = 45
        Width = 137
        Height = 37
        Hint = 'Localizar palavras em cartas'
        Caption = 'Localizar '
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Glyph.Data = {
          06020000424D0602000000000000760000002800000028000000140000000100
          0400000000009001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333BFBF
          BFBFBFBF3333333333333333333333333333FFFFFFFFFFFF3333333333333333
          333333333333BFBFBFBFBFBF3333333333333333333333333333FFFFFFFFFFFF
          3333333333333333333333333333BFBFBFBFBFBF333333333333333333333333
          3333FFFFFFFFFFFF33333333F3333333333333333330BFBFBFBFBFBF33333337
          FF3333333333333333010FFFFFFFFFFF333333777FF3333333333333330170BF
          BFBFBFBF3333337777FF3333333333333301170FFFFFFFFF333333777773F333
          3333333330711190BFBFBFBF3333377777373F3333333333308819990FFFFFFF
          33333733733373F333333333088FF9999033333333337333333FF73333333330
          88FFFF0003333333333733333F777333333333088FFF00333333333333733333
          7733333333333088FFF033333333333337333337333333333333088FFF093333
          333333337F33337333333333333308FFF09333333333333373F3373333333333
          333330FF0333333333333333373F733333333333333333003333333333333333
          33773333333333333333}
        NumGlyphs = 2
      end
    end
    object dbreTexto: TwwDBRichEdit
      Left = 1
      Top = 1
      Width = 584
      Height = 185
      ScrollBars = ssVertical
      Align = alClient
      AutoURLDetect = False
      DataField = 'TEXTO'
      DataSource = dsCarta
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PrintJobName = 'Delphi 5'
      ReadOnly = True
      TabOrder = 1
      EditorCaption = 'Edit Rich Text'
      EditorPosition.Left = 0
      EditorPosition.Top = 0
      EditorPosition.Width = 0
      EditorPosition.Height = 0
      MeasurementUnits = muInches
      PrintMargins.Top = 1
      PrintMargins.Bottom = 1
      PrintMargins.Left = 1
      PrintMargins.Right = 1
      RichEditVersion = 2
      Data = {
        0C0100007B5C727466315C616E73695C616E7369637067313235325C64656666
        305C6465667461623732307B5C666F6E7474626C7B5C66305C66737769737320
        4D532053616E732053657269663B7D7B5C66315C66726F6D616E5C6663686172
        736574322053796D626F6C3B7D7B5C66325C6673776973735C66636861727365
        7431204D532053616E732053657269663B7D7D0D0A7B5C636F6C6F7274626C5C
        726564305C677265656E305C626C7565303B7D0D0A5C6465666C616E67313033
        335C686F727A646F637B5C2A5C666368617273207D7B5C2A5C6C636861727320
        7D5C706172645C706C61696E5C66325C667331362064627265546578746F0D0A
        5C706172200D0A5C706172207D0D0A00}
    end
  end
  object pgctrlConsulta: TPageControl [3]
    Left = 0
    Top = 0
    Width = 744
    Height = 216
    ActivePage = tbsPrincipal
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object tbsPrincipal: TTabSheet
      Caption = 'Dados Principais'
      object GroupBox1: TGroupBox
        Left = 3
        Top = 3
        Width = 241
        Height = 91
        TabOrder = 0
        object LABEL1: TLabel
          Left = 6
          Top = 12
          Width = 66
          Height = 13
          Caption = 'Patrocinadora'
        end
        object label4: TLabel
          Left = 6
          Top = 51
          Width = 27
          Height = 13
          Caption = 'Plano'
        end
        object dblkpcmbPatro: TwwDBLookupCombo
          Left = 6
          Top = 27
          Width = 229
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'Patrocinadora')
          LookupField = 'NOME'
          Options = [loTitles]
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
        object dblkpcmbPlano: TwwDBLookupCombo
          Left = 6
          Top = 64
          Width = 229
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'50'#9'Plano')
          LookupField = 'NOME'
          Options = [loTitles]
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
      end
      object GroupBox5: TGroupBox
        Left = 251
        Top = 3
        Width = 332
        Height = 93
        Caption = 'Inscrição'
        TabOrder = 1
        object Label8: TLabel
          Left = 6
          Top = 15
          Width = 37
          Height = 13
          Caption = 'Número'
        end
        object Label9: TLabel
          Left = 135
          Top = 15
          Width = 23
          Height = 13
          Caption = 'Data'
        end
        object Label2: TLabel
          Left = 6
          Top = 53
          Width = 116
          Height = 13
          Caption = 'Situação do Participante'
        end
        object mskdlgDataInsc: TcmMaskEditDlg
          Left = 135
          Top = 27
          Width = 121
          Height = 21
          EditMask = '!99/99/0000;1;_'
          MaxLength = 10
          TabOrder = 0
          Text = '  /  /    '
          BtnNumGlyphs = 1
          BtnWidth = 17
        end
        object edNumInsc: TEdit
          Left = 6
          Top = 27
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object dblkpcmbSituacao: TwwDBLookupCombo
          Left = 6
          Top = 66
          Width = 250
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'Situação do Participante')
          LookupField = 'DESCRICAO'
          Options = [loTitles]
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
      end
      object RadioGroup1: TRadioGroup
        Left = 4
        Top = 99
        Width = 240
        Height = 67
        Caption = 'Participante'
        Items.Strings = (
          'Assistido'
          'Contribuinte'
          'Todos')
        TabOrder = 2
      end
      object rgrpStatusInsc: TRadioGroup
        Left = 251
        Top = 99
        Width = 332
        Height = 67
        Caption = 'Situação da Inscrição'
        Columns = 2
        Items.Strings = (
          'Normal'
          'Cancelada por Inadimplência'
          'Suspensa'
          'Cancelada por Desistência')
        TabOrder = 3
      end
    end
    object tbsAdicionais: TTabSheet
      Caption = 'Dados Adicionais'
      object GroupBox2: TGroupBox
        Left = 3
        Top = 3
        Width = 151
        Height = 49
        Caption = 'Faixa Etária'
        TabOrder = 0
        object Label6: TLabel
          Left = 9
          Top = 18
          Width = 14
          Height = 13
          Caption = 'De'
        end
        object Label7: TLabel
          Left = 69
          Top = 18
          Width = 6
          Height = 13
          Caption = 'a'
        end
        object Label10: TLabel
          Left = 117
          Top = 26
          Width = 23
          Height = 13
          Caption = 'anos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Edit1: TEdit
          Left = 30
          Top = 18
          Width = 37
          Height = 21
          TabOrder = 0
        end
        object Edit2: TEdit
          Left = 78
          Top = 18
          Width = 37
          Height = 21
          TabOrder = 1
        end
      end
      object GroupBox4: TGroupBox
        Left = 165
        Top = 3
        Width = 109
        Height = 49
        Caption = 'Tempo de Serviço'
        TabOrder = 1
        object Label11: TLabel
          Left = 51
          Top = 27
          Width = 23
          Height = 13
          Caption = 'anos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Edit7: TEdit
          Left = 12
          Top = 18
          Width = 37
          Height = 21
          TabOrder = 0
        end
      end
      object GroupBox3: TGroupBox
        Left = 3
        Top = 78
        Width = 271
        Height = 49
        Caption = 'Salário de Contribuição'
        TabOrder = 2
        object Label13: TLabel
          Left = 9
          Top = 18
          Width = 14
          Height = 13
          Caption = 'De'
        end
        object Label14: TLabel
          Left = 144
          Top = 18
          Width = 6
          Height = 13
          Caption = 'a'
        end
        object Edit3: TEdit
          Left = 30
          Top = 18
          Width = 106
          Height = 21
          TabOrder = 0
        end
        object Edit4: TEdit
          Left = 159
          Top = 18
          Width = 106
          Height = 21
          TabOrder = 1
        end
      end
      object GroupBox6: TGroupBox
        Left = 3
        Top = 135
        Width = 271
        Height = 49
        Caption = 'Salário Real'
        TabOrder = 3
        object Label15: TLabel
          Left = 9
          Top = 18
          Width = 14
          Height = 13
          Caption = 'De'
        end
        object Label16: TLabel
          Left = 144
          Top = 18
          Width = 6
          Height = 13
          Caption = 'a'
        end
        object Edit5: TEdit
          Left = 30
          Top = 18
          Width = 106
          Height = 21
          TabOrder = 0
        end
        object Edit6: TEdit
          Left = 159
          Top = 18
          Width = 106
          Height = 21
          TabOrder = 1
        end
      end
      object GroupBox7: TGroupBox
        Left = 279
        Top = 3
        Width = 208
        Height = 52
        TabOrder = 4
        object Label12: TLabel
          Left = 4
          Top = 9
          Width = 28
          Height = 13
          Caption = 'Cargo'
        end
        object wwDBLookupCombo1: TwwDBLookupCombo
          Left = 4
          Top = 24
          Width = 187
          Height = 21
          DropDownAlignment = taLeftJustify
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
      end
      object RadioGroup3: TRadioGroup
        Left = 423
        Top = 135
        Width = 94
        Height = 49
        Caption = 'Sexo'
        Items.Strings = (
          'Feminino'
          'Masculino')
        TabOrder = 5
      end
      object RadioGroup2: TRadioGroup
        Left = 276
        Top = 113
        Width = 145
        Height = 71
        Caption = 'Estado Civil'
        Items.Strings = (
          'Solteiro'
          'Casado'
          'Divorciado'
          'Viúvo')
        TabOrder = 6
      end
      object GroupBox8: TGroupBox
        Left = 493
        Top = 3
        Width = 238
        Height = 97
        TabOrder = 7
        object Label17: TLabel
          Left = 7
          Top = 12
          Width = 46
          Height = 13
          Caption = 'Benefício'
        end
        object Label18: TLabel
          Left = 7
          Top = 51
          Width = 59
          Height = 13
          Caption = 'Contribuição'
        end
        object wwDBLookupCombo2: TwwDBLookupCombo
          Left = 7
          Top = 24
          Width = 225
          Height = 21
          DropDownAlignment = taLeftJustify
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object wwDBLookupCombo3: TwwDBLookupCombo
          Left = 7
          Top = 66
          Width = 225
          Height = 21
          DropDownAlignment = taLeftJustify
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
      end
    end
    object tbsAvancada: TTabSheet
      Caption = 'Avançada'
      object lstTabelas: TListBox
        Left = 3
        Top = 3
        Width = 121
        Height = 181
        ItemHeight = 13
        Items.Strings = (
          'Participante'
          'Dependente'
          'Beneficiário'
          'Contribuição'
          'Benefício')
        TabOrder = 0
      end
      object pnlPesqAvanc: TPanel
        Left = 135
        Top = 3
        Width = 448
        Height = 181
        BevelOuter = bvLowered
        TabOrder = 1
        object Label3: TLabel
          Left = 6
          Top = 3
          Width = 33
          Height = 13
          Caption = 'Campo'
        end
        object Label5: TLabel
          Left = 6
          Top = 132
          Width = 46
          Height = 13
          Caption = 'Conteúdo'
        end
        object sbtnOU: TSpeedButton
          Left = 207
          Top = 62
          Width = 25
          Height = 25
          Hint = 'OU'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
            00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
            70E337F3333F333337F3E0F33303333370E337F3337FF33337F3E0F333003333
            70E337F33377FF3337F3E0F33300033370E337F333777FF337F3E0F333000033
            70E337F33377773337F3E0F33300033370E337F33377733337F3E0F333003333
            70E337F33377333337F3E0F33303333370E337F33373333337F3E0F333333333
            70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
            00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
        end
        object sbtnE: TSpeedButton
          Left = 207
          Top = 27
          Width = 25
          Height = 25
          Hint = 'E '
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
            00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
            70E337F33333333337F3E0F33333333370E337F333FF3F3337F3E0F330030333
            70E337F3377F7FF337F3E0F33003003370E337F3377F77FF37F3E0F330030003
            70E337F3377F777337F3E0F33003003370E337F3377F773337F3E0F330030333
            70E337F33773733337F3E0F33333333370E337F33333333337F3E0F333333333
            70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
            00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
        end
        object sbtnApagar: TSpeedButton
          Left = 207
          Top = 96
          Width = 25
          Height = 25
          Hint = 'Apagar linha'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
            00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
            70E337F33333333337F3E0F33333333370E337F3333F3FF337F3E0F333030033
            70E337F3337F77F337F3E0F33003003370E337F3377F77F337F3E0F300030033
            70E337F3777F77F337F3E0F33003003370E337F3377F77F337F3E0F333030033
            70E337F33373773337F3E0F33333333370E337F33333333337F3E0F333333333
            70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
            00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
        end
        object rgrpSinal: TRadioGroup
          Left = 6
          Top = 93
          Width = 193
          Height = 37
          Columns = 5
          Items.Strings = (
            '='
            '>'
            '<'
            '>='
            '<=')
          TabOrder = 0
        end
        object lstCampo: TListBox
          Left = 6
          Top = 15
          Width = 193
          Height = 76
          ItemHeight = 13
          TabOrder = 1
        end
        object edConteudo: TEdit
          Left = 6
          Top = 144
          Width = 166
          Height = 21
          TabOrder = 2
          Text = 'edConteudo'
        end
        object lstResult: TListBox
          Left = 237
          Top = 6
          Width = 208
          Height = 160
          ItemHeight = 13
          TabOrder = 3
        end
        object rgrpSexo: TRadioGroup
          Left = 6
          Top = 135
          Width = 151
          Height = 33
          Caption = 'rgrpSexo'
          Columns = 2
          Items.Strings = (
            'Fem.'
            'Masc.')
          TabOrder = 4
        end
        object rgrpFlag: TRadioGroup
          Left = 6
          Top = 135
          Width = 151
          Height = 33
          Caption = 'rgrpFlag'
          Columns = 2
          Items.Strings = (
            'Verdadeiro'
            'Falso')
          TabOrder = 5
        end
        object rgrpEstCivil: TRadioGroup
          Left = 6
          Top = 129
          Width = 151
          Height = 43
          Columns = 2
          Items.Strings = (
            'Solteiro'
            'Casado'
            'Divorciado'
            'Viúvo')
          TabOrder = 6
        end
        object mskedData: TcmMaskEditDlg
          Left = 138
          Top = 144
          Width = 88
          Height = 21
          EditMask = '!99/99/9999;1;_'
          MaxLength = 10
          TabOrder = 7
          Text = '  /  /    '
          BtnNumGlyphs = 1
          BtnWidth = 17
        end
        object mskedMes: TcmMaskEditDlg
          Left = 102
          Top = 142
          Width = 88
          Height = 21
          EditMask = '!9999/99;1;_'
          MaxLength = 7
          TabOrder = 8
          Text = '    /  '
          BtnNumGlyphs = 1
          BtnWidth = 17
        end
      end
    end
  end
  object dsCarta: TwwDataSource
    DataSet = qryCarta
    Left = 635
    Top = 349
  end
  object qryCarta: TwwQuery
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM CARTA')
    ValidateWithMask = True
    Left = 537
    Top = 352
  end
  object selDlgProcuraQry: TcmSelectDlg
    SearchControls = False
    Caption = 'Escolher Carta'
    DataSet = qryAux
    FieldNames.Strings = (
      'DATACARTA'
      'ASSUNTO')
    DisplayLabels.Strings = (
      'Data'
      'Assunto')
    AlwaysShow = False
    HelpContext = 0
    Left = 459
    Top = 355
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NUMCARTA,DATACARTA,ASSUNTO FROM CARTA')
    ValidateWithMask = True
    Left = 531
    Top = 298
  end
end
